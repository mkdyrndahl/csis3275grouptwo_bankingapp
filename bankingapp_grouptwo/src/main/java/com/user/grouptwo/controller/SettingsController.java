package com.user.grouptwo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.user.grouptwo.dao.UserDao;
import com.user.grouptwo.model.User;

@Controller
@SessionAttributes("user")
public class SettingsController {
	
	@Autowired
	UserDao userDao;
	
	/**
	 * Create new signUpForm object for empty from
	 * 
	 * @return
	 */
	@ModelAttribute("profile")
	public User userForm() {
		return new User();
	}
	
	@GetMapping("/settings")
	public String showProfile(HttpSession session, Model model) {
		User user = (User) session.getAttribute("user");
		if (user != null) {
			
			User loggedUser = userDao.findByEmail(user.getEmail());
			
			model.addAttribute("loggedUser", loggedUser);
			
			return "settings";

		}
		return "login";
	}
	
	@PostMapping("/updateProfile")
	public String updateProfile(HttpSession session, @ModelAttribute("profile") User user, Model model) {
		User userSession = (User) session.getAttribute("user");
		if (userSession != null) {
			
			userDao.updateUser(user);
			User loggedUser = userDao.findByEmail(user.getEmail());
			model.addAttribute("loggedUser", loggedUser);
			model.addAttribute("message", "Profile Updated");

			return "settings";
			
		}
		return "login";
			
	}

}
