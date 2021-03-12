package dao;

import java.sql.SQLDataException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import entity.Client;
import entity.MapperClient;

@Repository
public class ClientDAO {

	@Autowired
	public JdbcTemplate _jdbcTemplate;

	public List<Client> getClients() {

		List<Client> lstClient = new ArrayList<Client>();
		String sql = "SELECT * FROM Client";

		try {
			lstClient = this._jdbcTemplate.query(sql, new MapperClient());
		} catch (Exception e) {
			System.out.println("List Client Empty");
			lstClient = null;
		}

		return lstClient;
	}

	public Client getClientByID(String id) {

		Client client = new Client();
		String sql = "SELECT * FROM Client WHERE ClientID = ?";

		try {
			client = this._jdbcTemplate.queryForObject(sql, new MapperClient(), id);
		} catch (Exception e) {
			System.out.println("Client not found");
			client = null;
			return client;
		}		

		return client;
	}

	public boolean addClient (Client client) {
		
		
		String sql = "INSERT INTO CLIENT(ClientID, FirstName, LastName, Gender, MaritalStatus, DateOfBirth, Address, Country) " +
				"VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
		
		try { 
			_jdbcTemplate.update(sql, 
					client.getClientID(), client.getFirstName(), client.getLastName(), client.getGender(), client.getMaritalStatus(),
					client.getDateOfBirth(), client.getAddress(), client.getCountry());
		} catch (Exception e) {
			System.out.println("ClientDAO Insert fail");
			e.printStackTrace();
			return false; // add client failed
		}		
		return true; // add client success
	}
	
	public int updateClient(Client client) {
		
		String sql = "UPDATE CLIENT SET FirstName = ?, LastName = ?, Gender = ?, MaritalStatus = ?, DateOfBirth = ?, Address = ?, Country = ?"
				+ " WHERE ClientID = " + client.getClientID();						

		try {
			_jdbcTemplate.update(sql, 
					 client.getFirstName(), client.getLastName(), client.getGender(), client.getMaritalStatus(),
					client.getDateOfBirth(), client.getAddress(), client.getCountry());
		} catch (Exception e) {
			System.out.println("ClientDAO Update fail");
			//e.printStackTrace();
			return -1; // update client failed
		}		
		return 1; // update client success
	}
}
