<%@page import="com.cg.exceptions.MTBException"%>
<%@page import="com.cg.dao.QueryConstants"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.cg.Utility.JDBCUtility"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
    
			 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Bookings</title>
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
<h2 align="center">VIEW BOOKINGS</h2>
<table align="center" border=1 id="myTable">
		<tr>
			<th><b>Booking id</b>
			<th><b>Username</b>
			<th><b>Movie id</b>
			<th><b>Movie Name</b>
			<th><b>Number of Tickets</b>
			<th><b>Date of Booking </b>
			<th><b>Email</b>
			
			<%!Connection connection = null;
	PreparedStatement statement = null;
	PreparedStatement statement2 = null;
	%>
			<%
			try {
				connection = JDBCUtility.getConnection();
				statement = connection.prepareStatement(QueryConstants.VIEWBOOKINGS);
				ResultSet rs = statement.executeQuery();
				System.out.println(rs.getRow());
				while (rs.next()) {
					
			%>
			<tr>
			<td><%=rs.getInt("booking_id")%></td>
			<td><%=rs.getString("username")%></td>
			<td><%=rs.getString("movie_id")%></td>
			<%
			statement2= connection.prepareStatement(QueryConstants.VIEWMOVIENAME);
			statement2.setString(1,rs.getString("movie_id"));
			ResultSet r = statement2.executeQuery();
			
			while(r.next()){
			%>
			<td><%=r.getString("movie_name") %>
			<%} %>
			
			<td><%=rs.getInt("tickets")%></td>
			<td><%=rs.getDate("dob")%></td>
			<td><%=rs.getString("email") %>
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
</body>
</html>