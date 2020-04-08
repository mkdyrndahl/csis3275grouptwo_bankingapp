package com.user.grouptwo.controller;

import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.user.grouptwo.dao.TransactionDao;
import com.user.grouptwo.dao.UserDao;
import com.user.grouptwo.model.Transaction;
import com.user.grouptwo.model.User;

@Controller
@SessionAttributes("user")
public class TransactionController {

	@Autowired
	TransactionDao transactionDao;

	@Autowired
	UserDao userDao;

	/**
	 * Create new signUpForm object for empty from
	 * 
	 * @return
	 */
	@ModelAttribute("transaction")
	public Transaction transactionForm() {
		return new Transaction();
	}

	@RequestMapping("/transaction")
	public String showTransaction(HttpSession session, Model model) {
		User user = (User) session.getAttribute("user");
		if (user != null) {
			if (transactionDao.findTransactionByUser(user.getEmail()) != null) {

				List<Transaction> transactions = transactionDao.findTransactionByUser(user.getEmail());

				for (int i = 0; i < transactions.size(); i++) {

					transactions.get(i).setIndex(i + 1);

//				String mood = transactions.get(i).getMood().toLowerCase();

					if (transactions.get(i).getMood() != null) {

						String mood = transactions.get(i).getMood().toLowerCase();

						switch (mood) {

						case "poor":
							transactions.get(i).setColor("red");
							break;
						case "neutral":
							transactions.get(i).setColor("gray");
							break;
						case "good":
							transactions.get(i).setColor("green");
							break;
						default:
							transactions.get(i).setColor("white");
							break;

						}

					} else {

						transactions.get(i).setColor("white");

					}

				}

				model.addAttribute("transactions", transactions);
				model.addAttribute("edit", "edit");
				model.addAttribute("delete", "delete");
				return "transaction";

			} else {

				return "transaction";

			}
		}
		return "login";
	}

	@PostMapping("/updateTransaction")
	public String updateTransaction(HttpSession session, @ModelAttribute("transaction") Transaction transaction,
			Model model) {
		User user = (User) session.getAttribute("user");

		if (user != null) {

			transactionDao.updateTransaction(transaction);

			List<Transaction> transactions = transactionDao.findTransactionByUser(user.getEmail());

			return "redirect:transaction";

		}

		return "redirect:login";
	}

	@PostMapping("/deleteTransaction")
	public String deleteTransaction(HttpSession session, @ModelAttribute("transaction") Transaction transaction,
			Model model) {
		User user = (User) session.getAttribute("user");

		if (user != null) {

			List<Transaction> transactions = transactionDao.findTransactionByUser(user.getEmail());
			int index = transaction.getIndex();

			Transaction deleteTransaction = new Transaction();
			deleteTransaction = transactions.get((index - 1));

			transactionDao.deleteTransaction(deleteTransaction);

			return "redirect:transaction";

		}

		return "redirect:login";
	}

}
