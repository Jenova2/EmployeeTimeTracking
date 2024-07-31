<%@ page import="jakarta.servlet.http.HttpSession"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // HttpSession session = request.getSession(false);
    if (session != null) {
        session.invalidate();
    }
    response.sendRedirect("login.jsp");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Logout</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        /* Internal CSS for page styling */
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f2f5;
            color: #333;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            text-align: center;
        }
        h2 {
            color: #007bff;
            margin-bottom: 20px;
            font-size: 28px;
            font-weight: bold;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        h2 .icon {
            margin-right: 10px;
            font-size: 40px;
            color: #007bff;
            transition: color 0.3s ease, transform 0.3s ease;
        }
        h2 .icon:hover {
            color: #0056b3;
            transform: rotate(15deg);
        }
        a {
            text-decoration: none;
            color: #007bff;
            font-size: 18px;
            font-weight: bold;
            transition: color 0.3s ease, transform 0.3s ease;
        }
        a:hover {
            color: #0056b3;
            transform: scale(1.1);
        }
    </style>
</head>
<body>
    <h2><i class="fas fa-sign-out-alt icon"></i>You have been logged out.</h2>
    <a href="login.jsp"><i class="fas fa-sign-in-alt icon"></i>Login Again</a>
</body>
</html>
