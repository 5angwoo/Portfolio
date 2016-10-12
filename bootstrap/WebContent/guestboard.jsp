<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.sql.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Contact</title>

<!-- Bootstrap Core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Theme CSS -->
<link href="css/clean-blog.min.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link
	href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
	rel='stylesheet' type='text/css'>

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

	<!-- Navigation -->
	<nav class="navbar navbar-default navbar-custom navbar-fixed-top">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header page-scroll">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> Menu <i
					class="fa fa-bars"></i>
			</button>
			<a class="navbar-brand" href="index.jsp">SangwooHan's Blog</a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="index.jsp">Home</a></li>
				<li><a href="about.jsp">About Myself</a></li>
				<li><a href="portfolio.jsp">Portfolio</a></li>
				<li><a href="contact.jsp">Contact</a></li>
				<%
					if (session.getValue("member_id") == null) {
				%>
				<li><a href="indexLog.html">Login</a></li>
				<%
					} else {
				%>
				<li><a href="logout.jsp">Logout</a></li>
				<%
					}
				%>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container --> </nav>

	<!-- Page Header -->
	<!-- Set your background image for this header on the line below. -->
	<header class="intro-header"
		style="background-image: url('img/contact-bg.jpg')">
	<div class="container">
		<div class="row">
			<div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
				<div class="page-heading">
					<h1>GuestBoard</h1>
					<CENTER>
						<%
							Vector name = new Vector();
							Vector email = new Vector();
							Vector inputdate = new Vector();
							Vector subject = new Vector();
							Vector content = new Vector();

							int where = 1;
							int totalgroup = 0;
							int maxpages = 2;
							int startpage = 1;
							int endpage = startpage + maxpages - 1;
							int wheregroup = 1;
							if (request.getParameter("go") != null) {
								where = Integer.parseInt(request.getParameter("go"));
								wheregroup = (where - 1) / maxpages + 1;
								startpage = (wheregroup - 1) * maxpages + 1;
								endpage = startpage + maxpages - 1;
							} else if (request.getParameter("gogroup") != null) {
								wheregroup = Integer.parseInt(request.getParameter("gogroup"));
								startpage = (wheregroup - 1) * maxpages + 1;
								where = startpage;
								endpage = startpage + maxpages - 1;
							}
							int nextgroup = wheregroup + 1;
							int priorgroup = wheregroup - 1;

							int nextpage = where + 1;
							int priorpage = where - 1;
							int startrow = 0;
							int endrow = 0;
							int maxrows = 2;
							int totalrows = 0;
							int totalpages = 0;

							String em = null;
							Connection con = null;
							Statement st = null;
							ResultSet rs = null;

							try {
								Class.forName("org.gjt.mm.mysql.Driver");
							} catch (ClassNotFoundException e) {
								out.println(e);
							}

							try {
								con = DriverManager.getConnection(
										"jdbc:mysql://localhost:3306/gboard? useUnicode=true&characterEncoding=euckr", "root", "1234");
								st = con.createStatement();
								rs = st.executeQuery("select * from guestboard order by inputdate desc");

								if (!(rs.next())) {
									out.println("블로그에 올린 글이 없습니다");
								} else {
									do {
										name.addElement(rs.getString("name"));
										email.addElement(rs.getString("email"));
										inputdate.addElement(rs.getString("inputdate"));
										subject.addElement(rs.getString("subject"));
										content.addElement(rs.getString("content"));
									} while (rs.next());
									totalrows = name.size();
									totalpages = (totalrows - 1) / maxrows + 1;
									startrow = (where - 1) * maxrows;
									endrow = startrow + maxrows - 1;
									if (endrow >= totalrows)
										endrow = totalrows - 1;
									totalgroup = (totalpages - 1) / maxpages + 1;
									if (endpage > totalpages)
										endpage = totalpages;
									for (int j = startrow; j <= endrow; j++) {
										out.println("<table border='0' width='600' cellspacing='0' cellpadding='2'>");
										out.println("<tr align='right'>");
										out.println("<td height='22'>&nbsp;</td></tr>");
										out.println("<tr align='center'>");
										out.println("<td height='1' bgcolor='#1F4F8F'></td>");
										out.println("</tr>");
										out.println("<tr align='center' bgcolor='#DFEDFF'>");
										out.println("<td class='button' bgcolor='#DFEDFF'>");
										out.println("<div align='left'><font size='5' color='#333333'>" + subject.elementAt(j));
										out.println("</div></td>");
										out.println("</tr>");
										out.println("<tr align='center' bgcolor='#FFFFFF'>");
										out.println("<td align='center' bgcolor='#F4F4F4'>");
										out.println("<table width='100%' border='0' cellpadding='0'cellspacing='4'>");
										out.println("<tr bgcolor='#F4F4F4'>");
										out.println("<td width='13%' height='7'></td>");
										out.println("<td width='38%' height='7'><font size='3' color='#333333'>글쓴이:" + name.elementAt(j) + "</td>");
										String temp = (String) email.elementAt(j);
										if ((temp != null) && (!(temp.equals(""))))
											em = "<A href=mailto:" + temp + ">" + temp + "</A>";
										out.println("<td width='38%' height='7'><font size='5' color='#333333'>E-mail: " + em + "</td>");
										out.println("<td width='11%' height='7'></td>");
										out.println("</tr>");
										out.println("<tr bgcolor='#456874'>");
										out.println("<td width='13%'></td>");
										out.println("<td colspan=2>작성일:" + inputdate.elementAt(j) + "</td>");
										out.println("<td width='11%'></td>");
										out.println("</tr></table>");
										out.println("</td></tr>");
										out.println("<tr align='center'>");
										out.println("<td bgcolor='#1F4F8F' height='1'></td>");
										out.println("</tr>");
										out.println("<tr align='center'>");
										out.println("<td style='padding:10 0 0 0'>");
										out.println("<div align='left'><br>");
										out.println("<font size='3' color='#333333'><PRE>" + content.elementAt(j));
										out.println("</PRE></div>");
										out.println("<br>");
										out.println("</td></tr>");
										out.println("<tr align='center'>");
										out.println("<td class='button' height='1'></td>");
										out.println("</tr>");
										out.println("<tr align='center'>");
										out.println("<td bgcolor='#1F4F8F' height='1'></td>");
										out.println("</tr>");
										out.println("</table><p>");
									}
								}
								rs.close();
								st.close();
								con.close();
							} catch (SQLException e) {
								out.println(e);
							}
							if (wheregroup > 1) {
								out.println("[<A href=\"guestboard.jsp?go=1\">처음</A>]");
								out.println("[<A href=\"guestboard.jsp?gogroup=" + priorgroup + "\">이전</A>]");
							} else {
								out.println("[처음]");
								out.println("[이전]");
							}
							for (int jj = startpage; jj <= endpage; jj++) {
								if (jj == where)
									out.println("[" + jj + "]");
								else
									out.println("[<A href=\"guestboard.jsp?go=" + jj + "\">" + jj + "</A>]");
							}
							if (wheregroup < totalgroup) {
								out.println("[<A href=\"guestboard.jsp?gogroup=" + nextgroup + "\">다음</A>]");
								out.println("[<A href=\"guestboard.jsp?gogroup=" + totalgroup + "\">마지막</A>]");
							} else {
								out.println("[다음]");
								out.println("[마지막]");
							}
							out.println(where + "/" + totalpages);
						%>
						<p>
							<A href="gboard_write.jsp"> <img src="image/write.gif"
								width="54" height="19" border=0></A>
					</center>
				</div>
			</div>
		</div>
	</div>
	</header>

	<!-- Main Content -->
	<div class="container">
		
	</div>

	<hr>

	<!-- Footer -->
	<footer>
	<div class="container">
		<div class="row">
			<div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
				<ul class="list-inline text-center">
					<li><a href="https://twitter.com/GaeDdongsFather"> <span
							class="fa-stack fa-lg"> <i
								class="fa fa-circle fa-stack-2x"></i> <i
								class="fa fa-twitter fa-stack-1x fa-inverse"></i>
						</span>
					</a></li>
					<li><a
						href="https://www.facebook.com/sangwoo.han.547?ref=bookmarks">
							<span class="fa-stack fa-lg"> <i
								class="fa fa-circle fa-stack-2x"></i> <i
								class="fa fa-facebook fa-stack-1x fa-inverse"></i>
						</span>
					</a></li>
					<li><a href="https://github.com/5angwoo/"> <span
							class="fa-stack fa-lg"> <i
								class="fa fa-circle fa-stack-2x"></i> <i
								class="fa fa-github fa-stack-1x fa-inverse"></i>
						</span>
					</a></li>
				</ul>
				<p class="copyright text-muted">Copyright &copy;
					http://tghan77.wixsite.com/swhan</p>
			</div>
		</div>
	</div>
	</footer>

	<!-- jQuery -->
	<script src="vendor/jquery/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>

	<!-- Contact Form JavaScript -->
	<script src="js/jqBootstrapValidation.js"></script>
	<script src="js/contact_me.js"></script>

	<!-- Theme JavaScript -->
	<script src="js/clean-blog.min.js"></script>

</body>

</html>
