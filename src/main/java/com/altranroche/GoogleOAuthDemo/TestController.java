package com.altranroche.GoogleOAuthDemo;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.LinkedHashMap;

import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.security.oauth2.provider.OAuth2Authentication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestController {
	
	/*
	 * URL-mapping: [/] accessible public without any authentication
	 */
	@GetMapping("/")
	public String homePageTest() {

		return "Welcome to the GoogleOAuthDemoApplication";
	}

	/*
	 * URL-mapping: [/public] accessible public without any authentication
	 */
	@GetMapping("/public")
	public String test1() {

		DateTimeFormatter datumFormatter = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
		LocalDateTime local = LocalDateTime.now();
		String timeMessage = "PUBLIC URL: Current Date/Time is: " + datumFormatter.format(local);

		return timeMessage;
	}

	/*
	 * URL-mapping: [/restricted] accessible only upon authentication by Google
	 * account
	 */
	@GetMapping("/restricted")
	public String test2() {

		Object details = ((UsernamePasswordAuthenticationToken) ((OAuth2Authentication) ((SecurityContextImpl) SecurityContextHolder
				.getContext()).getAuthentication()).getUserAuthentication()).getDetails();
		String userName = ((LinkedHashMap<?, ?>) details).values().toArray()[1].toString();
		String userPic = ((LinkedHashMap<?, ?>) details).values().toArray()[4].toString();
		String userEmail = ((LinkedHashMap<?, ?>) details).values().toArray()[5].toString();

		return "RESTRICTED URL: Loggedin User Name: " + userName + " --> User Picture: " + userPic + "--> User Email: "
				+ userEmail;
	}

}
