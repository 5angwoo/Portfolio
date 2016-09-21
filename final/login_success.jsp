<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="user" class="cuckoo.user.UserEntity" scope="page" />
	<%
		out.println("로그인은 어찌어찌 하였건만...오늘은 여기까지..더 진도가 안나가네..");
		
	%>
	<br>
	<a href=logout.jsp >로그아웃</a>
</body>
</html>