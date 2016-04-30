package com.leo.ads;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping(value = "/dummy24.htm")
public class Dummy24Controller {
	@RequestMapping(method = RequestMethod.GET)
	public String addInput (HttpServletRequest req, HttpServletResponse res) {
		return "model24h";
	}
}




