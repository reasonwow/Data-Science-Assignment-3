package com.leo.ads;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/apiWeather.htm")
public class FinalWeatherUnderGroundAPIController {
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView addInput (HttpServletRequest req, HttpServletResponse res) {
		System.out.println("This is the api key page.");		
		
		URL url;

        try {
        	

        	String month = "4";
        	String year = "2014"; 
        	
//        	File file = new File("/Users/youli/Data_weather/14_04_combine1.txt");//	2014/04
//        	File file = new File("/Users/youli/Data_weather/14_05_combine1.txt");//	2014/05
//        	File file = new File("/Users/youli/Data_weather/14_06_combine1.txt");// 2014/06
//        	File file = new File("/Users/youli/Data_weather/15_04_combine1.txt");// 2015/04
//        	File file = new File("/Users/youli/Data_weather/15_05_combine1.txt");// 2015/05
//        	File file = new File("/Users/youli/Data_weather/15_06_combine1.txt");// 2015/06
        	
//        	File file = new File("/Users/youli/Data_weather/15_01_combine1.txt");// 2015/01
//        	File file = new File("/Users/youli/Data_weather/15_02_combine1.txt");// 2015/02
        	File file = new File("/Users/youli/Data_weather/15_03_combine1.txt");// 2015/03

        	if (!file.exists()) {
				file.createNewFile();
			}
        	FileWriter fw = new FileWriter(file.getAbsoluteFile());
			BufferedWriter bw = new BufferedWriter(fw);
        	for(int day=1; day <= 31; day++){
        		
        		
	              String a="https://www.wunderground.com/history/airport/KNYC/2015/3/"+day+"/DailyHistory.html?req_city=New+York&req_state=NY&req_statename=New+York&reqdb.zip=10001&reqdb.magic=5&reqdb.wmo=99999&MR=1&format=1";
	              url = new URL(a);
	              URLConnection conn = url.openConnection();
	  
	              // open the stream and put it into BufferedReader
	              BufferedReader br = new BufferedReader(
	                                 new InputStreamReader(conn.getInputStream()));
	  
	              String inputLine;
	              while ((inputLine = br.readLine()) != null) {
	//                      System.out.println(inputLine);
	              	if(!inputLine.equals("TimeEST,TemperatureF,Dew PointF,Humidity,Sea Level PressureIn,VisibilityMPH,"
	              			+ "Wind Direction,Wind SpeedMPH,Gust SpeedMPH,PrecipitationIn,Events,Conditions,"
	              			+ "WindDirDegrees,DateUTC<br />")){
	              		bw.write("\r\n");  
	              		bw.write(inputLine);
	                      
	              	}
	                     
	              }
	             
	              br.close();
	  
	              System.out.println("day"+day+" Done");
        	}
        	 bw.close();
	  
      } catch (MalformedURLException e) {
          e.printStackTrace();
      } catch (IOException e) {
          e.printStackTrace();
      }
  		
        	
        	
        	
     
        	return null;
	}
}
