<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.Bank.DTO.Customer" %>
<!DOCTYPE html>
<html>
<head>
<style>
.heading {
	color: #000080;
}

.sub {
	color: #1e90ff;
}
.success{
color:green;
}
.failure{
color:red;
}


</style>
</head>
</body bgcolor='#1e90ff'>
<div align="center">
    <h1 class="heading">Bank</h1>
    <h2 class="sub">Application Form</h2>
    <%String success=(String)request.getAttribute("success"); 
    if(success!=null){%>
    <h1 class="success"><%=success %></h1>
    <%} %>
      <%String failure=(String)request.getAttribute("failure"); 
    if(failure!=null){%>
    <h1 class="failure"><%=failure %></h1>
    <%} %>
     <%Customer account=(Customer)request.getAttribute("account"); 
    if(account!=null){%>
    <h1 class="success">Your Account Nmber:<%=account.getAccno() %> </h1>
    <%} %>
    <form action="signup" method="post">
    <table>
    <tr>
        <td>Enter Your Name:</td>
        <td><input type="text" name="name"></td>
    </tr>
    <tr>
    <td><br></td>
     <td><br></td>
    </tr>
     <tr>
        <td>Enter Your PhoneNO:</td>
        <td><input type="tel" name="phone"></td>
    </tr>
    <tr>
    <td><br></td>
     <td><br></td>
    </tr>
     <tr>
        <td>Enter Your MailID:</td>
        <td><input type="email" name="mail"></td>
    </tr>
    <tr>
    <td><br></td>
     <td><br></td>
    </tr>
    
    
    
    
    <tr>
        <td>Enter  Your PIN:</td>
         <td><input type="password" name="pass"></td>
    </tr>
    <tr>
    <td><br></td>
     <td><br></td>
    </tr>
    <tr>
        <td>Enter  Your Conform PIN:</td>
         <td><input type="password" name="con"></td>
    </tr>
    <tr>
    <td><br></td>
     <td><br></td>
    </tr>
    </table>
    
   
    <input type="submit" value="Create Account">
    <br>
    <br>
    <a href='login.jsp'>Goto Login</a>
    </form>
</div>
</body>
</html>