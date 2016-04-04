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

import com.aquent.crudapp.data.dao.PersonDao;
import com.aquent.crudapp.domain.Client;
import com.aquent.crudapp.domain.Person;

/**
 * Spring JDBC implementation of {@link PersonDao}.
 */
public class PersonJdbcDao implements PersonDao {

    
	private static final String SQL_LIST_PEOPLE = "SELECT ps.person_id, ps.first_name, ps.last_name, ps.email_address, ps.street_address, ps.city, ps.state,"
			                                          + " ps.zip_code, cl.client_id, cl.company_name, cl.phone_number, cl.web_uri, cl.street_address AS cl_street_address,"
			                                          + " cl.city AS cl_city, cl.state AS cl_state, cl.zip_code AS cl_zip_code"
    		                                  + " FROM person ps"
    		                                  + " LEFT JOIN client_person cp ON ps.person_id = cp.person_id"
                                              + " LEFT JOIN client cl on cl.client_id = cp.client_id ORDER BY ps.last_name";
    
    
	
	private static final String SQL_READ_PERSON = "SELECT ps.person_id, ps.first_name, ps.last_name, ps.email_address, ps.street_address, ps.city, ps.state,"
			                                          + " ps.zip_code, cl.client_id, cl.company_name, cl.phone_number, cl.web_uri, cl.street_address AS cl_street_address,"
			                                          + " cl.city AS cl_city, cl.state AS cl_state, cl.zip_code AS cl_zip_code"
    		                                   + " FROM person ps"
    		                                   + " LEFT JOIN client_person cp ON ps.person_id = cp.person_id"
                                               + " LEFT JOIN client cl on cl.client_id = cp.client_id"
                                               + " where ps.person_id = ?";    
    
    
    private static final String SQL_DELETE_PERSON = "DELETE FROM person WHERE person_id = :personId";
    
    
    /** Gets the client associated with a person (Currently not used)  */
    private static final String SQL_READ_PERSONS_CLIENT = "SELECT c.client_id, c.company_name, c.phone_number, c.web_uri, c.street_address, c.city, c.state, c.zip_code"
    		                                           + " FROM client c inner join client_person cp ON c.client_id = cp.client_id " 
    		                                           + " WHERE cp.person_id = :personId";
    
    /**
     * Used to maintains the schema spec that a person can have 0 or 1 clients. This query produces people who 
     * are not associated with any client.
     */
    private static final String SQL_READ_PEOPLE_NOT_ASSOCIATED_WITH_A_CLIENT = "SELECT * from person ps1"
    		                                                                + " WHERE ps1.person_id NOT IN"
    		                                                                + " (Select DISTINCT person_id from client_person) ORDER BY ps1.last_name";
    
    
    private static final String SQL_DELETE_FROM_CLIENT_CONTACT = "DELETE FROM client_person WHERE person_id = :personId";
    
    
    private static final String SQL_UPDATE_PERSON = "UPDATE person SET first_name = :firstName, last_name = :lastName, email_address = :emailAddress,"
  		                                                         + " street_address = :streetAddress, city = :city, state = :state, zip_code = :zipCode"
                                                 + " WHERE person_id = :personId";    
    
    
    private static final String SQL_CREATE_PERSON = "INSERT INTO person (first_name, last_name, email_address, street_address, city, state, zip_code)"
                                                  + " VALUES (:firstName, :lastName, :emailAddress, :streetAddress, :city, :state, :zipCode)";
    
    
    private static final String SQL_INSERT_CLIENT_CONTACT = "INSERT INTO client_person (client_id, person_id)"
                                                         + " VALUES (:clientId, :personId)";

    private NamedParameterJdbcTemplate namedParameterJdbcTemplate;

    public void setNamedParameterJdbcTemplate(NamedParameterJdbcTemplate namedParameterJdbcTemplate) {
        this.namedParameterJdbcTemplate = namedParameterJdbcTemplate;
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public List<Person> listPeople() {
    	return  namedParameterJdbcTemplate.getJdbcOperations().query(SQL_LIST_PEOPLE, new ContactResultExtractor());
        ///return namedParameterJdbcTemplate.getJdbcOperations().query(SQL_LIST_PEOPLE, new PersonRowMapper());
    }
    
    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public List<Person> listPeopleNotAssociatedWithAClient() {
        return namedParameterJdbcTemplate.getJdbcOperations().query(SQL_READ_PEOPLE_NOT_ASSOCIATED_WITH_A_CLIENT, new PersonRowMapper());
    }
    

    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public Person readPerson(Integer personId) {
    	
        // Currently this will only return 1 row. Using ContactResultExtractor() here to future proof this against
    	// the person to contact relationship changing from '0,1 person to 1 contact' to 'many persons to many contacts'
    	List<Person> person = namedParameterJdbcTemplate.getJdbcOperations().query(SQL_READ_PERSON, new Object[] { personId.toString() }, new ContactResultExtractor());
    	
        return person.get(0);
    }
    
    
    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = false)
    public void deletePerson(Integer personId) {
    	
    	//Remove from our linking table
    	namedParameterJdbcTemplate.update(SQL_DELETE_FROM_CLIENT_CONTACT, Collections.singletonMap("personId", personId));
    	
        namedParameterJdbcTemplate.update(SQL_DELETE_PERSON, Collections.singletonMap("personId", personId));
    }
    

    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = false)
    public void updatePerson(Person person) {
    	
    	namedParameterJdbcTemplate.update(SQL_DELETE_FROM_CLIENT_CONTACT, Collections.singletonMap("personId", person.getPersonId()));
    	
        if( person.getClientId() != "" ){
        	// A client was selected in the create person from
            Map<String, Object> parametersForAdd = new HashMap<String, Object>();
    		parametersForAdd.put("clientId", person.getClientId());
    		parametersForAdd.put("personId", person.getPersonId());
    		namedParameterJdbcTemplate.update(SQL_INSERT_CLIENT_CONTACT, parametersForAdd);       	
        }  	
    	
        namedParameterJdbcTemplate.update(SQL_UPDATE_PERSON, new BeanPropertySqlParameterSource(person));
    }

    
    @Override
    @Transactional(propagation = Propagation.SUPPORTS, readOnly = false)
    public Integer createPerson(Person person) {
        KeyHolder keyHolder = new GeneratedKeyHolder();
        
        namedParameterJdbcTemplate.update(SQL_CREATE_PERSON, new BeanPropertySqlParameterSource(person), keyHolder);
        
        if( person.getClientId() != null && person.getClientId() != "" ){
        	// A client was selected in the create person from
            Map<String, Object> parametersForAdd = new HashMap<String, Object>();
    		parametersForAdd.put("clientId", person.getClientId());
    		parametersForAdd.put("personId", keyHolder.getKey().intValue());
    		namedParameterJdbcTemplate.update(SQL_INSERT_CLIENT_CONTACT, parametersForAdd);       	
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

    /**
     * Row mapper for person records.
     */
    private static final class PersonRowMapper implements RowMapper<Person> {

        @Override
        public Person mapRow(ResultSet rs, int rowNum) throws SQLException {
            Person person = new Person();
            person.setPersonId(rs.getInt("person_id"));
            person.setFirstName(rs.getString("first_name"));
            person.setLastName(rs.getString("last_name"));
            person.setEmailAddress(rs.getString("email_address"));
            person.setStreetAddress(rs.getString("street_address"));
            person.setCity(rs.getString("city"));
            person.setState(rs.getString("state"));
            person.setZipCode(rs.getString("zip_code"));
            return person;
        }
    }
}
