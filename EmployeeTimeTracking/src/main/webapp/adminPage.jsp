<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Page</title>
    <style>
        /* Internal CSS for overall page styling */
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            color: #333;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            text-align: center;
        }
        h2 {
            color: #2c3e50;
            margin-bottom: 20px;
        }
        ul {
            list-style-type: none;
            padding: 0;
        }
        li {
            margin: 15px 0;
        }
        a {
            text-decoration: none;
            color: #3498db;
            font-size: 20px;
            display: flex;
            align-items: center;
            transition: color 0.3s ease, transform 0.3s ease;
        }
        a:hover {
            color: #2980b9;
            transform: scale(1.05);
        }
        .icon {
            margin-right: 10px;
            font-size: 24px;
            transition: transform 0.3s ease;
        }
        a:hover .icon {
            transform: rotate(20deg);
        }
        .back-link {
            margin-top: 20px;
            font-size: 18px;
        }
        .back-link a {
            color: #e74c3c;
        }
        .back-link a:hover {
            color: #c0392b;
            text-decoration: underline;
        }
    </style>
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <!-- Inline CSS (if any) -->
</head>
<body>
    <% 
    // Uncomment the following session checks if required
    // HttpSession session = request.getSession(false);
    // if (session == null || session.getAttribute("username") == null) {
    //     response.sendRedirect("login.jsp");
    //     return; // Ensure no further processing is done after redirection
    // } else if (!session.getAttribute("role").equals("1")) {
    //     response.sendRedirect("dashboard.jsp");
    //     return; // Ensure no further processing is done after redirection
    // }
    %>
    <div>
        <h2>Admin Page</h2>
        <ul>
            <li><a href="viewAllTasks.jsp"><i class="fas fa-tasks icon"></i>View All Tasks</a></li>
            <li><a href="viewAllCharts.jsp"><i class="fas fa-chart-line icon"></i>View All Charts</a></li>
        </ul>
        <div class="back-link"><a href="dashboard.jsp">Back to Dashboard</a></div>
    </div>
</body>
</html>
