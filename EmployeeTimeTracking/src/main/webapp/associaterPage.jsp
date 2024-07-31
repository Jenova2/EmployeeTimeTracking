<%@page import="jakarta.servlet.http.HttpSession"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--  
    HttpSession session = request.getSession(false);
    if (session == null || session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return; // Prevent further processing if the user is not logged in
    } else if (!"Associate".equals(session.getAttribute("role"))) {
        response.sendRedirect("dashboard.jsp");
        return; // Redirect to dashboard if the user is not an associate
    }
-->
<!DOCTYPE html>
<html>
<head>
    <title>Associate Page</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        /* Internal CSS for page styling */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
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
            color: #2c3e50;
            margin-bottom: 20px;
            font-size: 24px;
            font-weight: bold;
        }
        ul {
            list-style-type: none;
            padding: 0;
        }
        ul li {
            margin: 10px 0;
        }
        a {
            text-decoration: none;
            color: #3498db;
            font-size: 18px;
            transition: color 0.3s ease, transform 0.3s ease;
        }
        a:hover {
            color: #2980b9;
            transform: scale(1.05);
        }
        .icon {
            margin-right: 8px;
            font-size: 18px;
            transition: transform 0.3s ease;
        }
        .icon:hover {
            transform: rotate(15deg);
        }
    </style>
</head>
<body>
    <h2><i class="fas fa-user-tie icon"></i>Associate Page</h2>
    <ul>
        <li><a href="viewMyCharts.jsp"><i class="fas fa-chart-line icon"></i>View My Charts</a></li>
    </ul>
    <a href="dashboard.jsp"><i class="fas fa-arrow-left icon"></i>Back to Dashboard</a>
</body>
</html>
