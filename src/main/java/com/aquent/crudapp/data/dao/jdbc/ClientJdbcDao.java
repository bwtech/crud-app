package com.aquent.crudapp.data.dao.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.aquent.crudapp.data.dao.ClientDao;
import com.aquent.crudapp.domain.Client;

/**
 * Spring JDBC implementation of {@link ClientDao}.
 */
public class ClientJdbcDao implements ClientDao {
	
    private static final String SQL_LIST_CLIENTS = "SELECT cl.client_id, cl.company_name, cl.phone_number, cl.web_uri, cl.street_address AS cl_street_address,"
    		                                           + " cl.city AS cl_city, cl.state AS cl_state, cl.zip_code AS cl_zip_code, ps.person_id, ps.first_name,"
    		                                           + "ps.last_name, ps.email_address, ps.street_address, ps.city, ps.state, ps.zip_code"
    		                                   + " FROM client cl"
    		                                   + " LEFT JOIN client_person cp ON cl.client_id = cp.client_id"
                                               + " LEFT JOIN person ps on ps.person_id = cp.person_id"
                                               + " ORDER BY cl.company_name";
    
    
    /** Gets the results associated with the specification that a client can have 0, 1, or many contacts */
    private static final String SQL_READ_CLIENT = "SELECT cl.client_id, cl.company_name, cl.phone_number, cl.web_uri,"
    		                                          + " cl.street_address AS cl_street_address, cl.city AS cl_city,"
    		                                          + " cl.state AS cl_state, cl.zip_code AS cl_zip_code,"
    		                                          + " ps.person_id, ps.first_name, ps.last_name, ps.email_address, ps.street_address,"
    		                                          + " ps.city, ps.state, ps.zip_code"
    		                                 + " FROM client cl left join client_person cp ON cl.client_id = cp.client_id"
                                             + " LEFT JOIN person ps on ps.person_id = cp.person_id"
                                             + " WHERE cl.client_id = ?"
                                             + " ORDER BY ps.last_name";
    
    private static final String SQL_DELETE_CLIENT = "DELETE FROM client WHERE client_id = :clientId";
    
    /** Delete a specific contact associated with a client */
    private static final String SQL_DELETE_CLIENT_CONTACT = "DELETE FROM client_person WHERE client_id = :clientId AND person_id = :personId";
    
    
    /** Remove all linking contact records associated with this client */
    private static final String SQL_DELETE_CLIENT_FROM_CLIENT_CONTACT = "DELETE FROM client_person WHERE client_id = :clientId";
    
    private static final String SQL_INSERT_CLIENT_CONTACT = "INSERT INTO client_person (client_id, person_id)"
                                                          + " VALUES (:clientId, :personId)";
    
    private static final String SQL_UPDATE_CLIENT = "UPDATE client SET company_name = :companyName, web_uri = :webURI, phone_number = :phoneNumber,"
                                                                   + " street_address = :streetAddress, city = :city, state = :state, zip_code = :zipCode"
                                                 + " WHERE client_id = :clientId";   
    
    private static final String SQL_CREATE_CLIENT = "INSERT INTO client (company_name, web_uri, phone_number, street_address, city, state, zip_code)"
                                                  + " VALUES (:companyName, :webURI, :phoneNumber, :streetAddress, :city, :state, :zipCode)";

    private NamedParameterJdbcTemplate namedParameterJdbcTemplate;

   
    public void setNamedParameterJdbcTemplate(NamedParameterJdbcTemplate namedParameterJdbcTemplate) {
        this.namedParameterJdbcTemplate = namedParameterJdbcTemplate;
    }

    
    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public List<Client> listClients() {
        return namedParameterJdbcTemplate.getJdbcOperations().query(SQL_LIST_CLIENTS, new ClientResultExtractor());
    }
    
    
    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public Client readClient(Integer clientId) {
    	
    	
    	return  namedParameterJdbcTemplate.getJdbcOperations().query(SQL_READ_CLIENT, new Object[] { clientId.toString() }, 
    			                                                     new ClientResultExtractor()).get(0);
        
    }
    
    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = false)
    public void deleteClient(Integer clientId) {
    	
    	// Remove all records from the client_contact join table
    	namedParameterJdbcTemplate.update(SQL_DELETE_CLIENT_FROM_CLIENT_CONTACT, Collections.singletonMap("clientId", clientId));
    	
        namedParameterJdbcTemplate.update(SQL_DELETE_CLIENT, Collections.singletonMap("clientId", clientId));
    }
    

    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = false)
    public void updateClient(Client client) {
    	Map<String, Object> parametersForDelete = new HashMap<String, Object>();
    	
    	// Removing the entries in the client_person linking table before add new ones
    	// enforces the 0,1, person to client specification.
    	// Remove this loop if the client - person relationship changes to an many to many.
    	for(String personID : client.getContactsToRemove()){
    		parametersForDelete.put("clientId", client.getClientId());
    		parametersForDelete.put("personId", personID);
    		namedParameterJdbcTemplate.update(SQL_DELETE_CLIENT_CONTACT, parametersForDelete);
    	}
    	
    	Map<String, Object> parametersForAdd = new HashMap<String, Object>();
    	
    	for(String personID : client.getContactsToAdd()){
    		parametersForAdd.put("clientId", client.getClientId());
    		parametersForAdd.put("personId", personID);
    		namedParameterJdbcTemplate.update(SQL_INSERT_CLIENT_CONTACT, parametersForAdd);
    	}
    	
        namedParameterJdbcTemplate.update(SQL_UPDATE_CLIENT, new BeanPropertySqlParameterSource(client));
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = false)
    public Integer createClient(Client client) {
        KeyHolder keyHolder = new GeneratedKeyHolder();
        namedParameterJdbcTemplate.update(SQL_CREATE_CLIENT, new BeanPropertySqlParameterSource(client), keyHolder);
        
      
        if(client.getContactsToAdd() != null && client.getContactsToAdd().length > 0){
        	// We have some contacts to add to this new client
        	Map<String, Object> parametersForAdd = new HashMap<String, Object>();
        	
        	for(String personID : client.getContactsToAdd()){
        		parametersForAdd.put("clientId", keyHolder.getKey().intValue());
        		parametersForAdd.put("personId", personID);
        		namedParameterJdbcTemplate.update(SQL_INSERT_CLIENT_CONTACT, parametersForAdd);
        	}
        }

        return keyHolder.getKey().intValue();
    }
    

    /**
     * Row mapper for client records.
     */
    private static final class ClientRowMapper implements RowMapper<Client> {

        @Override
        public Client mapRow(ResultSet rs, int rowNum) throws SQLException {
            Client client = new Client();
            client.setClientId(rs.getInt("client_id"));
            client.setCompanyName(rs.getString("company_name"));
            client.setWebURI(rs.getString("web_uri"));
            client.setPhoneNumber(rs.getString("phone_number"));
            client.setStreetAddress(rs.getString("street_address"));
            client.setCity(rs.getString("city"));
            client.setState(rs.getString("state"));
            client.setZipCode(rs.getString("zip_code"));
            return client;
        }
    }
}
