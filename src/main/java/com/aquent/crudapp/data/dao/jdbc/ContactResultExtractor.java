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
 

public class ContactResultExtractor implements ResultSetExtractor<List<Person>> {

	@Override
	public List<Person> extractData(ResultSet rs) throws SQLException, DataAccessException {
		Map<Integer,Person> contacts = new LinkedHashMap<Integer,Person>();
		Person person;
		
		while(rs.next()) {
			Integer id  = rs.getInt("person_id");
			person = contacts.get(id);
			
			if(person == null) {
				person = new Person();
	            person.setPersonId(rs.getInt("person_id"));
	            person.setFirstName(rs.getString("first_name"));
	            person.setLastName(rs.getString("last_name"));
	            person.setEmailAddress(rs.getString("email_address"));
	            person.setStreetAddress(rs.getString("street_address"));
	            person.setCity(rs.getString("city"));
	            person.setState(rs.getString("state"));
	            person.setZipCode(rs.getString("zip_code"));
			}
			
			Integer clientId = rs.getInt("client_id");
			
			if(clientId > 0) {
				Client client = new Client();
				client = new Client();
	            client.setClientId(rs.getInt("client_id"));
	            client.setCompanyName(rs.getString("company_name"));
	            client.setWebURI(rs.getString("web_uri"));
	            client.setPhoneNumber(rs.getString("phone_number"));
	            client.setStreetAddress(rs.getString("cl_street_address"));
	            client.setCity(rs.getString("cl_city"));
	            client.setState(rs.getString("cl_state"));
	            client.setZipCode(rs.getString("cl_zip_code"));
				person.setClient(client);	//	This line assumes a specification of each person can have 0 or 1 client.
				person.setClientId(clientId.toString());
				person.setCurrentlyAssociatedWithAClient(true);
			}
			contacts.put(id, person);
			
		}
		return new ArrayList<Person> (contacts.values());
	}

	
}
