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

import com.user.grouptwo.model.Budget;
import com.user.grouptwo.model.Transaction;

@Repository
public class BudgetDaoImpl implements BudgetDao {
	
	NamedParameterJdbcTemplate namedParameterJdbcTemplate;

	@Autowired
	public void setNamedParameterJdbcTemplate(NamedParameterJdbcTemplate namedParameterJdbcTemplate) {
		this.namedParameterJdbcTemplate = namedParameterJdbcTemplate;
	}
	
	// @Override
		public Budget findBudgetByUser(String email) {

			Map<String, Object> params = new HashMap<String, Object>();
			params.put("email", email);

			String sql = "SELECT * FROM budgets WHERE email=:email";

			List<Budget> results = namedParameterJdbcTemplate.query(sql, params, new BudgetMapper());

			if (results.size() == 0) {
				return null;
			}
			Budget budget = results.get(0);

			return budget;

		}
		
		public void saveOrUpdateBudget(Budget budget) {
			
			if (findBudgetByUser(budget.getEmail()) != null) {
		        // update
				Map<String, Object> params = new HashMap<String, Object>();

				String sql = "UPDATE budgets SET foodBudget=:foodBudget, healthBudget=:healthBudget, entertainmentBudget=:entertainmentBudget, nightlifeBudget=:nightlifeBudget, collegeBudget=:collegeBudget WHERE email=:email";

				params.put("foodBudget", budget.getFoodBudget());
				params.put("healthBudget", budget.getHealthBudget());
				params.put("entertainmentBudget", budget.getEntertainmentBudget());
				params.put("nightlifeBudget", budget.getNightlifeBudget());
				params.put("collegeBudget", budget.getCollegeBudget());
				params.put("email", budget.getEmail());

				namedParameterJdbcTemplate.update(sql, params);
				
		    } else {
		    	
		        // insert
		    	Map<String, Object> params = new HashMap<String, Object>();

				String sql = "INSERT INTO budgets (email, foodBudget, healthBudget, entertainmentBudget, nightlifeBudget, collegeBudget) VALUES (:email, :foodBudget, :healthBudget, :entertainmentBudget, :nightlifeBudget, :collegeBudget)";

				params.put("foodBudget", budget.getFoodBudget());
				params.put("healthBudget", budget.getHealthBudget());
				params.put("entertainmentBudget", budget.getEntertainmentBudget());
				params.put("nightlifeBudget", budget.getNightlifeBudget());
				params.put("collegeBudget", budget.getCollegeBudget());
				params.put("email", budget.getEmail());

				namedParameterJdbcTemplate.update(sql, params);
		        
		    }
			
			
		}
		
		private static final class BudgetMapper implements RowMapper<Budget> {

			public Budget mapRow(ResultSet rs, int rowNum) throws SQLException {
				Budget budget = new Budget();
//				user.setId(rs.getInt("id"));
				budget.setEmail(rs.getString("email"));
				budget.setFoodBudget(rs.getDouble("foodBudget"));
				budget.setHealthBudget(rs.getDouble("healthBudget"));
				budget.setEntertainmentBudget(rs.getDouble("entertainmentBudget"));
				budget.setNightlifeBudget(rs.getDouble("nightlifeBudget"));
				budget.setCollegeBudget(rs.getDouble("collegeBudget"));
				
				return budget;
			}
		}

}
