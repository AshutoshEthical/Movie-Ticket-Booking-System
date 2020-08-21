package com.cg.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cg.dao.IUserDAO;
import com.cg.dao.UserDAO;
import com.cg.dto.Booking;
import com.cg.exceptions.MTBException;

@WebServlet("/Booking")

public class BookingServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if (request.getSession().getAttribute("username") == null) 
			response.sendRedirect("index.jsp");
		else {
			if (request.getSession().getAttribute("rolecode").equals("adm"))
				response.sendRedirect("AdminHomePage.jsp");
		}
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter writer = response.getWriter();
		try {
			String username= request.getParameter("username");
			String movieId= request.getParameter("movieid");
			String name= request.getParameter("name");
			int tickets = Integer.parseInt(request.getParameter("tickets"));
			String email = request.getParameter("email");
			String dob = request.getParameter("dateofbooking");  
			//java.util.Date dateOfBooking =  new SimpleDateFormat("dd-mm-yyyy").parse(dob); 
			Date dateOfBooking = Date.valueOf(dob);
			System.out.println(dateOfBooking);
			RequestDispatcher dispatcher = null;
			int rows = 0;
			Booking book = new Booking(username, movieId, tickets, dateOfBooking, email);
			IUserDAO user = new UserDAO();
			rows = user.bookTicket(book);
			if(rows>0) {
				
				writer.println(
						"<h2 style = 'color:white' >Ticket booking successful, please wait while redirecting to homepage </h2>");
				response.setHeader("Refresh", "2;url=ViewUserBooking.jsp");
				}
			else if (rows == -1)
				response.sendRedirect("UserError.jsp");
			else {
				dispatcher = request.getRequestDispatcher("Book.jsp");
			dispatcher.forward(request, response);
			}
		}catch(MTBException | SQLException e)
		{
			System.out.println(e.getMessage() + " exception in booking servlet");
		}
	}

}
