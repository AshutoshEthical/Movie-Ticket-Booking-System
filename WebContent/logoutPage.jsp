<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
.button {
	float: right;
}
</style>
<meta charset="ISO-8859-1">
<title>Logout page</title>
<script type="text/javascript">
	window.history.forward();
	function noBack() {
		window.history.foward();
	}
</script>
</head>

<body>
	<form action="logout" method="get">
		<button class="button" type="submit">
			<b>LOGOUT</b>
		</button>
	</form>
</body></html>