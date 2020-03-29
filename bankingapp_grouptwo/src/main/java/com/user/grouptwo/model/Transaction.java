package com.user.grouptwo.model;
import java.math.BigDecimal;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

public class Transaction {
	private Integer transactionNumber;
	private String date;
	private String description;
	private String category;
	private Integer mood;
	private BigDecimal amount;
	
	public Integer getTransactionNumber() {
		return transactionNumber;
	}
	
	public void setTransactionNumber(Integer transactionNumber) {
		this.transactionNumber = transactionNumber;
	}
	
	public String getDate() {
		return date;
	}
	
	public void setDate(String date) {
		this.date = date;
	}
	
	public String getDescription() {
		return description;
	}
	
	public void setDescription(String description) {
		this.description = description;
	}
	
	public String getCategory() {
		return category;
	}
	
	public void setCategory(String category) {
		this.category = category;
	}
	
	public Integer getMood() {
		return mood;
	}
	
	public void setMood(Integer mood) {
		this.mood = mood;
	}
	
	public BigDecimal getAmount() {
		return amount;
	}
	
	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}
	
}
