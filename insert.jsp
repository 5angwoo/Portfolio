<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*,java.text.*,java.util.*"%>
    <%request.setCharacterEncoding("euc-kr"); %>
    
<%
	//������ �޾ƿ� ����
	String userid = request.getParameter("userid");
	String password = request.getParameter("password");
	String username = request.getParameter("username");
	String nickname = request.getParameter("nickname");
	String sex = request.getParameter("sex");
	String email = request.getParameter("email");
	//DB�� ���� ������
	String query = new String();
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	//?
	int check_count=0;
	//��¥ �޾ƿ���
	java.util.Date yymmdd = new java.util.Date();
	SimpleDateFormat myformat = new SimpleDateFormat("yy-MM-d h:mm a");
	String regdate = myformat.format(yymmdd);
	//DB���Ӵ�
	try{
		Class.forName("org.gjt.mm.mysql.Driver");
	}catch(ClassNotFoundException e){
		out.println(e);
	}
	//�Է� ���� DB�� ����
	try{
		conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/userinfo?useUnicode=true&characterEncoding=euckr","root","apmsetup");
		stmt=conn.createStatement();
		query="insert into user_info values(?,?,?,?,?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, userid);
		pstmt.setString(2, username);
		pstmt.setString(3, nickname);
		pstmt.setString(4, password);
		pstmt.setString(5, sex);
		pstmt.setString(6, email);
		pstmt.setString(7, regdate);		
		pstmt.executeUpdate();		
	}catch(SQLException e){
		out.println("<script>alert('���� ó������ ������ �߻��Ǿ����ϴ�. �����ڿ��� ���� �ϼ���.'); history.back();</script>");
	}finally{
		conn.close();
	}
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���ԿϷ�</title>
</head>
<body>
������ ���� �帳�ϴ�.
���� Ȯ��
���̵� : <%=userid %>
��  �� : <%=username %>
�г��� : <%=nickname %>
�̸��� : <%=email %>
����   : <%=sex %>
������ : <%=regdate %>

<input type="button" onClick="location='index.html'" value="���� �Ϸ�">
<input type="reset" value="���">
</body>
</html>