<%@ page import="com.Bank.DTO.Customer" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Bank Login</title>
<style>
    /* General Reset */
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: 'Arial', sans-serif;
        background: linear-gradient(135deg, #add8e6, #87ceeb);
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        color: #333;
    }

    .container {
        background: #fff;
        padding: 30px;
        border-radius: 8px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        max-width: 400px;
        width: 100%;
        text-align: center;
    }

    .heading {
        font-size: 2rem;
        color: #000080;
        margin-bottom: 10px;
    }

    .sub {
        font-size: 1.2rem;
        color: #1e90ff;
        margin-bottom: 20px;
    }

    .success {
        color: green;
        font-size: 1rem;
        margin-bottom: 10px;
    }

    .failure {
        color: red;
        font-size: 1rem;
        margin-bottom: 10px;
    }

    form {
        display: flex;
        flex-direction: column;
        gap: 15px;
    }

    input[type="text"],
    input[type="password"] {
        padding: 10px;
        font-size: 1rem;
        border: 1px solid #ccc;
        border-radius: 4px;
        width: 100%;
    }

    input[type="text"]:focus,
    input[type="password"]:focus {
        border-color: #1e90ff;
        outline: none;
    }

    input[type="submit"] {
        padding: 10px;
        font-size: 1rem;
        background-color: #1e90ff;
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        transition: background-color 0.3s;
    }

    input[type="submit"]:hover {
        background-color: #000080;
    }

    a {
        color: #1e90ff;
        text-decoration: none;
        font-size: 0.9rem;
        transition: color 0.3s;
    }

    a:hover {
        color: #000080;
    }

    table {
        width: 100%;
    }

    td {
        padding: 10px 0;
        font-size: 1rem;
        text-align: left;
    }

    td input {
        width: 95%;
    }
</style>
</head>
<body>
    <div class="container">
        <h1 class="heading">Bank</h1>
        <h2 class="sub">Login</h2>

        <% String success = (String) request.getAttribute("success"); %>
        <% if (success != null) { %>
            <div class="success"><%= success %></div>
        <% } %>
        
        

        <% String failure = (String) request.getAttribute("failure"); %>
        <% if (failure != null) { %>
            <div class="failure"><%= failure %></div>
        <% } %>

        <form action="login" method="post">
            <table>
                <tr>
                    <td>Enter Account Number:</td>
                    <td><input type="text" name="accnumber" required></td>
                </tr>
                <tr>
                    <td>Enter Your PIN:</td>
                    <td><input type="password" name="pass" required></td>
                </tr>
            </table>
            <a href='forgot.jsp'>Forget PIN</a>
            <br>
            <input type="submit" value="Login">
            <br>
            <a href='signup.jsp'>Create Account</a>
        </form>
    </div>
</body>
</html>
