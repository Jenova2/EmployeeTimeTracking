<%@page import="jakarta.servlet.http.HttpSession"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    //HttpSession session = request.getSession(false);
    if (session == null || session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return; // Prevent further processing if the user is not logged in
    }

    String username = (String) session.getAttribute("username");
    int userId = 0;
    String dbUrl = "jdbc:mysql://localhost:3306/EmployeeTaskTracker";
    String dbUser = "root";
    String dbPass = "sanjay01";

    // Query to get user_id from username
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
        PreparedStatement ps = con.prepareStatement("SELECT user_id FROM Users WHERE username=?");
        ps.setString(1, username);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            userId = rs.getInt("user_id");
        }
        rs.close();
        ps.close();
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>View My Tasks</title>
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
            min-height: 100vh;
        }
        h2 {
            color: #007bff;
            margin-bottom: 20px;
        }
        table {
            width: 80%;
            border-collapse: collapse;
            margin: 20px 0;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            background-color: #fff;
        }
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #007bff;
            color: white;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        a {
            color: #007bff;
            text-decoration: none;
            font-weight: bold;
        }
        a:hover {
            color: #0056b3;
            text-decoration: underline;
        }
        .action-icons a {
            font-size: 18px;
            margin-right: 10px;
            transition: color 0.3s, transform 0.3s;
        }
        .action-icons a:hover {
            color: #ff5722;
            transform: scale(1.1);
        }
        .back-link {
            margin-top: 20px;
            font-size: 16px;
        }
        .back-link a {
            text-decoration: none;
            color: #007bff;
            padding: 8px 16px;
            border-radius: 5px;
            border: 1px solid #007bff;
            transition: background-color 0.3s, color 0.3s, transform 0.3s;
            display: inline-flex;
            align-items: center;
        }
        .back-link a:hover {
            background-color: #007bff;
            color: white;
            transform: scale(1.05);
        }
        .back-link a i {
            margin-right: 8px;
        }
    </style>
</head>
<body>
    <h2>My Tasks</h2>
    <table>
        <tr>
            <th>Project</th>
            <th>Date</th>
            <th>Start Time</th>
            <th>End Time</th>
            <th>Category</th>
            <th>Description</th>
            <th>Actions</th>
        </tr>
        <%
            try {
                Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
                PreparedStatement ps = con.prepareStatement("SELECT * FROM Tasks WHERE employee_id=?");
                ps.setInt(1, userId);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getString("project") %></td>
            <td><%= rs.getDate("date") %></td>
            <td><%= rs.getTime("start_time") %></td>
            <td><%= rs.getTime("end_time") %></td>
            <td><%= rs.getString("category") %></td>
            <td><%= rs.getString("description") %></td>
            <td class="action-icons">
                <a href="EditTaskServlet?taskId=<%= rs.getInt("task_id") %>"><i class="fas fa-edit"></i>Edit</a>
                <a href="DeleteTaskServlet?taskId=<%= rs.getInt("task_id") %>"><i class="fas fa-trash"></i>Delete</a>
            </td>
        </tr>
        <%
                }
                rs.close();
                ps.close();
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </table>
    <div class="back-link">
        <a href="dashboard.jsp"><i class="fas fa-arrow-left"></i>Back to Dashboard</a>
    </div>
</body>
</html>
