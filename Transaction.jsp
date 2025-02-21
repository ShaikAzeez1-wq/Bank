<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ page import="com.Bank.DTO.Customer" %>
    <%@ page import="com.Bank.DTO.Transaction" %>
    <%@ page import="com.Bank.DAO.*" %>
    <%@ page import="java.util.*" %>
    <%@ page import="com.Bank.DTO.Customer" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* General Styles */
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f4f4f9;
    color: #333;
}

h3 {
    text-align: center;
    color: #444;
    margin-top: 20px;
}

/* Table Styles */
table {
    width: 80%;
    margin: 20px auto;
    border-collapse: collapse;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
    background-color: #fff;
}

table th, table td {
    padding: 10px;
    border: 1px solid #ddd;
    text-align: center;
}

table thead {
    background-color: #007BFF;
    color: #ffffff;
}

table tr:nth-child(even) {
    background-color: #f2f2f2;
}

table tr:hover {
    background-color: #d1ecf1;
    transition: background-color 0.3s ease;
}

/* Link Styles */
a {
    display: inline-block;
    margin: 20px auto;
    text-decoration: none;
    color: #007BFF;
    font-size: 16px;
    padding: 8px 16px;
    border: 1px solid #007BFF;
    border-radius: 4px;
    transition: all 0.3s ease;
}

a:hover {
    background-color: #007BFF;
    color: #fff;
}

/* Centered Content */
center {
    margin-top: 20px;
}

</style>
</head>
<body>
<% ArrayList<Transaction> transactions=( ArrayList<Transaction>)session.getAttribute("sub");%>
 


   
<!-- User Section --> 
<%String fa=(String)request.getAttribute("failure"); %>
<%if(fa!=null){ %>
<%=fa %>
<%} %>
    
      
        <%if(transactions!=null){ %>
        <h3>View Transactions Data</h3> 
         
        <table > 
          <thead> 
            <tr> 
            
              <th>TRAN_ID</th> 
              <th>USER_ACC</th> 
              <th>REC_ACC</th> 
              <th>TRAN_DATE</th> 
              <th>TRAN_TYPE</th> 
          <th>AMOUNT</th> 
          <th>BALANCE</th> 
            </tr> 
          </thead> 
          <tbody> 
         
          <%   
          Iterator<Transaction> it=transactions.iterator(); 
		    while(it.hasNext()) 
		    { 
		     Transaction b=it.next();  %>
          
          <tr>
         <td><%=b.getTransactionId() %></td>
          <td><%=b.getUser() %></td>
          <td><%=b.getRec_acc() %></td>
          <td><%=b.getDate() %></td>
          <td><%=b.getTransaction() %>
          <td><%=b.getAmount() %></td>
          <td><%=b.getBalance() %></td>
          </tr>
          <%} %>

         </tbody> 
        </table> 
        <%} %>
 
<center>
<a href='dashboard.jsp'>Back To DashBoard</a>
</center>
</body>
</html>