<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="com.Bank.DTO.Customer" %>
          <%@ page import="com.Bank.DTO.Transaction" %>
     <%@page import="com.Bank.DAO.TransactionDAO" %>
     <%@page import="com.Bank.DAO.TransactionDAOImpl" %>
      <%@ page import="java.util.List" %>
      <%@ page import="java.util.Iterator " %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
<style>
 body {
            background-color: #f9f9f9;
            font-family: Arial, sans-serif;
        }

        .container {
            margin-top: 20px;
            background: #fff;
            border:1px solid black;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            padding-bottom: 100px;
        }

        .passbook-table tbody tr:hover {
            background-color: #f1f5ff;
           
        }
        .t{
        margin-top:150px;
        
        }
       


</style>
</head>
<body>
<%Customer c1=(Customer)session.getAttribute("succ"); %>
<%TransactionDAO tdao=new TransactionDAOImpl(); 
		List<Transaction> passbook=tdao.getTransaction(c1.getAccno());  
		Iterator<Transaction> it=passbook.iterator(); %>
		
	
		 
           
		<div class="container pt-5">
		<div class="t">
		<h1 class="container border text-center ">Your passbook</h1>
		</div>
		 
		
		
          <table class="table table-striped table-bordered passbook-table pb-5" >
            <thead class="table-primary">
        <tr>
		<th>Transaction ID</th>
		<th>Account_Number</th>
		<th>Transaction Type</th>
		<th>Transaction Date</th>
		<th>Transfer Amount</th>
		<th>Current Balance</th>
		</tr>
		 </thead>  
         <tbody> 

		<% while(it.hasNext())  
		{ 
		Transaction t=it.next(); %>
	
		<tr>
		<td><%=t.getTransactionId() %></td>
		<td><%=t.getRec_acc() %></td>
		<td><%=t.getTransaction() %></td>
		<td><%=t.getDate()%></td>
		<td><%=t.getAmount() %>
		<td><%=t.getBalance() %></td>
		</tr>
		
		<br>
		<%} %>
		  </tbody>  
        </table> 
	 <div class="text-center mt-3">
            <a href="dashboard.jsp" class="btn btn-primary">Back to Dashboard</a>
        </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
      

</body>
</html>