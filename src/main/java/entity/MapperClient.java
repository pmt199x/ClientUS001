package entity;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class MapperClient implements RowMapper<Client> {

	public Client mapRow(ResultSet rs, int rowNum) throws SQLException {
	
		Client client = new Client();
		client.setClientID(rs.getString("ClientID"));
		client.setFirstName(rs.getString("FirstName"));
		client.setLastName(rs.getString("LastName"));
		client.setGender(rs.getString("Gender"));
		client.setMaritalStatus(rs.getString("MaritalStatus"));
		client.setDateOfBirth(rs.getDate("DateOfBirth"));
		client.setAddress(rs.getString("Address"));
		client.setCountry(rs.getString("Country"));
		return client;
	}

}
