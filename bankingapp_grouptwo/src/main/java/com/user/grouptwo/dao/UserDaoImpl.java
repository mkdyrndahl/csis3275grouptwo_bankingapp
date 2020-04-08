package com.user.grouptwo.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import com.user.grouptwo.model.Transaction;
import com.user.grouptwo.model.User;

@Repository
public class UserDaoImpl implements UserDao {

	NamedParameterJdbcTemplate namedParameterJdbcTemplate;
	
	@Autowired
	TransactionDao transactionDao;

	@Autowired
	public void setNamedParameterJdbcTemplate(NamedParameterJdbcTemplate namedParameterJdbcTemplate) {
		this.namedParameterJdbcTemplate = namedParameterJdbcTemplate;
	}

	// @Override
	public User findByEmail(String email) {

		Map<String, Object> params = new HashMap<String, Object>();
		params.put("email", email);

		String sql = "SELECT * FROM users WHERE email=:email";

		List<User> results = namedParameterJdbcTemplate.query(sql, params, new UserMapper());

		if(results.size() == 0) {
			return null;
		}
		User user = results.get(0);
		
		List<Transaction> transactionResults = transactionDao.findTransactionByUser(user.getEmail());
		
		user.setTransactions(transactionResults);
		
		return user;

	}
	
	public void saveUser(User user) {
		
		Map<String, Object> params = new HashMap<String, Object>();

		String sql = "INSERT INTO users (email, password, firstName, lastName) VALUES (:email, :password, :firstName, :lastName)";
		
		params.put("email", user.getEmail());
		params.put("password", user.getPassword());
		params.put("firstName", user.getFirstName());
		params.put("lastName", user.getLastName());
		
		namedParameterJdbcTemplate.update(sql, params);
	 
	}
	
	public void updateUser(User user) {

		Map<String, Object> params = new HashMap<String, Object>();

		String sql = "UPDATE users SET firstName=:firstName, lastName=:lastName, dob=:dob, city=:city, password=:password WHERE email=:email";

		params.put("firstName", user.getFirstName());
		params.put("lastName", user.getLastName());
		params.put("dob", user.getDob());
		params.put("city", user.getCity());
		params.put("password", user.getPassword());
		params.put("email", user.getEmail());

		namedParameterJdbcTemplate.update(sql, params);

	}
	
	private static final class UserMapper implements RowMapper<User> {

		public User mapRow(ResultSet rs, int rowNum) throws SQLException {
			User user = new User();
			user.setFirstName(rs.getString("firstName"));
			user.setEmail(rs.getString("email"));
			user.setPassword(rs.getString("password"));
			user.setLastName(rs.getString("lastName"));
			user.setCity(rs.getString("city"));
			user.setDob(rs.getString("dob"));
			return user;
		}
	}

}

