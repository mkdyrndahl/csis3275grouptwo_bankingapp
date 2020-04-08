package com.user.grouptwo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.user.grouptwo.dao.BudgetDao;
import com.user.grouptwo.model.Budget;
import com.user.grouptwo.model.User;

@Controller
@SessionAttributes("user")
public class BudgetController {

	@Autowired
	BudgetDao budgetDao;

	/**
	 * Create new signUpForm object for empty from
	 * 
	 * @return
	 */
	@ModelAttribute("budget")
	public Budget budgetForm() {
		return new Budget();
	}

	@GetMapping("/budget")
	public String showBudget(HttpSession session, Model model) {
		User user = (User) session.getAttribute("user");
		if (user != null) {

			if (budgetDao.findBudgetByUser(user.getEmail()) != null) {
				
				Budget budget = budgetDao.findBudgetByUser(user.getEmail());
				
				double total;
				double foodP, healthP, entertainmentP, nightlifeP, collegeP;
				
				total = budget.getFoodBudget() + budget.getHealthBudget() + budget.getEntertainmentBudget() + budget.getNightlifeBudget() + budget.getCollegeBudget();
				foodP = (budget.getFoodBudget() / total) * 100;
				healthP = (budget.getHealthBudget() / total) * 100;
				entertainmentP = (budget.getEntertainmentBudget() / total) * 100;
				nightlifeP = (budget.getNightlifeBudget() / total) * 100;
				collegeP = (budget.getCollegeBudget() / total) * 100;
				
				foodP = Math.round(foodP * 100) / 100;
				healthP = Math.round(foodP * 100) / 100;
				entertainmentP = Math.round(foodP * 100) / 100;
				nightlifeP = Math.round(foodP * 100) / 100;
				collegeP = Math.round(foodP * 100) / 100;
				
				model.addAttribute("budget", budget);
				model.addAttribute("total", total);
				model.addAttribute("foodP", foodP);
				model.addAttribute("healthP", healthP);
				model.addAttribute("entertainmentP", entertainmentP);
				model.addAttribute("nightlifeP", nightlifeP);
				model.addAttribute("collegeP", collegeP);

				return "budget";
			}
			
			double total = 0;
			double foodP = 0;
			double healthP = 0;
			double entertainmentP = 0;
			double nightlifeP = 0;
			double collegeP = 0;
			
			Budget budget = new Budget();
			
			budget.setFoodBudget(0);
			budget.setHealthBudget(0);
			budget.setEntertainmentBudget(0);
			budget.setNightlifeBudget(0);
			budget.setCollegeBudget(0);
			
			model.addAttribute("budget", budget);
			model.addAttribute("total", total);
			model.addAttribute("foodP", foodP);
			model.addAttribute("healthP", healthP);
			model.addAttribute("entertainmentP", entertainmentP);
			model.addAttribute("nightlifeP", nightlifeP);
			model.addAttribute("collegeP", collegeP);
			
			return "budget";
		}
		return "login";
	}

	@PostMapping("/budget")
	public String saveBudget(HttpSession session, @ModelAttribute("budget") Budget budget, Model model) {
		User user = (User) session.getAttribute("user");
		if (user != null) {

			budget.setEmail(user.getEmail());
			budgetDao.saveOrUpdateBudget(budget);

			return "budget";

		}
		return "login";

	}

}
