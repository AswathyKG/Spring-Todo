package com.aswathy.webapp.login;

import org.springframework.stereotype.Service;

@Service
public class AuthenticationService {
	
	public boolean authenticate(String username, String password) {
		boolean isValidUserName = username.equalsIgnoreCase("Aswathy");
		boolean isValidPassword = password.equalsIgnoreCase("achu@123");
		return isValidUserName && isValidPassword; 
	}

}
