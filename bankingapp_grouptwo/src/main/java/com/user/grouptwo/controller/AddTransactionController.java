package com.user.grouptwo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.user.grouptwo.dao.TransactionDao;
import com.user.grouptwo.model.Transaction;
import com.user.grouptwo.model.User;

@Controller
@SessionAttributes("user")
public class AddTransactionController {
	
	@Autowired
	TransactionDao transactionDao;
	
	/**
	 * Create new signUpForm object for empty from
	 * 
	 * @return
	 */
	@ModelAttribute("transaction")
	public Transaction transactionForm() {
		return new Transaction();
	}
	
	/**
	 * Method to show the initial HTML form
	 * 
	 * @return
	 */
	@GetMapping("/addTransaction")
	public String showForm(HttpSession session, Model model) {
	    User user = (User) session.getAttribute("user");
	    if(user != null) {

	    	return "addTransaction";
	    }
	    return "login";
	}
	
	@PostMapping("/addTransaction")
	public String addTransaction(HttpSession session, @ModelAttribute("transaction") Transaction transaction, Model model) {
		User user = (User) session.getAttribute("user");
		
		if(user != null) {
			
			transaction.setEmail(user.getEmail());
			transactionDao.saveTransaction(transaction);
			
			System.out.println(transaction.getEmail());
			
	    	return "redirect:transaction";
	    	
	    }
		
		return "redirect:login";
	}

}
