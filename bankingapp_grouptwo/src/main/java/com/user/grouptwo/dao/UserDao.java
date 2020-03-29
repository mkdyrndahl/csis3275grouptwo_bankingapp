package com.user.grouptwo.dao;

import com.user.grouptwo.model.User;


public interface UserDao {
	User findByEmail(String email);

	
	
}
