package com.Banl.Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import com.Bank.DAO.CustomerDAO;
import com.Bank.DAO.CustomerDAOImpl;
import com.Bank.DTO.Customer;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/signup") 
public class Signup extends HttpServlet {
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name=req.getParameter("name");
		String phonenumber=req.getParameter("phone");
		String MailID=req.getParameter("mail");
		String pin=req.getParameter("pass");
		String cpin=req.getParameter("con");
		long phone=Long.parseLong(phonenumber);
		int ps=Integer.parseInt(pin);
		int cps=Integer.parseInt(cpin);
		PrintWriter out=resp.getWriter(); 
		resp.setContentType("text/html");
		Customer c=new Customer();  
		CustomerDAO cdao=new CustomerDAOImpl();
		c.setName(name);
		c.setPhone(phone);
		c.setMail(MailID);
		
		 if(ps==cps) 
		  { 
		   c.setPin(ps); 
		   boolean res=cdao.insertCustomer(c); 
		  
		   if(res) 
		   { 
//		    System.out.println("Data added successfully!"); 
//		    c=cdao.getCustomer(c.getPhone(), c.getMail()); 
//		    System.out.println("Your account number is "+c.getAccno());
			   Customer cu=cdao.getCustomer(phone, MailID);
			   req.setAttribute("success","Signup Successful");
			   req.setAttribute("account",cu);
			   RequestDispatcher rd=req.getRequestDispatcher("signup.jsp");
			   rd.forward(req, resp);
		   } 
		   else 
		   { 
		   //System.out.println("Failed to create a account"); 
			   req.setAttribute("failure","Failed to Signup");
			   RequestDispatcher rd=req.getRequestDispatcher("signup.jsp");
			   rd.forward(req, resp);
		   } 
		   }
		
		
		
		
		
		
		
	}

}
