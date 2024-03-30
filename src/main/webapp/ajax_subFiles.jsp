<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.nio.file.Files"%>
<%@page import="java.io.IOException"%>
<%@page import="java.nio.file.attribute.BasicFileAttributes"%>
<%@page import="java.nio.file.Paths"%>
<%@page import="java.nio.file.Path"%>
<%@page import="org.json.JSONObject"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.io.File"%>
<%@page import="org.json.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
	JSONArray jArray=new JSONArray();
	
	File watchFiles=new File("C:\\Users\\");
	File subFiles[]=watchFiles.listFiles();
	
	Calendar createTimeCalendar=Calendar.getInstance();
	Calendar lastModifiedTimeCalendar=Calendar.getInstance();
	Calendar lastAccessTimeCalendar=Calendar.getInstance();
	int count=0;
		
	for(File a:subFiles){
		count++;
		JSONObject jObj=new JSONObject();
			
		Path individualFilePath=Paths.get("C:\\Users\\"+a.getName());
		BasicFileAttributes attrs=null;
		try{
			attrs=Files.readAttributes(individualFilePath, BasicFileAttributes.class);
		}catch(IOException e){
			e.printStackTrace();
		}
		createTimeCalendar.setTimeInMillis(attrs.creationTime().toMillis());
		lastModifiedTimeCalendar.setTimeInMillis(attrs.lastModifiedTime().toMillis());
		lastAccessTimeCalendar.setTimeInMillis(attrs.lastAccessTime().toMillis());
			
		jObj.put("id",count);
		jObj.put("filename",a.getName());
		jObj.put("createTime",new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(createTimeCalendar.getTime()));
		jObj.put("lastModifiedTime",new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(lastModifiedTimeCalendar.getTime()));
		jObj.put("lastAccessTime",new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(lastAccessTimeCalendar.getTime()));
		jArray.put(count-1, jObj);
	}
	out.print(jArray);
	out.flush();
%>

<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
	
	</body>
</html>

