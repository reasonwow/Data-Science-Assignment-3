package com.leo.ads;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.http.client.methods.HttpPost;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.leo.ads.pojo.GetDate;

import junit.extensions.TestDecorator;

@Controller
@RequestMapping(value = "/hotSpot24.htm")
public class HotSpot24Controller {
	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView addInput (HttpServletRequest req, HttpServletResponse res) {
		ModelAndView mv= new ModelAndView();
		String restUrl= "https://ussouthcentral.services.azureml.net/workspaces/ad7eba57cb134c21be182a9ac192b023/services/81462f062813498e9b8e06a2a8100d3f/execute?api-version=2.0&details=true";
		String zipCode_dd = req.getParameter("zipCode_dd");
		System.out.println("inside 24, zipcode = "+zipCode_dd);
		String tempUse = "";
		String weatherCondition = "";
		String[] timeSlot = new String[8];
		String testDateString="";
		String[] predictOutput = new String[9];
		try {

			 Date date = new Date();
		        System.out.println("date is "+ date.toString());
		        DateFormat df = new SimpleDateFormat("yyyy/MM/dd");
		        testDateString = df.format(date);
		        System.out.println("String in yyyy/MM/dd format is: " + testDateString);
		        String testDateString0 = "0";
		        String testDateString1 = "3";
		        String testDateString2 = "6";
		        String testDateString3 = "9";
		        String testDateString4 = "12";
		        String testDateString5 = "15";
		        String testDateString6 = "18";
		        String testDateString7 = "21";
		        
		        
		        timeSlot[0] = testDateString0;
		        timeSlot[1] = testDateString1;
		        timeSlot[2] = testDateString2;
		        timeSlot[3] = testDateString3;
		        timeSlot[4] = testDateString4;
		        timeSlot[5] = testDateString5;
		        timeSlot[6] = testDateString6;
		        timeSlot[7] = testDateString7;
		        
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
	        
	        

	       
	        
	        
	        
	        System.out.println("String in yyyy/MM/dd format is after parse: " + testDateString);
//			String dateString = date.toString();
//			dateString = dateString + " 00:00:00";
			
//			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd hh:mm:ss");
//			
//			Date date1 = sdf.parse(dateString);
//			System.out.println("date1 is "+ date1.toString());
//			Calendar cal1 = Calendar.getInstance();
//			cal1.setTime(date1);
			
			
			
			
			
//			cal.add(Calendar.HOUR_OF_DAY, 1);
//			System.out.println("afte add, date is "+ cal.getTime());
			
//			timeSlot[0] = cal.getTime().toString();
//			for(int k = 1; k < 8; k++){
//				cal1.add(Calendar.HOUR_OF_DAY, 3);
//				System.out.println("in for loop, date is "+ cal1.getTime());
//				timeSlot[k] = cal1.getTime().toString();
//			}
	        
	        
//	        int len = obj2.length();
//	        JSONObject targetJson = new JSONObject();
//	        for(int i = 0; i < len; i++){
//	        	JSONObject obj3 = (JSONObject)obj2.get(i);
//		        System.out.println("obj3 -> "+obj2.get(i));
//		        String dateInside = obj3.getString("dt_txt");
//		        System.out.println("obj4 weather -> "+obj3.get("dt_txt"));
//		        
//	        }
	        
	        JSONObject obj3 = (JSONObject)obj2.get(0);
	        System.out.println("obj3 -> "+obj2.get(0));
	        
	        JSONArray obj4 = (JSONArray)obj3.get("weather");
	        System.out.println("obj4 weather -> "+obj3.get("weather"));
	        
	        JSONObject obj_weather = (JSONObject)obj4.get(0);
	        System.out.println("obj_weather -> "+obj4.get(0));
	        
	        weatherCondition = obj_weather.getString("main");
	        System.out.println("condition = " + weatherCondition);
	        
	        JSONObject tempObj = (JSONObject)obj3.get("main");
	        System.out.println("tempObj weather -> "+obj3.get("main"));
	        
//	        Double temp = tempObj.getDouble("temp");
//	        System.out.println("condition = " + temp);
	        
	        Double temp = tempObj.getDouble("temp");
	        temp = temp*1.8 - 459.67;
	        System.out.println("temp = " + temp);
	        Integer i = temp.intValue();
	        tempUse = String.valueOf(i);
	        
	        
	        GetDate gd = new GetDate();
	        gd.testDate();
//	        while ((line = reader.readLine()) != null){ result.append(line); }
//	        System.out.println(result.toString());
			
			conn.disconnect();

		  } catch (MalformedURLException e) {

			e.printStackTrace();

		  } catch (IOException e) {

			e.printStackTrace();

		  } 
//		catch(ParseException e){
//				e.printStackTrace();
//		  }

//		String userInputDes = "{\"Inputs\": {\"input1\": {\"ColumnNames\": [\"ZipCode\",\"TemperatureF\",\"Preci\","
//				+ "\"workDay\",\"Conditions\",\"date\"],\"Values\": [[\""+zipCode_dd+"\",\""+tempUse+"\",\"0\",\""+workDay+"\",\""+weatherCondition+"\",\""+date+"\""
//				+ "],[\"10001\",\"0\",\"0\",\"0\",\"Clear\",\"2016/05/01\"]]}},\"GlobalParameters\": {}}";
		
		String userInput = "{\"Inputs\": {\"input1\": {\"ColumnNames\": [\"hour\",\"ZipCode\",\"TemperatureF\",\"Preci\","
				+ "\"Conditions\",\"workDay\",\"dateTime\"],\"Values\": [[\""+timeSlot[0]+"\",\""+zipCode_dd+"\",\""+tempUse+"\",\"0\",\""+weatherCondition+"\",\"0\","
				+ "\""+testDateString+"\"],[\""+timeSlot[1]+"\",\""+zipCode_dd+"\",\""+tempUse+"\",\"0\",\""+weatherCondition+"\",\"0\","
				+ "\""+testDateString+"\"],[\""+timeSlot[2]+"\",\""+zipCode_dd+"\",\""+tempUse+"\",\"0\",\""+weatherCondition+"\",\"0\","
				+ "\""+testDateString+"\"],[\""+timeSlot[3]+"\",\""+zipCode_dd+"\",\""+tempUse+"\",\"0\",\""+weatherCondition+"\",\"0\","
				+ "\""+testDateString+"\"],[\""+timeSlot[4]+"\",\""+zipCode_dd+"\",\""+tempUse+"\",\"0\",\""+weatherCondition+"\",\"0\","
				+ "\""+testDateString+"\"],[\""+timeSlot[5]+"\",\""+zipCode_dd+"\",\""+tempUse+"\",\"0\",\""+weatherCondition+"\",\"0\","
				+ "\""+testDateString+"\"],[\""+timeSlot[6]+"\",\""+zipCode_dd+"\",\""+tempUse+"\",\"0\",\""+weatherCondition+"\",\"0\","
				+ "\""+testDateString+"\"],[\""+timeSlot[7]+"\",\""+zipCode_dd+"\",\""+tempUse+"\",\"0\",\""+weatherCondition+"\",\"0\","
				+ "\""+testDateString+"\"],]}},\"GlobalParameters\": {}}";
		
		HttpPostReq httpPostReq=new HttpPostReq();
        HttpPost httpPost = httpPostReq.createConnectivityFor24(restUrl);
        predictOutput = httpPostReq.executeReq24(userInput, httpPost);
		System.out.println("this is in the home controller -> zipcode = "+predictOutput[0]+"output = "+predictOutput[1]);
//       return null;
		
		mv.addObject("output0", predictOutput[0]);
		mv.addObject("output1", predictOutput[1]);
		mv.addObject("output2", predictOutput[2]);
		mv.addObject("output3", predictOutput[3]);
		mv.addObject("output4", predictOutput[4]);
		mv.addObject("output5", predictOutput[5]);
		mv.addObject("output6", predictOutput[6]);
		mv.addObject("output7", predictOutput[7]);
		mv.addObject("zipCode", predictOutput[8]);
		
		mv.setViewName("try3");
        return mv;
	}
	
		
	
}
