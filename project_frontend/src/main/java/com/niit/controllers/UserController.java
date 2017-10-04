package com.niit.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserController {
	
	UserController()
	{
		System.out.println("User Controller Initiated");
	}
	
	@RequestMapping("/loginUnsuccessfull")
	public String Unsuccesful_Login(Model model)
	{
		model.addAttribute("Invalid","Invalid Login_ID or Password");
		return "login";
	}
	

}
