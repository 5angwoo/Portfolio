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
<SCRIPT language="javascript">
	function check() {
		with (document.filegbwrite) {
			if (subject.value.length == 0) {
				alert("제목을 입력해 주세요!!");
				subject.focus();
				return false;
			}
			if (name.value.length == 0) {
				alert("이름을 입력해 주세요!!");
				name.focus();
				return false;
			}
			if (content.value.length == 0) {
				alert("내용을 입력해주세요!!");
				content.focus();
				return false;
			}
			document.filegbwrite.submit();
		}
	}
</SCRIPT>
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
						<FORM name=filegbwrite method=post action="dbgb_save.jsp">
							<CENTER>
								<font color='#333333'>
									<table width="600" cellspacing="0" cellpadding="2">
										<tr>
											<td colspan="2" bgcolor="#1F4F8F" height="1"></td>
										</tr>
										<tr>
											<td colspan="2" bgcolor="#DFEDFF" height="20" class="style1">&nbsp;&nbsp;글
												쓰 기</td>
										</tr>
										<tr>
											<td colspan="2" bgcolor="#1F4F8F" height="1"></td>
										</tr>
										<tr>
											<td width="124" bgcolor="#f4f4f4" class="style2">
												<div align="center">이 름</div>
											</td>
											<td width="494" bgcolor="#f4f4f4"><input type=text
												name=name class="input_style1"></td>
										</tr>
										<tr>
											<td colspan="2" bgcolor="#dddddd" height="1"></td>
										</tr>
										<tr>
											<td width="124" bgcolor="#f4f4f4" class="style2">
												<div align="center">E-mail</div>
											</td>
											<td width="494" height="25" bgcolor="#f4f4f4"><input
												type=hidden name=<%=session.getValue("email") %> class="input_style1"></td>
										</tr>
										<tr>
											<td colspan="2" bgcolor="#dddddd" height="1"></td>
										</tr>
										<tr>
											<td width="124" bgcolor="#f4f4f4" class="style2">
												<div align="center">제 목</div>
											</td>
											<td width="494" height="25" bgcolor="#f4f4f4"><input
												type=text name=subject size="60" maxlength="60"
												class="input_style2"></td>
										</tr>
										<tr>
											<td colspan="2" bgcolor="#dddddd" height="1"></td>
										</tr>
										<tr>
											<td width="124" height="162" bgcolor="#f4f4f4"
												style="padding-top: 5px;" valign="top" class="style2">
												<div align="center">내 용</div>
											</td>
											<td width="494" valign="top"><textarea cols="65"
													rows="10" name=content maxlength="2000"
													class="textarea_style1"></textarea></td>
										</tr>
										<tr>
											<td colspan="2" height="1"></td>
										</tr>
										<tr>
											<td colspan="2" height="1" bgcolor="#1F4F8F"></td>
										</tr>
										<tr>
											<td colspan="2" height="10"></td>
										</tr>
										<tr>
											<td colspan="2" align="right">
												<table width="100%" border="0" cellpadding="0"
													cellspacing="0">
													<tr>
														<td width="28%">&nbsp;</td>
														<td width="51%">&nbsp;</td>
														<td width="12%"><a href="guestboard.jsp"><img
																src="image/cancle.gif" width="46" height="20" border="0"></td>
														<td width="9%"><a href="#"
															onClick="check(this.form);"><img src="image/ok.gif"
																width="46" height="20" border="0"></a></td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</font>
						</FORM>
					</center>
				</div>
			</div>
		</div>
	</div>
	</header>

	<!-- Main Content -->
	<div class="container"></div>

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
