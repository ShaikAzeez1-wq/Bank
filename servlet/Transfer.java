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

@WebServlet("/transfer")
public class Transfer extends HttpServlet{
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession(false);
		Customer c1 = (Customer) session.getAttribute("succ");
		String amount=req.getParameter("amo");
		String bacc=req.getParameter("acc");
		String password=req.getParameter("pas");
		
		long bcc=Long.parseLong(bacc);
		double nam=Double.parseDouble(amount);
		int pin=Integer.parseInt(password);
		
		PrintWriter out=resp.getWriter(); 
		resp.setContentType("text/html");
		CustomerDAO cdao=new CustomerDAOImpl(); 
		Transaction t1=null; 
		Transaction t2=null; 
		TransactionDAO tdao=new TransactionDAOImpl();
		if(c1!=null) {
		Customer receiver=cdao.getCustomer(bcc); 
		 
		 if(c1.getAccno()!=receiver.getAccno()&&c1.getBal()>0&&c1.getBal()>=nam&&nam>0) 
		  { 
		   
		   if(pin==c1.getPin()) 
		   { 
		    c1.setBal(c1.getBal()-nam); 
		    boolean c_res=cdao.updateCustomer(c1); 
		//updateCustomer() already overridden in deposit module inside CustomerDAOImpl 
		    if(c_res) 
		    { 
		     t1=new Transaction(); 
		     t1.setTransactionId(TransactionID.generateTransactionId()); 
		     t1.setUser(c1.getAccno()); 
		     t1.setRec_acc(receiver.getAccno()); 
		     t1.setTransaction("DEBITED"); 
		     t1.setAmount(nam); 
		     t1.setBalance(c1.getBal()); 
		     boolean res1=tdao.insertTransaction(t1); 
		    } 
		 //insertTransaction() already overridden in deposit module inside TransactionDAOImpl 
		    //amount is getting debited from sender account 
		    receiver.setBal(receiver.getBal()+nam); 
		    boolean receiver_res=cdao.updateCustomer(receiver); 
		    if(receiver_res) 
		    { 
		     { 
		      t2=new Transaction(); 
		      t2.setTransactionId(t1.getTransactionId()); 
		      t2.setUser(receiver.getAccno()); 
		      t2.setRec_acc(c1.getAccno()); 
		      t2.setTransaction("CREDITED");
		      t2.setAmount(nam); 
		      t2.setBalance(receiver.getBal()); 
		      boolean res1=tdao.insertTransaction(t2); 
		     } 
		    } 
		    //amount is getting credited to receiver account 
		    if(c_res&&receiver_res) 
		    { 
		     //System.out.println("Transaction successful"); 
		    	req.setAttribute("succ", "Transaction successful");
		    	RequestDispatcher rd=req.getRequestDispatcher("transfor.jsp");
		    	rd.forward(req, resp);
		    	
		    } 
		    else 
		    { 
		     //System.out.println("Transaction failed!!!"); 
		    	req.setAttribute("failure", "Transaction failed!!!");
		    	RequestDispatcher rd=req.getRequestDispatcher("transfor.jsp");
		    	rd.forward(req, resp);
		    } 
		   } 
		  } 
		  else 
		  { 
		   //System.out.println("Transaction failed!!!"); 
				req.setAttribute("failure", "You don't have enough money");
		    	RequestDispatcher rd=req.getRequestDispatcher("transfor.jsp");
		    	rd.forward(req, resp);
		  }
		}
	}
}
