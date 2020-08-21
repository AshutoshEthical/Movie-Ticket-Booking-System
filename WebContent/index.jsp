<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style>
* {
	padding: 0px;
	margin: 0px;
}

.bgpic {
	background-image: url("backk.jpeg");
	height: 100vh;
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
}

ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
}

li {
	float: left;
}

li a {
	display: block;
	color: white;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
	width: 200px;
	font-size: 60%;
}

/* Change the link color to #111 (black) on hover */
li a:hover {
	background-color: #a89e8a;
	font-size: 200%;
}

.active {
	background-color: #a89e8a;
}

.loginform {
	margin-top: 10%;
	background: #a89e8a;
	width: 26%;
	height: 50%;
	border-radius: 7%;
	opacity: 0.8;
	color: white;
	align: center;
	margin-left: 35%;
	display: none;
	position: absolute;
	box-shadow: 0 12px 15px 0 rgba(0, 0, 0, .24), 0 17px 50px 0
		rgba(0, 0, 0, .19);
	border: 3px solid #f1f1f1;
}

.header {
	overflow: hidden;
	background-color: #a89e8a;
	padding: 20px 10px;
	opacity: 0.8;
}

.header a {
	float: left;
	color: white;
	text-align: center;
	padding: 12px;
	text-decoration: none;
	font-size: 28px;
	line-height: 25px;
	border-radius: 4px;
}

.header a.logo {
	weight: 10;
	font-size: 40px;
}

.header a:hover {
	background-color: #a89e8a;
}

.header a.active {
	background-color: #a89e8a;
	color: white;
}

.header-right {
	float: right;
}

@media screen and (max-width: 500px) {
	.header a {
		float: none;
		display: block;
		text-align: left;
	}
	.header-right {
		float: none;
	}
}

.input {
	width: 170px;
	height: 30px;
	border-radius: 10px;
	background: rgba(255, 255, 255, .1);
	font-size: 15px;
}

.button {
	align-content: center;
	align: center;
	font-size: 12px;
	width: 140px;
	height: 40px;
	margin-left: -50px;
	margin-top: 40px;
	cursor: pointer;
	padding: 15px 20px;
	border-radius: 25px;
	color: black;
	text-align: center;
}

.img {
	width: 5%;
	height: 5%;
	margin-left: 95%;
	border-radius: 10%;
	position: relative;
	cursor: pointer;
}

.cross-button {
	width: 50px;
}

.caption {
	font-style: italic;
	font-size: 30px;
	margin-bottom: 20px;
	margin-top: 10px;
}

.caption-image {
	position: absolute;
	width: 20%;
	height: 20%;
	border-radius: 20%;
	left: 40%;
	top: -11%;
}

.footer {
	position: fixed;
	left: 0;
	bottom: 0;
	color: white;
	background-color: #a89e8a;
	margin-top: 100%;
	width: 100%;
	height: 5%;
	font-size: 200%;
	text-align: center;
	opacity: 0.7;
}

table {
	width: 50%;
	margin-left: 20%;
	margin-top: 15%;
}

b {
	color: black;
}

.errormessage {
	color: red;
	position: absolute;
	top: 20%;
	left: 40%;
	font-size: 150%;
}
</style>
<title>Home Page</title>

<script type="text/javascript">
	function login() {
		document.getElementById("log").style.display = "block";
	}

	function cross() {
		document.getElementById("log").style.display = "none";
	}

	window.history.forward();
	function noBack() {
		window.history.foward();
	}
</script>

</head>

<body class="bgpic">

	<div class="header">

		<ul>
			<li><a class="logo"><b>T-CKT</b></a></li>
			<div class="header-right">
				<li><a href="index.jsp" class="active"><b>Home </b></a></li>
				<li><a class="active" href="#login" onclick="login()"><b>Login
					</b></a></li>
				<li><a href="about.html" class="active"><b>About US </b></a></li>

			</div>
		</ul>



	</div>


	<div class="errormessage">

		<%
			if (request.getAttribute("errorMessage") != null) {
				out.println(request.getAttribute("errorMessage"));
			}
		%>

	</div>


	<div class="loginform" id="log">
		<img src="cross.png" class="img" onclick="cross()">

		<table style="margin-top: 30%;">
			<caption>
				<img src="caption1.png" class="caption-image">
			</caption>
			<br>
			<form action="login" method="post">
				<tr>
					<td><b>UserName:</b></td>
					<td><input type="text" name="user" class="input"></td>
				</tr>

				<tr>
					<td><b>Password:</b></td>
					<td><input type="Password" name="pass" class="input" required></td>
				</tr>

				<tr>
					<td></td>
					<td><button type="submit" class="button">
							<b>Login</b>
						</button></td>
				</tr>
			</form>
		</table>

	</div>

	<div class="footer" style="font-size: 20px">
		<span style="font-size: 15px">&#9400;</span> Copyrights Capgemini
		India Ltd.
	</div>
</body>
</html>