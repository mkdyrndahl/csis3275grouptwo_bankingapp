package com.user.grouptwo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.user.grouptwo.dao.UserDao;
import com.user.grouptwo.model.Login;
import com.user.grouptwo.model.User;

@Controller
@SessionAttributes("user")
public class LoginController {
	
	@Autowired
	UserDao UserDao;
	
	
	/**
	 * Create new signUpForm object for empty from
	 * 
	 * @return
	 */
	@ModelAttribute("loginInfo")
	public Login loginForm() {
		return new Login();
	}

	/**
	 * Method to show the initial HTML form
	 * 
	 * @return
	 */
	@GetMapping("/login")
	public String login(HttpSession session) {
	    User user = (User) session.getAttribute("user");
	    if(user != null) {
	    	return "login-success";
	    }
	    return "login";
	}

	@PostMapping("/login") 
	public String login(@ModelAttribute("loginInfo") Login loginInfo, Model model){
		User user = UserDao.findByEmail(loginInfo.getEmail());
		model.addAttribute("message", "Login Fail");

		if(user != null && user.getPassword().equals(loginInfo.getPassword())) {
			model.addAttribute("student", user);
			model.addAttribute("message", "Login Successful");
			return "login-success";
		}
		return "login";
	}
	
}
