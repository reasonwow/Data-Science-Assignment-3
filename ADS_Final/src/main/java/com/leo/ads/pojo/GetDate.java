package com.leo.ads.pojo;


import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class GetDate {
	public GetDate(){
		
	}
	
	public void testDate(){
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Calendar cal = Calendar.getInstance();
		System.out.println("date is "+ cal.getTime());
		cal.add(Calendar.HOUR_OF_DAY, 1);
		System.out.println("afte add, date is "+ cal.getTime());
		
	}
	
}
