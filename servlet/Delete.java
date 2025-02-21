package com.Banl.Servlet;

import java.io.IOException;

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

@WebServlet("/delete")
public class Delete extends HttpServlet{
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException { 
		HttpSession session=req.getSession(false);
		Customer c1 = (Customer) session.getAttribute("succ");
		TransactionDAO tdao=new TransactionDAOImpl();
		String acc=req.getParameter("acc");
		
		long nac=Long.parseLong(acc);
		CustomerDAO cdao=new CustomerDAOImpl();
		Customer c=cdao.getCustomer(nac);
		 
		 
		//getCustomer(long accno) already overridden in transferAmount module inside CustomerDAOImpl 
		 
		 
		    if(c.getAccno()!=c1.getAccno())
		    { 
		        double amount=c1.getBal(); 
		        c1.setBal(c.getBal()+c1.getBal()); 
		        boolean res1=cdao.updateCustomer(c1); 
		   //updateCustomer() already overridden in deposit module inside CustomerDAOImpl 
		    
		    
		        if(res1) 
		        { 
		         Transaction t1=new Transaction(); 
		        
		    t1.setTransactionId(TransactionID.generateTransactionId()); 
		         t1.setUser(c1.getAccno()); 
		         t1.setRec_acc(c.getAccno()); 
		         t1.setAmount(amount); 
		         t1.setTransaction("CREDITED"); 
		         t1.setBalance(c1.getBal()); 
		         boolean res=tdao.insertTransaction(t1); 
		    
		   //insertTransaction() already overridden in deposit module inside TransactionDAOImpl	
		   if(res1&&res) 
		      { 
			  boolean a= cdao.deleteCustomer(c); 
			  if(a) {
		       req.setAttribute("delete", "deleted successfuly"); 
		       
			  }else {
				  req.setAttribute("del", "failed to deleted ");
				  
			  }
			  RequestDispatcher rd=req.getRequestDispatcher("dashboard1.jsp");
			  rd.forward(req, resp);
		      }
			  else {
				  req.setAttribute("del", "Failed to delete; amount transfer failed from the customer account");
				  RequestDispatcher rd=req.getRequestDispatcher("dashboard1.jsp");
				  rd.forward(req, resp);
			  
		      }
		        }
			 
			  
			  
			  
			  
	
		      
		    
	}
		    else {
				  req.setAttribute("del", "Cannot delete the admin data");
				  RequestDispatcher rd=req.getRequestDispatcher("dashboard1.jsp");
				  rd.forward(req, resp);
				  
			  }

	}
}
