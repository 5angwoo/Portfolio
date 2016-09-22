<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page language="java" import="java.sql.*,java.util.*"%>

<HTML>
<HEAD>
<TITLE>글 읽기</TITLE>
<style type="text/css">
body {
	background: url(Img/1.jpg);
	background-size: cover;
	background-position: center center;
	width: device-width;
}
</style>
<link href="filegb.css" rel="stylesheet" type="text/css">
</HEAD>
<BODY>
	<center>
		<%
			String sql = null;
			Connection con = null;
			PreparedStatement st = null;
			ResultSet rs = null;

			int id = Integer.parseInt(request.getParameter("id"));

			try {
				Class.forName("org.gjt.mm.mysql.Driver");
			} catch (ClassNotFoundException e) {
				out.println(e);
			}

			try {
				con = DriverManager.getConnection(
						"jdbc:mysql://localhost:3306/fboard?useUnicode=true&characterEncoding=euckr", "root", "1234");
			} catch (SQLException e) {
				out.println(e);
			}

			try {
				sql = "select * from freeboard where id=? ";
				st = con.prepareStatement(sql);
				st.setInt(1, id);
				rs = st.executeQuery();

				if (!(rs.next())) {
					out.println("해당 내용이 없습니다");
				} else {
					String em = rs.getString("email");
					if ((em != null) && (!(em.equals(""))))
						em = "<A href=mailto:" + em + ">" + rs.getString("name") + "</A>";
					else
						em = rs.getString("name");
		%>
		<table width='600' cellspacing='0' cellpadding='2'>
			<tr>
				<td height='22'>&nbsp;</td>
			</tr>
			<tr align='center'>
				<td height='1' bgcolor='#1F4F8F'></td>
			</tr>
			<tr align='center' bgcolor='#DFEDFF'>
				<td class='button' bgcolor='#DFEDFF'>
					<div align='left'>
						<font size='2'> <%=rs.getString("subject")%>
					</div>
				</td>
			</tr>
			<tr align='center' bgcolor='#FFFFFF'>
				<td align='center' bgcolor='#F4F4F4'>
					<table width='100%' border='0' cellpadding='0' cellspacing='4'
						height='1'>
						<tr bgcolor='#F4F4F4'>
							<td width='13%' height='7'></td>
							<td width='51%' height='7'>글쓴이 : <%=em%>
							</td>
							<td width='25%' height='7'></td>
							<td width='11%' height='7'></td>
						</tr>
						<tr bgcolor='#F4F4F4'>
							<td width='13%'></td>
							<td width='51%'>작성일 : <%=rs.getString("inputdate")%>
							</td>
							<td width='25%'>조회 : <%=rs.getInt("readcount")%>
							</td>
							<td width='11%'></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr align='center'>
				<td bgcolor='#1F4F8F' height='1'></td>
			</tr>
			<tr align='center'>
				<td style='padding: 10 0 0 0'>
					<div align='left'>
						<br> <font size='3' color='#333333'><PRE>
								<%=rs.getString("content")%> </PRE>
					</div> <br>
				</td>
			</tr>
			<tr align='center'>
				<td class='button' height='1'></td>
			</tr>
			<tr align='center'>
				<td bgcolor='#1F4F8F' height='1'></td>
			</tr>
		</table>
		<table width="600" border="0" cellpadding="0" cellspacing="5">
			<tr>
				<td align="right" width="450"><A
					href="freeboard_list.jsp?go=<%=request.getParameter("page")%>">
						<img src="image/list.jpg" border=0>
				</a></td>
				<td width="70" align="right"><A
					href="freeboard_rwrite.jsp?id=<%=request.getParameter("id")%>&page=<%=request.getParameter("page")%>">
						<img src="image/reply.jpg" border=0>
				</A></td>
				<td width="70" align="right"><A
					href="freeboard_upd.jsp?id=<%=id%>&page=1"><img
						src="image/edit.jpg" border=0></A></td>
				<td width="70" align="right"><A
					href="freeboard_del.jsp?id=<%=id%>&page=1"><img
						src="image/del.jpg" border=0></A></td>
			</tr>
		</table>
		<%
			sql = "update freeboard set readcount= readcount + 1 where id= ?";
					st = con.prepareStatement(sql);
					st.setInt(1, id);
					st.executeUpdate();
				}
				rs.close();
				st.close();
				con.close();
			} catch (SQLException e) {
				out.println(e);
			}
		%>
	</center>
</BODY>
</HTML>