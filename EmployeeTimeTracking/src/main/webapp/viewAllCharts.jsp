<%@page import="jakarta.servlet.http.HttpSession"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    //HttpSession session = request.getSession(false);
    if (session == null || session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return; // Prevent further processing if the user is not logged in
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>View All Charts</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7f9;
            color: #333;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }
        h2 {
            color: #007bff;
            margin-bottom: 20px;
        }
        ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        li {
            margin: 10px 0;
        }
        a {
            text-decoration: none;
            color: #007bff;
            font-size: 18px;
            padding: 10px 20px;
            border-radius: 5px;
            transition: background-color 0.3s, color 0.3s, transform 0.3s;
            display: flex;
            align-items: center;
            font-weight: bold;
        }
        a:hover {
            background-color: #007bff;
            color: white;
            transform: scale(1.05);
        }
        a i {
            margin-right: 8px;
        }
        .back-link {
            margin-top: 20px;
            font-size: 16px;
        }
        .back-link a {
            font-size: 16px;
            padding: 8px 16px;
            border-radius: 5px;
            border: 1px solid #007bff;
            color: #007bff;
            transition: background-color 0.3s, color 0.3s, transform 0.3s;
        }
        .back-link a:hover {
            background-color: #007bff;
            color: white;
            transform: scale(1.05);
        }
    </style>
</head>
<body>
    <h2>Charts Overview</h2>
    <ul>
        <li><a href="AllDailyChart.jsp"><i class="fas fa-calendar-week"></i>View Daily Chart</a></li>
        <li><a href="AllWeeklyChart.jsp"><i class="fas fa-calendar-week"></i>View Weekly Chart</a></li>
        <li><a href="AllMonthlyChart.jsp"><i class="fas fa-calendar-week"></i>View Monthly Chart</a></li>
    </ul>
    <div class="back-link">
        <a href="dashboard.jsp"><i class="fas fa-arrow-left"></i>Back to Dashboard</a>
    </div>
</body>
</html>
