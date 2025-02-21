package com.Banl.Servlet;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/log")
public class Logout extends HttpServlet {
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession so=req.getSession(false);
		String log=req.getParameter("logout");
		
//	Student s1=(Student)so.getAttribute("success"); 
		while(log.equals("Logout")) {
			so.invalidate();
			req.setAttribute("success", "Logout Successful");
			RequestDispatcher rd=req.getRequestDispatcher("login.jsp");
			rd.forward(req, resp);
				
		}
		
		
		
		
	
	}
	
}
