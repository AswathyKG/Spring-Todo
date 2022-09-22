package com.aswathy.webapp.login;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;


@Controller
@SessionAttributes("name")
public class LoginController {
	
//	object for AuthentictionService class
	private AuthenticationService authService;
	 
//	constructor injection
	public LoginController(AuthenticationService authService) {
		super();
		this.authService = authService;
	}
	
//	logger
	private Logger logger =LoggerFactory.getLogger(getClass());
	


//	login page
	@RequestMapping(value="login",method = RequestMethod.GET)
	public String loginPage() {
//		logger
//		logger.debug("Request param is {}", username);
		return "login";
	}
	
//	home page
	@RequestMapping(value="login",method = RequestMethod.POST)
	public String homePage(@RequestParam String username,
			@RequestParam String password, ModelMap model) {
		
		if(authService.authenticate(username, password)) {
			
			model.put("name", username);
			model.put(password, model);
			return "home";
			
		}
		model.put("errorMessage", "Invalid Credentials! Please try again");
		return "login"; 
	}
	

//	home page
	@RequestMapping(value="home",method = RequestMethod.GET)
	public String home() {
		return "home";
	}
	
}
