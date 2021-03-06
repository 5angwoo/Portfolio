<%@ page info="left_Frame" errorPage="error.jsp"%>
<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>SangwooHan 포트폴리오</title>

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

<script language="JavaScript">
<!--
	function login_check() {
		if (!document.login.userid.value) {
			alert("ID를 입력하세요!");
			document.login.userid.focus();
			return;
		}
		if (!document.login.password.value) {
			alert("패스워드를 입력하세요!");
			document.login.password.focus();
			return;
		}
		document.login.submit();
	}
//-->
</script>

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
				<a class="navbar-brand" href="index.html">SangwooHan's Blog</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="index.jsp">Home</a></li>
					<li><a href="about.jsp">About Myself</a></li>
					<li><a href="portfolio.jsp">Portfolio</a></li>
					<%
						if (session.getValue("member_id") != null) {
					%>
					<li><a href="guestboard.jsp">GuestBoard</a></li>
					<%
						}
					%>
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
		<!-- /.container -->
	</nav>

	<!-- Page Header -->
	<!-- Set your background image for this header on the line below. -->
	<header class="intro-header"
		style="background-image: url('img/home-bg.jpg')">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
					<div class="site-heading">
						<h1>Welcome</h1>
						<hr class="small">
						<span class="subheading">안녕하세요 한상우입니다.</span>
					</div>
				</div>
			</div>
		</div>
	</header>

	<!-- Main Content -->
	<%
		Object mem_name = session.getAttribute("member_name");
		Object mem_id = session.getAttribute("member_id");
		session.setAttribute("member_id", mem_id);
		if (session.getValue("member_id") == null) {
	%>
	<form name="login" method="post" action="login_process.jsp">
		<center>
			<div>
				회원ID<input type="text" maxlength="16" name="userid" size='10'
					class="input_style1"> <br> PASS<input type="password"
					maxlength="12" name="password" size='10' class="input_style1">
			</div>

			<div>
				<a href="javascript:login_check()">로그인</a>&nbsp;<a
					href="insert.html" target="_top">회원가입</a>
			</div>
		</center>
	</form>
	<center>
		<div>
			<%
				} else {
			%>
			<center>
				<table>
					<tr>
						<td colspan="2" align="center"><%=session.getValue("member_id")%>님
							안녕하십니까.<br></td>
					</tr>
					<tr>
						<td><a href="logout.jsp">로그아웃</a></td>
						<td><a href="select.jsp">개인정보</a></td>
					</tr>
				</table>
			</center>
			<%
				}
			%>
		
	</center>
	</div>
	<hr>

	<!-- Footer -->
	<footer>
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
					<ul class="list-inline text-center">
						<li><a href="https://twitter.com/GaeDdongsFather" target="blank"> <span
								class="fa-stack fa-lg"> <i
									class="fa fa-circle fa-stack-2x"></i> <i
									class="fa fa-twitter fa-stack-1x fa-inverse"></i>
							</span>
						</a></li>
						<li><a
							href="https://www.facebook.com/sangwoo.han.547?ref=bookmarks"
							target="_blank">
							
								<span class="fa-stack fa-lg"> <i
									class="fa fa-circle fa-stack-2x"></i> <i
									class="fa fa-facebook fa-stack-1x fa-inverse"></i>
							</span>
						</a></li>
						<li><a href="https://github.com/5angwoo/" target="_blank"> <span
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
