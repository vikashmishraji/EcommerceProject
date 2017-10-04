package com.niit.controllers;

import javax.validation.Valid;

import org.apache.catalina.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.niit.model.Customer;
import com.niit.service.CustomerService;

@Controller
public class CustomerController {

	
	
	public CustomerController() {
		System.out.println("gggg");
		// TODO Auto-generated constructor stub
	}

	@Autowired
	private CustomerService customerService;

	@RequestMapping("/Registrationform")
	public String getRegistrationForm(Model model) {
		model.addAttribute("customer", new Customer());
		return "Registrationform";
	}

	@RequestMapping("/all_savecustomer")
	public String registerCustomer(@Valid @ModelAttribute Customer customer, BindingResult result,Model model)
	{
		
		if (result.hasErrors()) 
		{
			
			return "Registrationform";
		}
		
		User user=(User) customerService.validateUsername(customer.getUser().getUsername());
		if(user!=null){
			model.addAttribute("duplicateUsername","Username already exists");
			
			return "Registrationform";
			
		}
		
		Customer duplicateCustomer= customerService.validateEmail(customer.getEmail());
			if(duplicateCustomer!=null)
			{
				model.addAttribute("duplicateEmail","Email address alreay exists");
				
				return "Registrationform";
			}
		customerService.registerCustomer(customer);
		
		return "home";
	}

}
