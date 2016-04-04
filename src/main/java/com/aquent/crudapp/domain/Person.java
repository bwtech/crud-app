package com.aquent.crudapp.domain;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 * The person entity corresponding to the "person" table in the database.
 */
public class Person {

    private Integer personId;

    @NotNull
    @Size(min = 1, max = 50, message = "First name is required with maximum length of 50")
    private String firstName;

    @NotNull
    @Size(min = 1, max = 50, message = "Last name is required with maximum length of 50")
    private String lastName;

    @NotNull
    @Size(min = 1, max = 50, message = "Email address is required with maximum length of 50")
    private String emailAddress;

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
    
    private Client client;
    
    private Boolean successfulUpdatePerformed = false;
    
    private Boolean currentlyAssociatedWithAClient = false;
    
    /** Used when the person is edited. Holds the ID of the client associated with this person*/
    private String clientId;

    public Integer getPersonId() {
        return personId;
    }

    public void setPersonId(Integer personId) {
        this.personId = personId;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }
    
    public String getLastNameAndFirstName(){
    	return this.lastName + ", " + this.firstName;
    }

    public String getEmailAddress() {
        return emailAddress;
    }

    public void setEmailAddress(String emailAddress) {
        this.emailAddress = emailAddress;
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

 
	public Client getClient() {
		return client;
	}


	public void setClient(Client client) {
		this.client = client;
	}

	/**
	 * @return the clientId
	 */
	public String getClientId() {
		return clientId;
	}

	/**
	 * @param clientId the clientId to set
	 */
	public void setClientId(String clientId) {
		this.clientId = clientId;
	}

	/**
	 * @return the successfulUpdatePerformed
	 */
	public Boolean getSuccessfulUpdatePerformed() {
		return successfulUpdatePerformed;
	}

	/**
	 * @param successfulUpdatePerfirmed the successfulUpdatePerformed to set
	 */
	public void setSuccessfulUpdatePerformed(Boolean successfulUpdatePerformed) {
		this.successfulUpdatePerformed = successfulUpdatePerformed;
	}

	/**
	 * @return the currentlyAssociatedWithAClient
	 */
	public Boolean getCurrentlyAssociatedWithAClient() {
		return currentlyAssociatedWithAClient;
	}

	/**
	 * @param currentlyAssociatedWithAClient the currentlyAssociatedWithAClient to set
	 */
	public void setCurrentlyAssociatedWithAClient(Boolean currentlyAssociatedWithAClient) {
		this.currentlyAssociatedWithAClient = currentlyAssociatedWithAClient;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((personId == null) ? 0 : personId.hashCode());
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
		Person other = (Person) obj;
		if (personId == null) {
			if (other.personId != null)
				return false;
		} else if (!personId.equals(other.personId))
			return false;
		return true;
	}
}
