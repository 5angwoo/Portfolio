<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*"%>
<%
	Connection conn = null;
	Statement st = null;
	ResultSet rs = null;
	// JDBC 등록
	try{
		Class.forName("org.gjt.mm.mysql.Driver");		
	}catch(ClassNotFoundException e){
		out.println(e);
	}
	//DB Connection
	try{
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/member?useUnicode=true&characterEncoding=euckr", "root", "1234");
	}catch(SQLException e){
		out.println(e);
	}
	
	// Execute Query
	try{
		st = conn.createStatement();
		st.executeUpdate("create table woori(id char(10) primary key, name char(10))");
	}catch(SQLException e){
		out.println(e);
	}
	
	try{
		rs = st.executeQuery("select * from woori");
		ResultSetMetaData rsmd = rs.getMetaData();
		out.println("새로운 테이블 생성완료");
		out.println(rsmd.getColumnCount() + "개의 컬럼을 가지고 있음<br>");
		for(int i=1 ; i<=rsmd.getColumnCount() ; i++){
			out.println(i+"번째 컬럼명 : " + rsmd.getColumnName(i));
			out.println(i+"번째 컬럼명 : " + rsmd.getColumnName(i));			
		}
		rs.close();
		st.close();
		conn.close();
	}catch(SQLException e){
		out.println(e);
	}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<a href="main.html">main으로</a>
</body>
</html>