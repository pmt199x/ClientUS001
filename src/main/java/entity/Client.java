package entity;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Client {
	
	private String clientID;
	private String firstName;
	private String lastName;
	private String gender;	
	@DateTimeFormat(pattern = "yyyy/MM/dd")
	private Date dateOfBirth;	
	private String maritalStatus;
	private String address;
	private String country;
	public String getClientID() {
		return clientID;
	}
	public void setClientID(String clientID) {
		this.clientID = clientID;
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
	public Date getDateOfBirth() {
		return dateOfBirth;
	}
	public void setDateOfBirth(Date dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}
	public String getMaritalStatus() {
		return maritalStatus;
	}
	public void setMaritalStatus(String maritalStatus) {
		this.maritalStatus = maritalStatus;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	
	
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	
	public Client(String clientID, String firstName, String lastName, String gender, Date dateOfBirth,
			String maritalStatus, String address, String country) {
		super();
		this.clientID = clientID;
		this.firstName = firstName;
		this.lastName = lastName;
		this.gender = gender;
		this.dateOfBirth = dateOfBirth;
		this.maritalStatus = maritalStatus;
		this.address = address;
		this.country = country;
	}
	public Client() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Client [clientID=" + clientID + ", firstName=" + firstName + ", lastName=" + lastName + ", gender="
				+ gender + ", dateOfBirth=" + dateOfBirth + ", maritalStatus=" + maritalStatus + ", address=" + address
				+ ", country=" + country + "]";
	}
	
}
