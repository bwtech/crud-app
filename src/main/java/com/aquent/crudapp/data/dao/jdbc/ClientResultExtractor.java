package com.aquent.crudapp.data.dao.jdbc;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ResultSetExtractor;

import com.aquent.crudapp.domain.Client;
import com.aquent.crudapp.domain.Person;
 

public class ClientResultExtractor implements ResultSetExtractor<List<Client>> {

	@Override
	public List<Client> extractData(ResultSet rs) throws SQLException, DataAccessException {
		Map<Integer,Client> clients = new LinkedHashMap<Integer,Client>();
		Client client;
		
		while(rs.next()) {
			Integer id  = rs.getInt("client_id");
			client = clients.get(id);
			
			if(client == null) {
				client = new Client();
	            client.setClientId(rs.getInt("client_id"));
	            client.setCompanyName(rs.getString("company_name"));
	            client.setWebURI(rs.getString("web_uri"));
	            client.setPhoneNumber(rs.getString("phone_number"));
	            client.setStreetAddress(rs.getString("cl_street_address"));
	            client.setCity(rs.getString("cl_city"));
	            client.setState(rs.getString("cl_state"));
	            client.setZipCode(rs.getString("cl_zip_code"));
			}
			
			Integer personId = rs.getInt("person_id");
			
			if(personId > 0) {
				Person person = new Person();
	            person.setPersonId(rs.getInt("person_id"));
	            person.setFirstName(rs.getString("first_name"));
	            person.setLastName(rs.getString("last_name"));
	            person.setEmailAddress(rs.getString("email_address"));
	            person.setStreetAddress(rs.getString("street_address"));
	            person.setCity(rs.getString("city"));
	            person.setState(rs.getString("state"));
	            person.setZipCode(rs.getString("zip_code"));
				client.getContacts().add(person);
			}
			clients.put(id, client);
			
		}
		return new ArrayList<Client> (clients.values());
	}

	
}
