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

@Repository
public class TransactionDaoImpl implements TransactionDao {

	NamedParameterJdbcTemplate namedParameterJdbcTemplate;

	@Autowired
	public void setNamedParameterJdbcTemplate(NamedParameterJdbcTemplate namedParameterJdbcTemplate) {
		this.namedParameterJdbcTemplate = namedParameterJdbcTemplate;
	}

	// @Override
	public List<Transaction> findAll() {

		Map<String, Object> params = new HashMap<String, Object>();

		String sql = "SELECT * FROM transactions";

		List<Transaction> result = namedParameterJdbcTemplate.query(sql, params, new TransactionMapper());

		return result;

	}

	// @Override
	public List<Transaction> findTransactionByUser(String email) {

		Map<String, Object> params = new HashMap<String, Object>();
		params.put("email", email);

		String sql = "SELECT * FROM transactions WHERE email=:email";

		List<Transaction> results = namedParameterJdbcTemplate.query(sql, params, new TransactionMapper());

		if (results.size() == 0) {
			return null;
		}

		return results;

	}

	public void saveTransaction(Transaction transaction) {

		Map<String, Object> params = new HashMap<String, Object>();

		String sql = "INSERT INTO transactions (description, paymentDate, category, amount, email) VALUES (:description, :paymentDate, :category, :amount, :email)";

		params.put("description", transaction.getDescription());
		params.put("paymentDate", transaction.getPaymentDate());
		params.put("category", transaction.getCategory());
		params.put("amount", transaction.getAmount());
		params.put("email", transaction.getEmail());

		namedParameterJdbcTemplate.update(sql, params);

	}

	public void updateTransaction(Transaction transaction) {

		Map<String, Object> params = new HashMap<String, Object>();

		String sql = "UPDATE transactions SET mood=:mood WHERE description=:description";

		params.put("description", transaction.getDescription());
		params.put("mood", transaction.getMood());

		namedParameterJdbcTemplate.update(sql, params);

	}
	public void deleteTransaction(Transaction transaction) {

		Map<String, Object> params = new HashMap<String, Object>();

		String sql = "DELETE FROM transactions WHERE description=:description";

		params.put("description", transaction.getDescription());

		namedParameterJdbcTemplate.update(sql, params);

	}

	private static final class TransactionMapper implements RowMapper<Transaction> {

		public Transaction mapRow(ResultSet rs, int rowNum) throws SQLException {
			Transaction transaction = new Transaction();
//			user.setId(rs.getInt("id"));
			transaction.setDescription(rs.getString("description"));
			transaction.setPaymentDate(rs.getString("paymentDate"));
			transaction.setMood(rs.getString("mood"));
			transaction.setCategory(rs.getString("category"));
			transaction.setAmount(rs.getDouble("amount"));
			return transaction;
		}
	}

}
