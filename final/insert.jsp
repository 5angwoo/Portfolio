<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*,java.text.*,java.util.*"%>
    <%request.setCharacterEncoding("euc-kr"); %>
    
<%
	//폼에서 받아올 정보
	String userid = request.getParameter("userid");
	String password = request.getParameter("password");
	String username = request.getParameter("username");
	String nickname = request.getParameter("nickname");
	String sex = request.getParameter("sex");
	String email = request.getParameter("email");
	//DB를 위한 변수들
	String query = new String();
	Connection conn = null;
	//Statement stmt = null;
	//ResultSet rs = null;
	PreparedStatement pstmt = null;
	//?
	int check_count=0;
	//날짜 받아오기
	java.util.Date yymmdd = new java.util.Date();
	SimpleDateFormat myformat = new SimpleDateFormat("yy-MM-d h:mm a");
	String regdate = myformat.format(yymmdd);
	//DB접속단
	try{
		Class.forName("org.gjt.mm.mysql.Driver");
	}catch(ClassNotFoundException e){
		out.println(e);
	}
	//입력 정보 DB에 저장
	try{
		conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/userinfo?useUnicode=true&characterEncoding=euckr","root","apmsetup");
		//stmt=conn.createStatement();
		query="insert into user_info values(?,?,?,?,?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, userid);
		pstmt.setString(2, username);
		pstmt.setString(3, nickname);
		pstmt.setString(4, password);
		pstmt.setString(5, sex);
		pstmt.setString(6, email);
		pstmt.setTimestamp(7, regdate);//(7, regdate);		
		pstmt.executeUpdate();		
	}catch(SQLException e){
		out.println("<script>alert('가입 처리도중 오류가 발생되었습니다. 관리자에게 문의 하세요.'); history.back();</script>");
	}finally{
		out.println("?");
		//stmt.close();
		pstmt.close();
		conn.close();
	}
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>가입완료</title>
</head>
<body>
가입을 축하 드립니다.
정보 확인
아이디 : <%=userid %>
이  름 : <%=username %>
닉네임 : <%=nickname %>
이메일 : <%=email %>
성별   : <%=sex %>
가입일 : <%=regdate %>

<input type="button" onClick="location='index.html'" value="가입 완료">
<input type="reset" value="취소">
</body>
</html>