package com.Banl.Servlet;

import java.io.IOException;
import java.util.List;

import com.Bank.DAO.TransactionDAO;
import com.Bank.DAO.TransactionDAOImpl;
import com.Bank.DTO.Customer;


import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/transaction") 
public class Transaction extends HttpServlet{
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession(false);
		Customer c1=(Customer)session.getAttribute("succ");
		TransactionDAO tdao=new TransactionDAOImpl();
		List<Transaction> transactions=tdao.getTransaction();
		if(transactions!=null) {
			session.setAttribute("sub", transactions);
			RequestDispatcher rd=req.getRequestDispatcher("Transaction.jsp");
			rd.forward(req, resp);
			
		}else {
			req.setAttribute("failure","failed to get the data");
			RequestDispatcher rd=req.getRequestDispatcher("dashboard.jsp");
			rd.forward(req, resp);
			
		}
	}

}
