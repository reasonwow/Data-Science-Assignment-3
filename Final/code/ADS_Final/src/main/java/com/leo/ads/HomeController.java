package com.leo.ads;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.nio.charset.Charset;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

//import javax.json.Json;
//import javax.json.JsonObject;
import javax.security.sasl.AuthorizeCallback;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.binary.Base64;
import org.apache.http.client.methods.HttpPost;
import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.leo.ads.pojo.GetDate;

import javax.servlet.http.*;
/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value = "/mainInput.htm")
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
		String restUrl="https://ussouthcentral.services.azureml.net/workspaces/ad7eba57cb134c21be182a9ac192b023/services/e027eb48aa1a412aaca28c4d811a5eeb/execute?api-version=2.0&details=true";
//        JSONObject user=new JSONObject();
		JSONObject user=new JSONObject();
		JSONObject inputa=new JSONObject();
//		JSONObject user=new JSONObject();
		
		System.out.println("inside homecontroller addinput");
		
		
		
	
//		String user1 = "{\"Inputs\": {\"input1\": {\"ColumnNames\": [\"PassengerId\",\"Survived\","
//				+ "\"Pclass\",\"Name\",\"Sex\",\"Age\",\"SibSp\",\"Parch\",\"Ticket\",\"Fare\",\"Cabin\","
//				+ "\"Embarked\"],\"Values\": [[\"0\",\"0\",\"0\",\"value\",\"value\",\"0\",\"0\",\"0\","
//				+ "\"value\",\"0\",\"value\",\"value\"],[\"0\",\"0\",\"0\",\"value\",\"value\",\"0\","
//				+ "\"0\",\"0\",\"value\",\"0\",\"value\",\"value\"]]}},\"GlobalParameters\": {}}";
//		
//		
//		String user2 = "\"Results\": {\"output1\": {\"type\": \"DataTable\",\"value\": {\"ColumnNames\": "
//				+ "[\"Date\",\"Catergroy\",\"Building\",\"TemperatureF\",\"Humidity\",\"Events\","
//				+ "\"workingDay\",\"Holiday\",\"Scored Labels\"],\"ColumnTypes\": [\"Object\","
//				+ "\"Categorical\",\"Categorical\",\"Numeric\",\"Numeric\",\"Categorical\","
//				+ "\"Categorical\",\"Categorical\",\"Numeric\"],\"Values\": [[\"1/1/2015 12:00:00 AM\",\"BCYF\","
//				+ "\"AGASSIZ\",\"98\",\"10\",\"Fog\",\"1\",\"1\",\"0\"],[\"\",\"BCYF\",\"AGASSIZ\",\"0\","
//				+ "\"0\",\"Fog\",\"0\",\"0\",\"0\"]]}}}}";//not use
//		
		
		
//		String date = req.getParameter("date");
////		String category = req.getParameter("category");
//		String building_dd = req.getParameter("buliding_dd");
//		String temperature = req.getParameter("temperature");
//		String humidity = req.getParameter("humidity");
//		String events_dd = req.getParameter("events_dd");
//		String workingDay = req.getParameter("workingDay");
//		String holiday = req.getParameter("holiday");
//		
//		String cate_dd = req.getParameter("category_dd");
		
//		System.out.println(cate_dd);
		
//		String userInput = "{\"Inputs\": {\"input1\": {\"ColumnNames\": [\"Date\",\"Catergroy\","
//				+ "\"Building\",\"TemperatureF\",\"Humidity\",\"Events\",\"workingDay\",\"Holiday\""
//				+ "],\"Values\": [[\""+date + "\",\""+cate_dd+"\",\""+ building_dd +"\",\""+ temperature+ "\",\""+humidity+"\",\""+events_dd+"\",\""+ workingDay+"\",\""+holiday+"\"],"
//				+ "[\""+date + "\",\""+cate_dd+"\",\""+ building_dd +"\",\""+ temperature+ "\",\""+humidity+"\",\""+events_dd+"\",\""+ workingDay+"\",\""+holiday+"\"]]}},\"GlobalParameters\": {}}";
		// 12:00:00 AM
		
		
		String date = req.getParameter("date");
		date = date+" 12:00:00";
		System.out.println("date = " + date);
		String zipCode_dd = req.getParameter("zipCode_dd");
		System.out.println("inside 24, zipcode = "+zipCode_dd);
		
		String workDay = req.getParameter("workDay");
		System.out.println("inside 24, workDay = "+workDay);
		String weatherCondition="";
		String tempUse = "";
		try {

			URL url = new URL("http://api.openweathermap.org/data/2.5/forecast?q=NewYorkCity,us&appid=c8800e57cb4f0178c9b8894a5997823b");
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Accept", "application/json");

			if (conn.getResponseCode() != 200) {
				throw new RuntimeException("Failed : HTTP error code : "
						+ conn.getResponseCode());
			}

			BufferedReader br = new BufferedReader(new InputStreamReader(
				(conn.getInputStream())));

			
			
			
			String output;
			StringBuffer result = new StringBuffer();
			System.out.println("Output from Server .... \n");
			while ((output = br.readLine()) != null) {
				result.append(output);
//				System.out.println(output);
			}
			System.out.println(result.toString());

			JSONObject jsonObj = new JSONObject(result.toString());
			JSONArray obj2 = (JSONArray)jsonObj.get("list");
	        System.out.println("obj2 -> "+jsonObj.get("list"));
	        int len = obj2.length();
	        JSONObject targetJson = new JSONObject();
	        for(int i = 0; i < len; i++){
	        	JSONObject obj3 = (JSONObject)obj2.get(i);
		        System.out.println("obj3 -> "+obj2.get(i));
		        String dateInside = obj3.getString("dt_txt");
		        System.out.println("obj4 weather -> "+obj3.get("dt_txt"));
		        if(dateInside.equals(date)){
		        	System.out.println("inside if "+dateInside);
		        	targetJson = obj3;
		        	break;
		        }
	        }
	        
//	        JSONObject obj3 = (JSONObject)obj2.get(0);
//	        System.out.println("obj3 -> "+obj2.get(0));
	        
	        JSONArray obj4 = (JSONArray)targetJson.get("weather");
	        System.out.println("obj4 weather -> "+targetJson.get("weather"));
	        
	        JSONObject obj_weather = (JSONObject)obj4.get(0);
	        System.out.println("obj_weather -> "+obj4.get(0));
	        
	        weatherCondition = obj_weather.getString("main");
	        System.out.println("condition = " + weatherCondition);
	        
	        JSONObject tempObj = (JSONObject)targetJson.get("main");
	        System.out.println("tempObj weather -> "+targetJson.get("main"));
	        
	        Double temp = tempObj.getDouble("temp");
	        temp = temp*1.8 - 459.67;
	        System.out.println("temp = " + temp);
	        Integer i = temp.intValue();
	        tempUse = String.valueOf(i);
	        
	        final String OLD_FORMAT = "yyyy-MM-dd hh:mm:ss";
	        final String NEW_FORMAT = "yyyy/MM/dd hh:mm:ss";

	        // August 12, 2010
	        String oldDateString = date;
	        String newDateString;

	        SimpleDateFormat sdf = new SimpleDateFormat(OLD_FORMAT);
	        Date d = sdf.parse(oldDateString);
	        sdf.applyPattern(NEW_FORMAT);
	        newDateString = sdf.format(d);
	        
	        System.out.println("old date= "+oldDateString+" new date = "+newDateString);
	        
	        
//	        GetDate gd = new GetDate();
//	        gd.testDate();
	        
	        
//	        while ((line = reader.readLine()) != null){ result.append(line); }
//	        System.out.println(result.toString());
			
			conn.disconnect();

		  } catch (MalformedURLException e) {

			e.printStackTrace();

		  } catch (IOException e) {

			e.printStackTrace();

 		  } catch(ParseException e){
 				e.printStackTrace();
 		  }
		
		
		String userInput = "{\"Inputs\": {\"input1\": {\"ColumnNames\": [\"ZipCode\",\"TemperatureF\",\"Preci\","
				+ "\"workDay\",\"Conditions\",\"date\"],\"Values\": [[\""+zipCode_dd+"\",\""+tempUse+"\",\"0\",\""+workDay+"\",\""+weatherCondition+"\",\""+date+"\""
				+ "],[\"10001\",\"0\",\"0\",\"0\",\"Clear\",\"2016/05/01\"]]}},\"GlobalParameters\": {}}";
		
   
        
        
        
//        String jsonData=user.toString();
        HttpPostReq httpPostReq=new HttpPostReq();
        HttpPost httpPost = httpPostReq.createConnectivity(restUrl);
        String[] predictOutput = httpPostReq.executeReq(userInput, httpPost);
		System.out.println("this is in the home controller -> zipcode = "+predictOutput[0]+"output = "+predictOutput[1]);
//       return null;
		mv.addObject("zipCode", predictOutput[0]);
		mv.addObject("output", predictOutput[1]);
		mv.setViewName("try2");
        return mv;
	}
		
	
}
