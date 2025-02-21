<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.Bank.DTO.Customer" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f9;
    margin: 0;
    padding: 0;
}

h1 {
    color: #333;
    margin-bottom: 20px;
}

form {
    background-color: #ffffff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    max-width: 400px;
    margin: auto;
}

table {
    width: 100%;
    margin: 10px 0;
}

table td {
    padding: 10px 0;
}

input[type="text"] {
    width: 100%;
    padding: 10px;
    margin: 5px 0;
    border: 1px solid #ddd;
    border-radius: 5px;
    box-sizing: border-box;
}

input[type="submit"] {
    background-color: #4CAF50;
    color: white;
    padding: 10px 15px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
    margin-top: 10px;
    width: 100%;
}

input[type="submit"]:hover {
    background-color: #45a049;
}

a {
    text-decoration: none;
    color: #007BFF;
    margin-top: 10px;
    display: inline-block;
}

a:hover {
    text-decoration: underline;
}
.su{
color:green;
}
.fa{
color:red;
}

</style>
</head>
<body>

<center>
<%Customer c=(Customer)session.getAttribute("success"); %>
<%String su=(String)request.getAttribute("succ"); %>
<%if(su!=null){ %>
<h3 class="su"><%=su %></h3>
<%} %>

<%String fa=(String)request.getAttribute("failure"); %>
<%if(fa!=null){ %>
<h3 class="fa"><%=fa %></h3>
<%} %>
<form action="transfer" method="post">
<h1>Transfer Amount</h1>
<table>
<tr>
<td>Enter the amount to be transferred:</td>
<td><input type="text" name="amo"></td>
</tr>
<tr>
<td>Enter the benificiary account number:</td>
<td><input type="text" name="acc"></td>
</tr>
<tr>
<td>Enter the Pin:</td>
<td><input type="Password" name="pas"></td>
</tr>
</table>
<br>
<input type="submit" value="transfer">
<br>
<a href='dashboard.jsp'>Back</a>

</form>
</center>
</body>
</html>