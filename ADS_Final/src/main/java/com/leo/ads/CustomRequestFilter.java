//package com.leo.ads;
//
//import java.io.IOException;
//
//import javax.servlet.Filter;
//import javax.servlet.FilterChain;
//import javax.servlet.FilterConfig;
//import javax.servlet.ServletException;
//import javax.servlet.ServletRequest;
//import javax.servlet.ServletResponse;
//import javax.servlet.http.HttpServletRequest;
//
//public class CustomRequestFilter implements Filter{
//
//	@Override
//	public void destroy() {
//		// TODO Auto-generated method stub
//		
//	}
//
//	@Override
//	public void doFilter(ServletRequest sreq, ServletResponse sresp,
//			   FilterChain fchain)
//					   throws IOException, ServletException {
//		  CustomHttpServletRequest request = new CustomHttpServletRequest((HttpServletRequest)sreq);
//		  request.addHeader("ssoid-token", encrypt("dummy"));
//		  fchain.doFilter(request, sresp); //New Request Object is passed
//	}
//
//	@Override
//	public void init(FilterConfig arg0) throws ServletException {
//		// TODO Auto-generated method stub
//		
//	}
//
//}
