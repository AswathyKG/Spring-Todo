 package com.aswathy.webapp;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class SayHelloController {
	
//	return plain text
	@RequestMapping("say-hello")
	@ResponseBody
	public String sayHello() {
		return "Hello! This is my First Spring web app";
	}
	
//	return html
	@RequestMapping("say-hello-html")
	@ResponseBody
	public String sayHelloHtml() {
		StringBuffer sb = new StringBuffer();
		sb.append("<html>");
		sb.append("<head>");
		sb.append("<title>basic html page</title>");
		sb.append("</head>");
		sb.append("<body");
		sb.append("<h3>WELCOME</h3>");
		sb.append("</body>");
		sb.append("</html>");
		 
		return sb.toString();
	}
	
//	return jsp file
	@RequestMapping("say-hello-jsp")
	public String sayHelloJsp() {
		return "sayHello";
	}
}
