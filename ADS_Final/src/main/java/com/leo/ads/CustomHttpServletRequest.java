package com.leo.ads;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class CustomHttpServletRequest extends HttpServletRequestWrapper{
	private Map<String , String> customHeaderMap = null;

	 public CustomHttpServletRequest(HttpServletRequest request) {
	  super(request);
	  customHeaderMap = new HashMap<String, String>();
	 }
	 
	 public void addHeader(String name,String value){
	  customHeaderMap.put(name, value);
	 }

	 @Override
	 public String getParameter(String name) {
	  String paramValue = super.getParameter(name); // query Strings
	  if (paramValue == null) {
	   paramValue = customHeaderMap.get(name);
	  }
	  return paramValue;
	 }
}
