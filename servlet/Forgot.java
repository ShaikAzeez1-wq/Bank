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

@WebServlet("/forgot") 
public class Forgot extends HttpServlet {
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String phonenumber=req.getParameter("phone");
		String MailID=req.getParameter("mail");
		String pin=req.getParameter("pass");
		String cpin=req.getParameter("cpass");
		long phone=Long.parseLong(phonenumber);
		int ps=Integer.parseInt(pin);
		int cps=Integer.parseInt(cpin);
		PrintWriter out=resp.getWriter(); 
		resp.setContentType("text/html");
		Customer s=new Customer();  
		CustomerDAO cdao=new CustomerDAOImpl();
		Customer c=cdao.getCustomer(phone, MailID);
		if(phone==c.getPhone()&&MailID.equals(c.getMail())) {
			if(ps==cps) {
				c.setPin(ps);
				boolean res=cdao.updateCustomer(c); 
				if(res) {
					req.setAttribute("success", "Forgot Password Successful");
					RequestDispatcher rd=req.getRequestDispatcher("forgot.jsp");
					rd.forward(req, resp);
				}else {
					req.setAttribute("failure", "Fairld To Forgot Password");
					RequestDispatcher rd=req.getRequestDispatcher("forgot.jsp");
					rd.forward(req, resp);
				}
			}
			
		}
		
	}

}
