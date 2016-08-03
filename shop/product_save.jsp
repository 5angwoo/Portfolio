<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,java.util.*,java.text.*"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ pate import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<% request.setCharacterEncoding("euc-kr"); %>

<%
	String fileurl = "/jsp/chap12/upload/";
	String saveFolder="upload";
	String encType="euc-kr";
	int Maxsize=5*1024*1024;
	
	ServletContext context=getServletContext();
	MultipartRequest multi = null;
	
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>