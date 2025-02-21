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
import jakarta.servlet.http.HttpSession;

@WebServlet("/upd")
public class update extends HttpServlet{
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException { 
		//collect the data from user
		HttpSession session=req.getSession(false);
		Customer c1=(Customer)session.getAttribute("succ");
		 String name=req.getParameter("name"); 
		String phonenumber=req.getParameter("phone"); 
		String mailId=req.getParameter("mail"); 
		 long phone=Long.parseLong(phonenumber);
		 PrintWriter out=resp.getWriter(); 
		 CustomerDAO cdao=new CustomerDAOImpl();
			if(c1!=null) {
				   c1.setName(name); 
				   c1.setPhone(phone); 
				   c1.setMail(mailId); 
				   
			
				   boolean result=cdao.updateCustomer(c1); 
				   if(result) 
				   { 
					   req.setAttribute("success","Update Successful");
			    		RequestDispatcher rd = req.getRequestDispatcher("update.jsp");
			            rd.forward(req,resp);
//				   
					   
				   }
				   else 
				   { 
						req.setAttribute("failure","Failed to Update");
			    		RequestDispatcher rd = req.getRequestDispatcher("update.jsp");
			            rd.forward(req,resp);
				   }
				   
				  }
		 
		 
		 
	}

}
