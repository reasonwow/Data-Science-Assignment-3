package com.leo.ads;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/dummyBase.htm")
public class DummyBaseController {
	@RequestMapping(method = RequestMethod.GET)
	public String addInput (HttpServletRequest req, HttpServletResponse res) {
		return "modelBase";
	}
}
