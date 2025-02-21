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
<link 
href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
/* General Body Styles */
body {
    font-family: 'Arial', sans-serif;
    background-color: #f8f9fa;
    color: #343a40;
    margin: 0;
    padding: 0;
}

/* Container and Header Styling */
h1 {
    font-weight: bold;
    color: #007bff;
    margin-top: 20px;
    text-transform: uppercase;
    letter-spacing: 1px;
}

/* Table Styling */
.table {
    margin-top: 20px;
    background-color: #ffffff;
    box-shadow: 0px 2px 8px rgba(0, 0, 0, 0.1);
}

.table th {
    background-color: #007bff;
    color: #fff;
    text-align: center;
}

.table td {
    text-align: center;
    vertical-align: middle;
    padding: 10px;
}

.table tbody tr:nth-child(even) {
    background-color: #f2f2f2;
}

.table tbody tr:hover {
    background-color: #d1ecf1;
    transition: background-color 0.3s ease-in-out;
}

/* Back to Dashboard Link Styling */
a {
    display: inline-block;
    text-decoration: none;
    color: #007bff;
    font-weight: bold;
    border: 1px solid #007bff;
    border-radius: 5px;
    padding: 10px 15px;
    margin-top: 20px;
    transition: all 0.3s ease;
}

a:hover {
    background-color: #007bff;
    color: #fff;
    text-decoration: none;
}

/* Center Content */
center {
    margin-top: 20px;
}

</style>

</head>
<body>

<%Customer c1 = (Customer) session.getAttribute("succ"); %>

 <%String action=request.getParameter("action"); %>

 
<!-- User Section --> 

    <div class="row"> 
      <div class="col-md-12"> 
     
      
        <h3>View Customers Data</h3> 
        <%String fa=(String)request.getAttribute("delete"); %>
<%if(fa!=null){ %>
<%=fa %>
<%} %>
<%String fas=(String)request.getAttribute("del"); %>
<%if(fas!=null){ %>
<%=fa %>
<%} %>
        
         
        <table class="table table-bordered"> 
          <thead> 
            <tr> 
            
              <th>ACC_NO</th> 
              <th>NAME</th> 
              <th>PHONE</th> 
              <th>MAIL</th> 
              <th>BALANCE</th> 
                <%if("azeez".equals(action)){ %>
         <th>Remove</th>
          
          
          <%} %>
           
            </tr> 
          </thead> 
          <tbody> 
         
          <%   
          CustomerDAO cdao=new CustomerDAOImpl();

  		List<Customer> customers=cdao.getCustomer(); 
		    Iterator<Customer> it=customers.iterator(); 
		    while(it.hasNext()) 
		    { 
		     Customer a=it.next(); %>
          
          <tr>
          <td><%=a.getAccno() %></td>
          <td><%=a.getName() %></td>
          <td><%=a.getPhone() %></td>
          <td><%=a.getMail() %></td>
          <td><%=a.getBal() %></td>
         <td> <%if("azeez".equals(action)){ %>
          <form action="delete" method="post">
          <button><input class="btn btn-danger" type="hidden" 
name="acc" value="<%=a.getAccno() %>">Delete</button>
          </form>
          <%} %></td>
         
          </tr>
          <%} %>

         </tbody> 
        </table> 
        
      
</div> 
</div> 
<center>
<a href='dashboard.jsp'>Back To DashBoard</a>
</center>
</body>
</html>