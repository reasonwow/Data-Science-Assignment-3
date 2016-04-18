package com.leo.ads;

import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.Charset;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

//import javax.json.Json;
//import javax.json.JsonObject;
import javax.security.sasl.AuthorizeCallback;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.binary.Base64;
import org.apache.http.client.methods.HttpPost;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.*;
/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value = "/addInput.htm")
public class HomeController {
		
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	@RequestMapping(method=RequestMethod.GET)
    public String initializeForm(HttpServletRequest req, HttpServletResponse res) { 
		return "try3";
        
    } 
	
	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView addInput (HttpServletRequest req, HttpServletResponse res) {
		
		ModelAndView mv= new ModelAndView();
		String restUrl="https://ussouthcentral.services.azureml.net/workspaces/ad7eba57cb134c21be182a9ac192b023/services/805758a66d62483faeb67b53f6f6883d/execute?api-version=2.0&details=true";
//        JSONObject user=new JSONObject();
		JSONObject user=new JSONObject();
		JSONObject inputa=new JSONObject();
//		JSONObject user=new JSONObject();
		
		System.out.println("inside homecontroller addinput");
		
		
		
	
		String user1 = "{\"Inputs\": {\"input1\": {\"ColumnNames\": [\"PassengerId\",\"Survived\","
				+ "\"Pclass\",\"Name\",\"Sex\",\"Age\",\"SibSp\",\"Parch\",\"Ticket\",\"Fare\",\"Cabin\","
				+ "\"Embarked\"],\"Values\": [[\"0\",\"0\",\"0\",\"value\",\"value\",\"0\",\"0\",\"0\","
				+ "\"value\",\"0\",\"value\",\"value\"],[\"0\",\"0\",\"0\",\"value\",\"value\",\"0\","
				+ "\"0\",\"0\",\"value\",\"0\",\"value\",\"value\"]]}},\"GlobalParameters\": {}}";
		
		
		String user2 = "\"Results\": {\"output1\": {\"type\": \"DataTable\",\"value\": {\"ColumnNames\": "
				+ "[\"Date\",\"Catergroy\",\"Building\",\"TemperatureF\",\"Humidity\",\"Events\","
				+ "\"workingDay\",\"Holiday\",\"Scored Labels\"],\"ColumnTypes\": [\"Object\","
				+ "\"Categorical\",\"Categorical\",\"Numeric\",\"Numeric\",\"Categorical\","
				+ "\"Categorical\",\"Categorical\",\"Numeric\"],\"Values\": [[\"1/1/2015 12:00:00 AM\",\"BCYF\","
				+ "\"AGASSIZ\",\"98\",\"10\",\"Fog\",\"1\",\"1\",\"0\"],[\"\",\"BCYF\",\"AGASSIZ\",\"0\","
				+ "\"0\",\"Fog\",\"0\",\"0\",\"0\"]]}}}}";//not use
		
		String date = req.getParameter("date");
//		String category = req.getParameter("category");
		String building_dd = req.getParameter("buliding_dd");
		String temperature = req.getParameter("temperature");
		String humidity = req.getParameter("humidity");
		String events_dd = req.getParameter("events_dd");
		String workingDay = req.getParameter("workingDay");
		String holiday = req.getParameter("holiday");
		
		String cate_dd = req.getParameter("category_dd");
		
		System.out.println(cate_dd);
		
		String userInput = "{\"Inputs\": {\"input1\": {\"ColumnNames\": [\"Date\",\"Catergroy\","
				+ "\"Building\",\"TemperatureF\",\"Humidity\",\"Events\",\"workingDay\",\"Holiday\""
				+ "],\"Values\": [[\""+date + "\",\""+cate_dd+"\",\""+ building_dd +"\",\""+ temperature+ "\",\""+humidity+"\",\""+events_dd+"\",\""+ workingDay+"\",\""+holiday+"\"],"
				+ "[\""+date + "\",\""+cate_dd+"\",\""+ building_dd +"\",\""+ temperature+ "\",\""+humidity+"\",\""+events_dd+"\",\""+ workingDay+"\",\""+holiday+"\"]]}},\"GlobalParameters\": {}}";
		// 12:00:00 AM
		
   
        
        
        System.out.println("test");
//        String jsonData=user.toString();
        HttpPostReq httpPostReq=new HttpPostReq();
        HttpPost httpPost = httpPostReq.createConnectivity(restUrl);
        String predictOutput = httpPostReq.executeReq(userInput, httpPost);
		System.out.println("this is in the home controller -> "+predictOutput);
//       return null;
		mv.addObject("output", predictOutput);
		mv.setViewName("try2");
        return mv;
	}
		
	
}
