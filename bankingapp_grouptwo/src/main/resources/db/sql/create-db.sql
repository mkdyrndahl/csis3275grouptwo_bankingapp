DROP TABLE transactions IF EXISTS;
DROP TABLE users IF EXISTS;
DROP TABLE budgets IF EXISTS;

CREATE TABLE transactions(
	description VARCHAR(200) PRIMARY KEY,
	paymentDate VARCHAR(200),
	mood VARCHAR(200),
	category VARCHAR(200),
	amount DECIMAL,
	email VARCHAR(200)
);

CREATE TABLE users(
	email VARCHAR(200) PRIMARY KEY,
	password VARCHAR(200),
	firstName VARCHAR(200),
	lastName VARCHAR(200),
	city VARCHAR(200),
	dob VARCHAR(200)
);

CREATE TABLE budgets(
	email VARCHAR(200) PRIMARY KEY,
	foodBudget DECIMAL,
	healthBudget DECIMAL,
	entertainmentBudget DECIMAL,
	nightlifeBudget DECIMAL,
	collegeBudget DECIMAL
);



