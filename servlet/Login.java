package com.Banl.Servlet;

import java.io.IOException;
import java.io.PrintWriter;


import com.Bank.DTO.Customer;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.Bank.DAO.*;
import com.Bank.DAO.CustomerDAOImpl;

@WebServlet("/login") 
public class Login extends HttpServlet {
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession();
	String accnum=req.getParameter("accnumber");
	String pin=req.getParameter("pass");
	long acc=Long.parseLong(accnum);
	int pin1=Integer.parseInt(pin);
	PrintWriter out=resp.getWriter(); 
	resp.setContentType("text/html");
	Customer s=new Customer();  
	CustomerDAO cdao=new CustomerDAOImpl();
	Customer c=cdao.getCustomer(acc, pin1); 
	if(c!=null) 
	{ 
//		if(c.getAccno()==1100110011) 
//		   { 
//		    System.out.println("Welcome admin :"+c.getName()); 
//		    Admin.admin(c); 
//		   } else {
//	System.out.println("Login successful!"); 
//	App.options(c); 
//		   }
	session.setAttribute("succ", c);
		RequestDispatcher rd=req.getRequestDispatcher("dashboard.jsp");
		rd.forward(req, resp);

		
		
	} 
	else 
	{ 
//	System.out.println("Failed to login!"); 
		req.setAttribute("failure", "Failed To Login");
		RequestDispatcher rd=req.getRequestDispatcher("login.jsp");
		rd.forward(req, resp);
	}
	
		
		
		
	}

}
