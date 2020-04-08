package com.user.grouptwo.model;

public class Transaction {
	private String description;
	private String paymentDate;
	private String mood;
	private String category;
	private Double amount;
	private String email;
	private String color;
	private int index;
	private String action;

	public String getAction() {
		return action;
	}

	public void setAction(String action) {
		this.action = action;
	}

	public int getIndex() {
		return index;
	}

	public void setIndex(int index) {
		this.index = index;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getPaymentDate() {
		return paymentDate;
	}

	public void setPaymentDate(String paymentDate) {
		this.paymentDate = paymentDate;
	}

	public String getMood() {
		return mood;
	}

	public void setMood(String mood) {
		this.mood = mood;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public Double getAmount() {
		return amount;
	}

	public void setAmount(Double amount) {
		this.amount = amount;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

}
