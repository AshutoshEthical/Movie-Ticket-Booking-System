<%@page import="com.cg.exceptions.MTBException"%>
<%@page import="com.cg.dao.QueryConstants"%>
<%@page import="com.cg.Utility.JDBCUtility"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
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
<title>View Movies</title>
</head>
<style>
body {
	margin: 0;
	font-family: "Times New Roman", Helvetica, sans-serif;
	color: white;
}

table {
	border-collapse: collapse;
	width: 70%;
	height: 20%
}

th, td {
	padding: 8px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}

tr:hover {
	background-color: grey;
}

a:link {
	color: white;
}

a:active {
	color: blue;
}
</style>

<body>

<h2 align="center">
		<b> VIEW MOVIES</b>
	</h2>
	<center>
		<input type="text" id="myInput" onkeyup="myFunction()"
			placeholder="Search " title="Type in a name">
	</center>
	
	<table align="center" border=1 id="myTable">
		<tr>
			<th><b>Movie id</b>
			<th><b>Movie Name</b>
			<th><b>Cost of Ticket</b>
			
			<%!Connection connection = null;
	PreparedStatement statement = null;%>
			<%
			try {
				connection = JDBCUtility.getConnection();
				statement = connection.prepareStatement(QueryConstants.VIEWCLAIMSADMIN);
				ResultSet rs = statement.executeQuery();
				System.out.println(rs.getRow());
				while (rs.next()) {
			%>
			<tr>
			<td><%=rs.getString("movie_id")%></td>
			<td><%=rs.getString("movie_name")%></td>
			<td><%=rs.getInt("price")%></td>
			<%
			}
			} catch (MTBException e) {
				out.println(e.getMessage());
			} finally {
				statement.close();
				connection.close();
			}
		%>
		</table>
		<script>
		function myFunction() {
			var input, filter, table, tr, td, i, txtValue;
			input = document.getElementById("myInput");
			filter = input.value.toUpperCase();
			table = document.getElementById("myTable");
			tr = table.getElementsByTagName("tr");
			for (i = 0; i < tr.length; i++) {
				td = tr[i].getElementsByTagName("td")[1];
				if (td) {
					txtValue = td.textContent || td.innerText;
					if (txtValue.toUpperCase().indexOf(filter) > -1) {
						tr[i].style.display = "";
					} else {
						tr[i].style.display = "none";
					}
				}
			}
		}
		</script>
</body>
</html>