package com.java1234.util;

import java.io.UnsupportedEncodingException;

public class StringUtil {

	public static boolean isEmpty(String str){
		if("".equals(str)|| str==null){
			return true;
		}else{
			return false;
		}
	}
	
	public static boolean isNotEmpty(String str){
		if(!"".equals(str)&&str!=null){
			return true;
		}else{
			return false;
		}
	}
	
	public static String parseUtf8(String str) {
		String rs = "";
		if(null != str && !"".equals(str.trim())) {
			 try {
				rs = new String(str.getBytes("iso8859-1"),"UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}  
		}
		return rs;
	}
}
