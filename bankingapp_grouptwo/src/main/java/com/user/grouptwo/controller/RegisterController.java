package com.user.grouptwo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.user.grouptwo.dao.UserDao;
import com.user.grouptwo.model.User;

@Controller
public class RegisterController {
	
	@Autowired
	UserDao UserDao;
	
	/**
	 * Create new signUpForm object for empty from
	 * 
	 * @return
	 */
	@ModelAttribute("user")
	public User setSignUpForm() {
		return new User();
	}
	
	/**
	 * Method to show the initial HTML form
	 * 
	 * @return
	 */
	@GetMapping("/register")
	public String showRegisterForm() {
		return "register";
	}
	
	/**
	 * Save User sign up form
	 * 
	 * @param signUpForm
	 * @param model
	 * @return
	 */
	@PostMapping("/register")
	public String saveUser(@ModelAttribute("user") User user, Model model) {
		
		User registeredUser = UserDao.findByEmail(user.getEmail());
		model.addAttribute("message", "User already registered.");
		
		if(registeredUser == null) {
		
			UserDao.saveUser(user);
			
			System.out.println(user.getEmail());
			System.out.println(user.getPassword());
			System.out.println(user.getFirstName());
			System.out.println(user.getLastName());
	
			return "redirect:login";
		
		}
		
		return "register";
	}

}
