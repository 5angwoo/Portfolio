<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*"%>
<%request.setCharacterEncoding("euc-kr"); %>
<%
	//insert.html���� �޾ƿ� ���� ����� ���ÿ� request.getParameter()�� �̿��� �ʱ�ȭ�Ѵ�.
	//password�� ������ �ޱ����� Integer Class�� �̿��� �Ľ�.
	String id = request.getParameter("id");
	int password = Integer.parseInt(request.getParameter("password"));
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String sql = null;
	
	//db����� ���� ��ü ����
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
				out.println("�����Ͱ� ���������� �ԷµǾ����ϴ�.");
			else
				out.println("�����Ͱ� �ԷµǴ�? ");			
		}else{
			out.println("�̹� �ִ� ���̵� �Դϴ�.");			
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
	[<a href="main.html">��������</a>]
	&nbsp;[<a href="insert.html">ȸ�� ��� ��������</a>]
</body>
</html>