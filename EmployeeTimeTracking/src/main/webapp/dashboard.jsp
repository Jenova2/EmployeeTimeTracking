<%@page import="jakarta.servlet.http.HttpServletRequest"%>
<%@page import="jakarta.servlet.http.HttpServletResponse"%>
<%
    if (session == null || session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
    } else {
        String role = (String) session.getAttribute("role");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>
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
        a {
            display: inline-block;
            margin: 10px;
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
    <h2><i class="fas fa-user icon"></i>Welcome, <%= session.getAttribute("username") %></h2>
    <%
        if ("Admin".equals(role)) {
    %>
    <a href="adminPage.jsp"><i class="fas fa-cogs icon"></i>Admin Page</a><br>
    <%
        } else {
    %>
    <a href="taskPage.jsp"><i class="fas fa-tasks icon"></i>Task Management</a><br>
    <a href="associaterPage.jsp"><i class="fas fa-users icon"></i>View Associater</a>
    <%
        }
    %>
    <a href="LogoutServlet"><i class="fas fa-sign-out-alt icon"></i>Logout</a>
</body>
</html>
<%
    }
%>
