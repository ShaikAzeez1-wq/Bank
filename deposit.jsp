<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.Bank.DTO.Customer" %>
<!DOCTYPE html>
<html>
<head>
<style>
body {
    font-family: Arial, sans-serif;
    background-color: #f9f9f9;
    margin: 0;
    padding: 0;
}

.center {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

.heading {
    color: #000080;
    font-size: 2rem;
    margin-bottom: 20px;
}

form {
    background-color: #ffffff;
    border: 1px solid #dddddd;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    padding: 20px;
    width: 300px;
    text-align: center;
}

form table {
    width: 100%;
    margin-bottom: 20px;
}

form table td {
    padding: 10px;
    font-size: 1rem;
    color: #333333;
}

input[type="text"] {
    width: 100%;
    padding: 8px;
    font-size: 1rem;
    border: 1px solid #cccccc;
    border-radius: 4px;
    box-sizing: border-box;
}

input[type="submit"] {
    background-color: #000080;
    color: #ffffff;
    border: none;
    padding: 10px 15px;
    font-size: 1rem;
    cursor: pointer;
    border-radius: 4px;
    transition: background-color 0.3s ease;
}

input[type="submit"]:hover {
    background-color: #0056b3;
}

a {
    display: inline-block;
    margin-top: 10px;
    color: #000080;
    text-decoration: none;
    font-size: 0.9rem;
}

a:hover {
    text-decoration: underline;
}

.success{
color:green;
}
.failure{
color:red;
}

</style>
</head>
<body>
<%Customer c=(Customer)session.getAttribute("success"); %>
<center>

<h1 class="heading">Deposit</h1>
 <%String success=(String)request.getAttribute("success"); 
    if(success!=null){%>
    <h1 class="success"><%=success %></h1>
    <%} %>
      <%String failure=(String)request.getAttribute("failure"); 
    if(failure!=null){%>
    <h1 class="failure"><%=failure %></h1>
    <%} %>
<form action="deposit" method="post">
<table>
<tr>
<td>Enter amount to be Deposit:</td>
<td><input type="text" name="mon"></td>
</tr>
</table>
<input type="submit" value="deposit">
<br>
<br>
<a href='dashboard.jsp'>goto Dashboard</a>

</form>
</center>
</body>
</html>