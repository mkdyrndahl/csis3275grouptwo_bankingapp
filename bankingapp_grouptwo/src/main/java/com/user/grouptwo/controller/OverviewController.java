package com.user.grouptwo.controller;

import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.user.grouptwo.dao.TransactionDao;
import com.user.grouptwo.model.Transaction;
import com.user.grouptwo.model.User;

@Controller
@SessionAttributes("user")
public class OverviewController {

	@Autowired
	TransactionDao transactionDao;

	@RequestMapping("/overview")
	public String showOverview(HttpSession session, Model model) {
		User user = (User) session.getAttribute("user");
		if (user != null) {

			if (transactionDao.findTransactionByUser(user.getEmail()) != null) {

				List<Transaction> transactions = transactionDao.findTransactionByUser(user.getEmail());

				double foodTotal = 0;
				double healthTotal = 0;
				double entertainmentTotal = 0;
				double nightlifeTotal = 0;
				double collegeTotal = 0;

				double poorTotal = 0;
				double neutralTotal = 0;
				double goodTotal = 0;
				double nullTotal = 0;

				for (int i = 0; i < transactions.size(); i++) {

					String category;

					category = transactions.get(i).getCategory().toLowerCase();

					switch (category) {

					case "food":
						foodTotal += transactions.get(i).getAmount();
						break;

					case "health":
						healthTotal += transactions.get(i).getAmount();
						break;

					case "entertainment":
						entertainmentTotal += transactions.get(i).getAmount();
						break;

					case "nightlife":
						nightlifeTotal += transactions.get(i).getAmount();
						break;

					case "college":
						collegeTotal += transactions.get(i).getAmount();
						break;

					}

					if (transactions.get(i).getMood() != null) {
						String mood;
						mood = transactions.get(i).getMood().toLowerCase();

						switch (mood) {

						case "poor":
							poorTotal += transactions.get(i).getAmount();
							break;
						case "neutral":
							neutralTotal += transactions.get(i).getAmount();
							break;
						case "good":
							goodTotal += transactions.get(i).getAmount();
							break;

						}
					} else {
						nullTotal += transactions.get(i).getAmount();
					}

				}

				model.addAttribute("Food", foodTotal);
				model.addAttribute("Health", healthTotal);
				model.addAttribute("Entertainment", entertainmentTotal);
				model.addAttribute("Nightlife", nightlifeTotal);
				model.addAttribute("College", collegeTotal);

				model.addAttribute("Poor", poorTotal);
				model.addAttribute("Neutral", neutralTotal);
				model.addAttribute("Good", goodTotal);
				model.addAttribute("Null", nullTotal);

				return "overview";

			} else {
				
				double foodTotal = 0;
				double healthTotal = 0;
				double entertainmentTotal = 0;
				double nightlifeTotal = 0;
				double collegeTotal = 0;

				double poorTotal = 0;
				double neutralTotal = 0;
				double goodTotal = 0;
				double nullTotal = 0;
				
				model.addAttribute("Food", foodTotal);
				model.addAttribute("Health", healthTotal);
				model.addAttribute("Entertainment", entertainmentTotal);
				model.addAttribute("Nightlife", nightlifeTotal);
				model.addAttribute("College", collegeTotal);

				model.addAttribute("Poor", poorTotal);
				model.addAttribute("Neutral", neutralTotal);
				model.addAttribute("Good", goodTotal);
				model.addAttribute("Null", nullTotal);

				return "overview";
				
			}
		}
		return "login";
	}

}
