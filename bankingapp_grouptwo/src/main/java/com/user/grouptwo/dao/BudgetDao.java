package com.user.grouptwo.dao;

import com.user.grouptwo.model.Budget;

public interface BudgetDao {
	
	Budget findBudgetByUser(String email);
	
	public void saveOrUpdateBudget(Budget budget);

}
