<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.Bank.DTO.Customer" %>
<%@ page import="com.Bank.DAO.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.Bank.DTO.Customer" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet"> <!-- Font Awesome -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
<style>
      body {
    font-family: "Lato", sans-serif;
    background-color: #D4EBF8; /* Light background */
}

.sidenav {
    height: 100%;
    width: 0;
    position: fixed;
    z-index: 1;
    top: 0;
    left: 0;
    background-color: #1F509A; /* Blue sidebar */
    overflow-x: hidden;
    transition: 0.5s;
    padding-top: 60px;
}

.sidenav a {
    padding: 8px 8px 8px 32px;
    text-decoration: none;
    font-size: 25px;
    color: #fff; /* White text */
    display: block;
    transition: 0.3s;
}

.sidenav a:hover {
    color: #E38E49; /* Gold color on hover */
}

.sidenav .closebtn {
    position: absolute;
    top: 0;
    right: 25px;
    font-size: 30px;
    margin-left: 25px;
}

@media screen and (max-height: 450px) {
    .sidenav {padding-top: 15px;}
    .sidenav a {font-size: 18px;}
}

.passbook-link {
    position: fixed;
    bottom: 20px;
    right: 20px;
    background-color: #0A3981; /* Dark blue for passbook link */
    color: white;
    padding: 10px 20px;
    border-radius: 5px;
    text-decoration: none;
    font-size: 18px;
}

.passbook-link:hover {
    background-color: #E38E49; /* Gold color on hover */
    color: white;
    text-decoration: none;
}

.card {
    border: 3px solid #343a40; /* Dark border for card */
    border-radius: 10px; /* Optional: For rounded corners */
    padding: 2px;
    background-color: #fff; /* White background for cards */
}

.navbar {
    background-color:#E38E49; /* Blue navbar #1F509A*/
}

.navbar a {
    color: white !important;
   /* White text for navbar links */
}

.navbar a:hover {
    color: #E38E49; 
     /* Gold color on hover */
}

.btn-success {
    background-color: #1F509A; /* Matching button color */
    border-color: #1F509A;
}

.btn-warning {
    background-color: #E38E49; /* Orange/gold button color */
    border-color: #E38E49;
}

.container {
    background-color: #D4EBF8; /* Light background for container */
    border-radius: 10px; /* Rounded corners */
    padding: 20px;
}

h1 {
    color: #1F509A; /* Dark blue for heading */
}

.alert-danger {
    background-color: #F8D7DA;
    color: #721C24;
}

</style>
</head>
<body>
<% Customer c1 = (Customer) session.getAttribute("succ"); %>
<% Customer c = (Customer) session.getAttribute("success"); %>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <% if (c1.getAccno() == 1100110011) { %>
        <div id="mySidenav" class="sidenav">
            <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
            <a style="font-size: 18px; padding: 4px 8px;" href="dashboard1.jsp">Get Account Data</a>
            <a style="font-size: 18px; padding: 4px 8px;" href="transaction">Get Transaction List</a>
            <a style="font-size: 18px; padding: 4px 8px;" href="dashboard1.jsp?action=azeez">Delete Any User</a>
        </div>
        <span style="font-size:20px;cursor:pointer;color:white" onclick="openNav()">&#9776;&nbsp;</span>
        <script>
            function openNav() {
                document.getElementById("mySidenav").style.width = "250px";
            }
            function closeNav() {
                document.getElementById("mySidenav").style.width = "0";
            }
        </script>
        <% } %>
        <a class="navbar-brand" href="#">Welcome <%= c1.getName() %></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
            <li class="nav-item">
                    <a class="nav-link" href="#"><i class="fa-solid fa-house"></i> Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#"> <i class="fa-solid fa-landmark-magnifying-glass"></i> Services</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href=""><i class="fa-solid fa-user"></i> About Me</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="update.jsp">Update your account</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="forgot.jsp">Reset PIN</a>
                </li>
                <li class="nav-item">
                    <form action="log" method="post">
                        <input class="btn btn-danger" type="submit" name="logout" value="Logout">
                    </form>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container mt-4">
    <h1 class="text-center mb-4">Bank</h1>
    <!-- Card Section -->
    <div class="row">
        <!-- Check Balance Card -->
        <div class="col-md-4 mb-4">
            <div class="card text-center">
                <div class="card-body">
                    <h5 class="card-title" style="color:#0A3981"><b>Check Balance</b></h5>
                    <p class="card-text"> your current account balance:<%=c1.getBal() %></p>
                   
                   
                </div>
            </div>
        </div>
        <!-- Deposit Card -->
        <div class="col-md-4 mb-4">
            <div class="card text-center">
                <div class="card-body">
                    <h5 class="card-title" style="color:#0A3981"><b>Deposit</b></h5>
                    <p class="card-text">Deposit money into your account securely.</p>
                    <a href="deposit.jsp" class="btn btn-success">Deposit</a>
                </div>
            </div>
        </div>
        <!-- Transfer Amount Card -->
        <div class="col-md-4 mb-4">
            <div class="card text-center">
                <div class="card-body">
                    <h5 class="card-title" style="color:#0A3981"><b>Transfer Amount</b></h5>
                    <p class="card-text">Send money to another account easily.</p>
                    <a href="transfor.jsp" class="btn btn-warning">Transfer</a>
                </div>
            </div>
        </div>
    </div>
    <!-- Additional Information -->
    <% String fa = (String) request.getAttribute("failure"); %>
    <% if (fa != null) { %>
        <div class="alert alert-danger"><%= fa %></div>
    <% } %>
    <% if (c != null) { %>
        <div class="row">
            <div class="col-md-12">
                <h3>Your balance: <%= c.getBal() %></h3>
            </div>
        </div>
    <% } %>
</div>

<!-- Passbook Link at Bottom Left -->
<a href="passbook.jsp" class="passbook-link">View Transactions</a>

</body>
</html>
