<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
    <%

    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Book your tickets</title>
</head>
<style>

input[type=text], select {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
	height: 25px;
}

body {
	align-self: center;
	text-align: center;
	padding-left: 380px;
	padding-top: 100px;
}

.button {
	display: inline-block;
	padding: 15px 25px;
	font-size: 10px;
	cursor: pointer;
	text-align: center;
	text-decoration: none;
	outline: none;
	color: black;
	background-color: white;
	border: none;
	border-radius: 10px;
	box-shadow: 0 5px #999;
	float: right;
	height: 5vh;
	width: 10vh;
}

.button:hover {
	background-color: grey
}

.button:active {
	background-color: black;
	box-shadow: 0 5px grey;
	transform: translateY(4px);
}

</style>
<body>

<form action="Booking" method="post">
<table >
<tr><td>Username: 
	<td><input type="text" name="username" value=<%=request.getParameter("username") %> readonly>
<tr><td>Movie id:
	<td><input type="text" name="movieid" value=<%=request.getParameter("movie_id") %> readonly>
<tr><td>Name:
	<td><input type="text" name="name">
<tr><td>No of Tickets :
	<td><input type="number" name="tickets" required>
<tr><td>Date of booking:
	<td><input type="date" name=dateofbooking required>
<tr><td>Email id:
	<td><input type="text" name=email required>
<tr><td align="center"><input type="submit" value="BOOK TICKETS">
</table>
</form>
</body>
</html>