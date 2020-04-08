package com.user.grouptwo.dao;

import java.util.List;

import com.user.grouptwo.model.Transaction;

public interface TransactionDao {
	
	List<Transaction> findAll();
	
	List<Transaction> findTransactionByUser(String email);
	
	public void saveTransaction(Transaction transaction);
	
	public void updateTransaction(Transaction transaction);

	public void deleteTransaction(Transaction transaction);
}
