<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*"%>
<%request.setCharacterEncoding("euc-kr"); %>
<%
	//insert.html에서 받아올 변수 선언과 동시에 request.getParameter()를 이용해 초기화한다.
	//password는 정수로 받기위해 Integer Class를 이용해 파싱.
	String id = request.getParameter("id");
	int password = Integer.parseInt(request.getParameter("password"));
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String sql = null;
	
	//db사용을 위한 객체 선언
	Connection conn = null;
	Statement st = null;
	ResultSet rs = null;
	int cnt=0;
	try{
		Class.forName("org.gjt.mm.mysql.Driver");
	}catch(ClassNotFoundException e){
		out.println(e);
	}
	
	try{
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/member?useUnicode=true&characterEncoding=euckr","root","1234");
		st=conn.createStatement();
		rs = st.executeQuery("select * from woori where id='"+id+"'");
		
		if(!(rs.next())){
			st=conn.createStatement();
			sql="insert into woori(id,name,email,password)";
			sql=sql+" values('" + id + "','" + name + "','" + email + "'," + password + ")";
			
			cnt = st.executeUpdate(sql);
			if(cnt>0)
				out.println("데이터가 성공적으로 입력되었습니다.");
			else
				out.println("데이터가 입력되니? ");			
		}else{
			out.println("이미 있는 아이디 입니다.");			
		}
		
		st.close();
		conn.close();
	}catch(SQLException e){
		out.println(e.getMessage());
	}	
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	[<a href="main.html">메인으로</a>]
	&nbsp;[<a href="insert.html">회원 등록 페이지로</a>]
</body>
</html>