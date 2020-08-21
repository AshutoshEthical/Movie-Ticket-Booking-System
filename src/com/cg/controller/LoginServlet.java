package com.cg.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cg.dao.AdminDAO;
import com.cg.dao.IAdminDAO;
import com.cg.dto.UserRole;

@WebServlet("/login")
public class LoginServlet extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String username=request.getParameter("user");
		String password=request.getParameter("pass");
		IAdminDAO adminDAO = new AdminDAO();
		UserRole userDTO = new UserRole(username, password);
		RequestDispatcher dispatcher = null;
		try {
			if (adminDAO.validate(userDTO).equals("adm")) {
				HttpSession session = request.getSession();
				session.setAttribute("username", userDTO.getUsername());
				session.setAttribute("rolecode", "adm");
				dispatcher= request.getRequestDispatcher("AdminHomePage.jsp");
				dispatcher.forward(request, response);
				System.out.println("Admin");
			}
			else if (adminDAO.validate(userDTO).equals("usr")) {
				HttpSession session = request.getSession();
				session.setAttribute("username", userDTO.getUsername());
				session.setAttribute("rolecode", "adm");
				dispatcher= request.getRequestDispatcher("UserHomePage.jsp");
				dispatcher.forward(request, response);
				System.out.println("User");
			}
			else {
				dispatcher=request.getRequestDispatcher("index.html");
				dispatcher.forward(request, response);
			}
		}catch (Exception e) {
			
			response.sendRedirect("Error.jsp");
			System.out.println(e.getMessage() + " exception in login servlet");
		}
	}
}
