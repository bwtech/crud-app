package com.aquent.crudapp.domain;

import java.util.LinkedHashSet;
import java.util.Set;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 * The client entity corresponding to the "client" table in the database.
 */
public class Client {

    private Integer clientId;

    @NotNull
    @Size(min = 1, max = 50, message = "Company name is required with maximum length of 50")
    private String companyName;

    @NotNull
    @Size(min = 1, max = 50, message = "Websie URI is required with maximum length of 50")
    private String webURI;

    @NotNull
    @Size(min = 1, max = 50, message = "Phone number is required with maximum length of 50")
    private String phoneNumber;

    @NotNull
    @Size(min = 1, max = 50, message = "Street address is required with maximum length of 50")
    private String streetAddress;

    @NotNull
    @Size(min = 1, max = 50, message = "City is required with maximum length of 50")
    private String city;

    @NotNull
    @Size(min = 2, max = 2, message = "State is required with length 2")
    private String state;

    @NotNull
    @Size(min = 5, max = 5, message = "Zip code is required with length 5")
    private String zipCode;

    /** The contacts associated with this client */
    private Set<Person> contacts = new LinkedHashSet<Person>();
      
    /** Used when the client is edited. Holds person IDs slated for removal as a result of client edit form submission */
    private String [] contactsToRemove;
    
    /** Used when the client is edited or created. Holds person IDs slated for addition as a result of client edit or add form submission */
    private String [] contactsToAdd;
    
    private Boolean successfulUpdatePerformed = false;
 

    public Integer getClientId() {
		return clientId;
	}

	public void setClientId(Integer clientId) {
		this.clientId = clientId;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getWebURI() {
		return webURI;
	}

	public void setWebURI(String webURI) {
		this.webURI = webURI;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getStreetAddress() {
        return streetAddress;
    }

    public void setStreetAddress(String streetAddress) {
        this.streetAddress = streetAddress;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getZipCode() {
        return zipCode;
    }

    public void setZipCode(String zipCode) {
        this.zipCode = zipCode;
    }

 
	public Set<Person> getContacts() {
		return contacts;
	}

 
	public void setContacts(Set<Person> contacts) {
		this.contacts = contacts;
	}
	

 

	/**
	 * @return the contactsToRemove
	 */
	public String[] getContactsToRemove() {
		return contactsToRemove;
	}

	/**
	 * @param contactsToRemove the contactsToRemove to set
	 */
	public void setContactsToRemove(String[] contactsToRemove) {
		this.contactsToRemove = contactsToRemove;
	}

	/**
	 * @return the contactsToAdd
	 */
	public String[] getContactsToAdd() {
		return contactsToAdd;
	}

	/**
	 * @param contactsToAdd the contactsToAdd to set
	 */
	public void setContactsToAdd(String[] contactsToAdd) {
		this.contactsToAdd = contactsToAdd;
	}

	/**
	 * @return the successfulUpdatePerformed
	 */
	public Boolean getSuccessfulUpdatePerformed() {
		return successfulUpdatePerformed;
	}

	/**
	 * @param successfulUpdatePerformed the successfulUpdatePerformed to set
	 */
	public void setSuccessfulUpdatePerformed(Boolean successfulUpdatePerformed) {
		this.successfulUpdatePerformed = successfulUpdatePerformed;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((clientId == null) ? 0 : clientId.hashCode());
		return result;
	}

 
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Client other = (Client) obj;
		if (clientId == null) {
			if (other.clientId != null)
				return false;
		} else if (!clientId.equals(other.clientId))
			return false;
		return true;
	}
}
