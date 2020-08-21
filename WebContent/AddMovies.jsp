<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%
    if (session.getAttribute("username") == null) {
		response.sendRedirect("index.jsp");

	} else {
		if (session.getAttribute("rolecode").equals("usr")) {
			response.sendRedirect("UserHomePage.jsp");
		}
		}
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Movies</title>
</head>
<style>
body {
	align-self: center;
	text-align: center;
	padding-left: 380px;
	padding-top: 100px;
  	margin: 0;
  	font-family: "Times New Roman", Helvetica, sans-serif;
  	color: white;
}

.button {

  display: inline-block;
  padding: 5px 5px;
  font-size: 15px;
  cursor: pointer;
  text-align: center;
  text-decoration: none;
  outline: none;
  color: black;
  background-color: white;
  border: none;
  border-radius: 5px;
  box-shadow: 0 5px #999;
}

.button:hover {background-color: grey}

.button:active {
  background-color: grey;
  box-shadow: 0 5px grey;
  transform: translateY(4px);
}

#myTable {
  border-collapse: collapse;
  font-size: 18px;
}

#myTable th, #myTable td {
  text-align: left;
  padding: 12px;
}
input {
    width: 300px;
    height: 25px;

}

select{
    width: 300px;
    height: 25px;

}
.submit{
width:130px;
height:25px;
}
</style>
<body>

<form action="addMovies" method="post">
<table>
<tr><td>Enter the movie id :<td> <input type=number name="id">
<tr><td>Enter the name of the movie: <td><input type="text" name="movieName">
<tr><td>Enter the cost of tickets: <td><input type=number name="price">
<tr align="center"><td><td><input type="submit" value="Add" class ="submit">
</table>
</form>

</body>
</html>