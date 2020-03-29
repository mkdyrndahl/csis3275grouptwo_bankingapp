package com.user.grouptwo.model;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import java.util.List;
public class Account {
	private String email;
	private List<Transaction> transactions;
	private List<Budget> budgets;
	
	public void setEmail(String email){
		this.email = email;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setTransactions(List<Transaction> transactions){
		this.transactions = transactions;
	}
	
	public List<Transaction> getTransactions() {
		return transactions;
	}
	
	public void setBudgets(List<Budget> budgets){
		this.budgets = budgets;
	}
	
	public List<Budget> getBudgets() {
		return budgets;
	}
	
}
