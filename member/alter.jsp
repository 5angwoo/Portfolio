<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*"%>
<%
	Connection conn = null;
	Statement st = null;
	ResultSet rs = null;
	
	try{
		Class.forName("org.gjt.mm.mysql.Driver");
	}catch(ClassNotFoundException e){
		out.println(e);
	}
	
	try{
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/member?useUnicode=true&characterEncoding=euckr","root","1234");
	}catch(SQLException e){
		out.println(e);
	}
	
	try{
		st = conn.createStatement();
		st.executeUpdate("alter table woori add email char(30)");
		st.executeUpdate("alter table woori add password integer");
		st.executeUpdate("alter table woori modify name char(20) not null");
	}catch(SQLException e){
		out.println(e);
	}
	
	try{
		rs = st.executeQuery("select * from woori");
		ResultSetMetaData rsmd = rs.getMetaData();
		out.println("���̺��� ���� �Ǿ����ϴ�.<br>");
		out.println(rsmd.getColumnCount()+"���� �ʵ带 ������ ������<br>");
		for(int i=1 ; i<=rsmd.getColumnCount() ; i++){
			out.println("<br>�÷� �̸� : " + rsmd.getColumnName(i));
			out.println("<br>�÷� Ÿ�� : " + rsmd.getColumnType(i));
			out.println("<br>�÷� ������ : " + rsmd.getColumnDisplaySize(i) + "<br>");
			
		}
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

</body>
</html>