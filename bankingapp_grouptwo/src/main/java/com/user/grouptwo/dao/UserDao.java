package com.user.grouptwo.dao;

import com.user.grouptwo.model.User;


public interface UserDao {
	
	User findByEmail(String email);

	public void saveUser(User user);
	
	public void updateUser(User user);

}
