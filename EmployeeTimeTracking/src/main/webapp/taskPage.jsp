<%@page import="jakarta.servlet.http.HttpSession"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Get the session
    //HttpSession session = request.getSession(false);
    if (session == null || session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return; // Prevent further processing if the user is not logged in
    }

    // Retrieve username from the session
    String username = (String) session.getAttribute("username");
    int userId = 0;
    String dbUrl = "jdbc:mysql://localhost:3306/EmployeeTaskTracker";
    String dbUser = "root";
    String dbPass = "jenova1234";

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
    <title>Task Management</title>
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
        }
        h2 {
            color: #007bff;
            margin: 20px;
        }
        form {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            width: 80%;
            max-width: 600px;
            margin-bottom: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        label {
            margin-bottom: 5px;
            font-size: 16px;
            color: #555;
            width: 100%;
            text-align: left;
        }
        input[type="text"], input[type="date"], input[type="time"], textarea, select {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 16px;
        }
        input[type="submit"] {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }
        table {
            width: 80%;
            max-width: 800px;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: #fff;
            border-radius: 8px;
            overflow: hidden;
        }
        th, td {
            padding: 12px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #007bff;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        tr:hover {
            background-color: #e9ecef;
        }
        a {
            color: #007bff;
            text-decoration: none;
            font-size: 16px;
            transition: color 0.3s ease, transform 0.3s ease;
        }
        a:hover {
            color: #0056b3;
            transform: scale(1.1);
        }
        .icon {
            margin-right: 8px;
        }
    </style>
</head>
<body>
    <h2>Task Management for <%= username %></h2>
    <form action="TaskServlet" method="get">
        <input type="hidden" name="userId" value="<%= userId %>">
        <label for="project">Project:</label>
        <input type="text" id="project" name="project" required>
        <label for="date">Date:</label>
        <input type="date" id="date" name="date" required>
        <label for="startTime">Start Time:</label>
        <input type="time" id="startTime" name="startTime" required>
        <label for="endTime">End Time:</label>
        <input type="time" id="endTime" name="endTime" required>
        <label for="category">Category:</label>
        <input type="text" id="category" name="category" required>
        <label for="description">Description:</label>
        <textarea id="description" name="description" rows="4" required></textarea>
        <input type="submit" value="Add Task">
    </form>
    <h3>Your Tasks</h3>
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
            <td>
                <a href="EditTaskServlet?taskId=<%= rs.getInt("task_id") %>"><i class="fas fa-edit icon"></i>Edit</a>
                <a href="DeleteTaskServlet?taskId=<%= rs.getInt("task_id") %>"><i class="fas fa-trash icon"></i>Delete</a>
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
    <a href="dashboard.jsp"><i class="fas fa-arrow-left icon"></i>Back to Dashboard</a>
</body>
</html>
