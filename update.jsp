<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.Bank.DTO.Customer" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* General Page Styling */
body {
    font-family: Arial, sans-serif;
    background-color: #f9f9f9;
    margin: 0;
    padding: 0;
    color: #333;
}

h1 {
    text-align: center;
    font-size: 28px;
    margin: 20px 0;
}

/* Centered Content */
center {
    margin-top: 50px;
}

/* Styling Success and Failure Messages */
.success {
    color: #28a745;
    font-size: 20px;
    font-weight: bold;
    text-align: center;
}

.failure {
    color: #dc3545;
    font-size: 20px;
    font-weight: bold;
    text-align: center;
}

/* Form Styling */
form {
    background: #fff;
    border: 1px solid #ddd;
    padding: 20px;
    box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
    width: 350px;
    margin: auto;
}

table {
    width: 100%;
}

td {
    padding: 8px 10px;
    font-size: 16px;
}

input[type="text"],
input[type="tel"],
input[type="email"] {
    width: 100%;
    padding: 8px;
    margin: 5px 0;
    border: 1px solid #ccc;
    border-radius: 4px;
    font-size: 14px;
    box-sizing: border-box;
}

/* Submit Button Styling */
input[type="submit"] {
    background-color: #007bff;
    color: white;
    border: none;
    padding: 10px 15px;
    border-radius: 4px;
    font-size: 16px;
    cursor: pointer;
    width: 100%;
}

input[type="submit"]:hover {
    background-color: #0056b3;
}

/* Link Styling */
a {
    display: inline-block;
    margin-top: 15px;
    color: #007bff;
    text-decoration: none;
    font-size: 16px;
}

a:hover {
    text-decoration: underline;
}

/* Responsive Design */
@media (max-width: 480px) {
    form {
        width: 90%;
    }
}

</style>
</head>
<body>

<%Customer c1=(Customer)session.getAttribute("succ"); %>
<center>
<%String success=(String)request.getAttribute("success"); 
		if(success!=null){%>
		<h1 class="success"><%=success %></h1>
		<%} %>

<%String failure=(String)request.getAttribute("failure"); 
		if(failure!=null){%>
		<h1 class="failure"><%=failure %></h1>
		<%} %>
		<h1>update Account</h1>
<form action="upd" method="post">
    <table>
    <tr>
    <td>Enter Tour Name:</td>
    <td><input type="text" name="name" value="<%=c1.getName() %>"></td>
    </tr>
    
    <tr>
    <td><br></td>
     <td><br></td>
    </tr>
     <tr>
        <td>Enter Your PhoneNO:</td>
        <td><input type="tel" name="phone" value="<%=c1.getPhone()%>"></td>
    </tr>
    <tr>
    <td><br></td>
     <td><br></td>
    </tr>
     <tr>
        <td>Enter Your MailID:</td>
        <td><input type="email" name="mail" value="<%=c1.getMail() %>"></td>
    </tr>
</table>
<input type="submit" value="update">
<br>
<a href="dashboard.jsp"> Goto dashboard</a>
</center>
</body>
</html>