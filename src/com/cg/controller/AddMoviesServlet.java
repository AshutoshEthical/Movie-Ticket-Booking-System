package com.cg.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cg.dao.AdminDAO;
import com.cg.dao.IAdminDAO;
import com.cg.dto.Movies;
import com.cg.exceptions.MTBException;

@WebServlet("/addMovies")
public class AddMoviesServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		if (request.getSession().getAttribute("username") == null) 
			response.sendRedirect("index.jsp");
		else {
			if (request.getSession().getAttribute("rolecode").equals("usr")) 
				response.sendRedirect("UserHomePage.jsp");
			}
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			PrintWriter out = response.getWriter();
		String id = request.getParameter("id");
		String movieName=request.getParameter("movieName");
		Integer price= Integer.parseInt(request.getParameter("price"));
		
		Movies movieDTO = new Movies(id, movieName, price);
		int rows=0;
		IAdminDAO admin = new AdminDAO();
		
			rows=admin.addMovies(movieDTO);
			if(rows>0) {
				out.println("Movie added Sucessfully");
				response.sendRedirect("ViewMovies.jsp");
			}
			else if(rows==-1)
				out.println("Not added");
		} catch (MTBException e) {
			
			System.out.println(e.getMessage() + " exception in addAdmin servlet");
		}
		
		
	}

}
