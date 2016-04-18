package com.leo.ads;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;



import org.apache.commons.codec.binary.Base64;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.HttpClientBuilder;
import org.json.JSONArray;
import org.json.JSONObject;
//import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.json.simple.parser.JSONParser;

import com.cedarsoftware.util.io.JsonReader;


public class HttpPostReq {

	HttpPost createConnectivity(String restUrl)
    {
        HttpPost post = new HttpPost(restUrl);
//        String auth=new StringBuffer(username).append(":").append(password).toString();
//        byte[] encodedAuth = Base64.encodeBase64(auth.getBytes(Charset.forName("US-ASCII")));
        String authHeader = "Bearer " + "e0oswmFDkUElyZ+Tb8UAuzdW2TwPdU/7VWhaHbjgNLe/4Y6GLrwg8YoQCUZ5fUg8jRUJ3ea8tY+E3evq0o+vhQ=="; // api key
        post.setHeader("AUTHORIZATION", authHeader);
        post.setHeader("Content-Type", "application/json");
            post.setHeader("Accept", "application/json");
            post.setHeader("X-Stream" , "true");
        return post;
    }
     
    @SuppressWarnings("finally")
	String executeReq(String jsonData, HttpPost httpPost)
    {
    	String predict = null;
        try{
             predict = executeHttpRequest(jsonData, httpPost);
            
        }
        catch (UnsupportedEncodingException e){
            System.out.println("error while encoding api url : "+e);
        }
        catch (IOException e){
            System.out.println("ioException occured while sending http request : "+e);
        }
        catch(Exception e){
            System.out.println("exception occured while sending http request : "+e);
        }
        finally{
            httpPost.releaseConnection();
            return predict;
        }
    }
     
    String executeHttpRequest(String jsonData,  HttpPost httpPost)  throws UnsupportedEncodingException, IOException
    {
        HttpResponse response=null;
        String line = "";
        StringBuffer result = new StringBuffer();
        httpPost.setEntity(new StringEntity(jsonData));
        HttpClient client = HttpClientBuilder.create().build();
        response = client.execute(httpPost);
        System.out.println("Post parameters : " + jsonData );
        System.out.println("Response Code : " + response.getStatusLine().getStatusCode());
//        response.getEntity().getContent()
        BufferedReader reader = new BufferedReader(new InputStreamReader(response.getEntity().getContent()));
        while ((line = reader.readLine()) != null){ result.append(line); }
        System.out.println(result.toString());
        
        
//        JSONObject t = (JSONObject) result.toString();
//        String json = result.toString();
//       		Object obj = JsonReader.jsonToJava(json);
//        		JSONObject test = (JSONObject)obj;
//        		test.get(")
        
//        JSONParser parser = new JSONParser();
//        JSONObject json = (JSONObject) parser.parse(result.toString());
        
        
        JSONObject jsonObj = new JSONObject(result.toString());
        JSONObject obj2 = (JSONObject)jsonObj.get("Results");
        System.out.println("obj2 -> "+jsonObj.get("Results"));
        
        JSONObject obj3 = (JSONObject)obj2.get("output1");
        System.out.println("obj3 -> "+obj2.get("output1"));
        
        JSONObject obj4 = (JSONObject)obj3.get("value");
        System.out.println("obj4 -> "+obj3.get("value"));
        
        JSONArray objArray5 = (JSONArray)obj4.get("Values");
        System.out.println("obj5 -> "+objArray5.get(0));
        
        JSONArray arr2 = (JSONArray)objArray5.get(0);
        System.out.println("objArray element output -> "+arr2.getString(8));
        
        String output = arr2.getString(8);
        return output;
//        obj2.get("output1");
//        System.out.println(jsonObj.get("Results"));
        
//        InputStream is = response.getEntity().getContent();
//        StringBuilder sb = new StringBuilder();
//        String line1 = null;
//        try {
//            while ((line1 = reader.readLine()) != null) {
//                sb.append(line1 + "\n");
//            }
//        } catch (IOException e) {
//            e.printStackTrace();
//        } finally {
//            try {
//                is.close();
//            } catch (IOException e) {
//                e.printStackTrace();
//            }
//        }
        
//        String res = sb.toString();
//        Object myObject = JSONValue.parse(reader);
//        System.out.println(myObject);
        
    }

}
