//package com.leo.ads.pojo;
//
//import java.io.BufferedReader;
//import java.io.IOException;
//import java.io.InputStreamReader;
//import java.net.HttpURLConnection;
//import java.net.MalformedURLException;
//import java.net.URL;
//
//import org.json.JSONArray;
//import org.json.JSONObject;
//
//public class GetWeather {
//	public void getWeatherNow(){
//		try {
//
//			URL url = new URL("http://api.openweathermap.org/data/2.5/forecast?q=NewYorkCity,us&appid=c8800e57cb4f0178c9b8894a5997823b");
//			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
//			conn.setRequestMethod("GET");
//			conn.setRequestProperty("Accept", "application/json");
//
//			if (conn.getResponseCode() != 200) {
//				throw new RuntimeException("Failed : HTTP error code : "
//						+ conn.getResponseCode());
//			}
//
//			BufferedReader br = new BufferedReader(new InputStreamReader(
//				(conn.getInputStream())));
//
//			
//			
//			
//			String output;
//			StringBuffer result = new StringBuffer();
//			System.out.println("Output from Server .... \n");
//			while ((output = br.readLine()) != null) {
//				result.append(output);
////				System.out.println(output);
//			}
//			System.out.println(result.toString());
//
//			JSONObject jsonObj = new JSONObject(result.toString());
//			JSONArray obj2 = (JSONArray)jsonObj.get("list");
//	        System.out.println("obj2 -> "+jsonObj.get("list"));
//			
//	        
//	        GetDate gd = new GetDate();
//	        gd.testDate();
////	        while ((line = reader.readLine()) != null){ result.append(line); }
////	        System.out.println(result.toString());
//			
//			conn.disconnect();
//			return 
//
//		  } catch (MalformedURLException e) {
//
//			e.printStackTrace();
//
//		  } catch (IOException e) {
//
//			e.printStackTrace();
//
//		  }
//
//	}
//}
