package com.Banl.Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import com.Bank.DAO.CustomerDAO;
import com.Bank.DAO.CustomerDAOImpl;
import com.Bank.DAO.TransactionDAO;
import com.Bank.DAO.TransactionDAOImpl;
import com.Bank.DTO.Customer;
import com.Bank.DTO.Transaction;
import com.Bank.DTO.TransactionID;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/deposit") 
public class Deposit extends HttpServlet{
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession(false);
	
		String money=req.getParameter("mon");
		CustomerDAO cdao=new CustomerDAOImpl(); 
		TransactionDAO tdao=new TransactionDAOImpl(); 
		double amount=Double.parseDouble(money);
		PrintWriter out=resp.getWriter(); 
		resp.setContentType("text/html");
		Customer c1=(Customer)session.getAttribute("succ"); 
		c1.setBal(c1.getBal()+amount); 
		  boolean res=cdao.updateCustomer(c1); 
		  if(res) 
		  { 
		   Transaction t=new Transaction(); 
		  
		 t.setTransactionId(TransactionID.generateTransactionId()); 
		   t.setUser(c1.getAccno()); 
		   t.setRec_acc(c1.getAccno()); 
		   t.setTransaction("CREDITED"); 
		   t.setAmount(amount); 
		   t.setBalance(c1.getBal()); 
		   boolean res1=tdao.insertTransaction(t); 
		   if(res) 
		   { 
			   req.setAttribute("success","deposite Successful");
			   RequestDispatcher rd=req.getRequestDispatcher("signup.jsp");
			   rd.forward(req, resp);
		   } 
		   else
		   { 
			   
			   req.setAttribute("failure","Failed to deposit! Try again later");
			   RequestDispatcher rd=req.getRequestDispatcher("signup.jsp");
			   rd.forward(req, resp);
			   } 
			   } 
	}

}
