<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ResultSet task = (ResultSet) request.getAttribute("task");
    if (task != null) {
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Task</title>
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
        form {
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            width: 80%;
            max-width: 600px;
            box-sizing: border-box;
        }
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #555;
        }
        input[type="text"],
        input[type="date"],
        input[type="time"],
        textarea {
            width: calc(100% - 22px);
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            margin-bottom: 12px;
            box-sizing: border-box;
        }
        textarea {
            height: 100px;
            resize: vertical;
        }
        input[type="submit"] {
            background-color: #3498db;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }
        input[type="submit"]:hover {
            background-color: #2980b9;
            transform: scale(1.05);
        }
        a {
            display: inline-block;
            margin-top: 20px;
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
    <h2><i class="fas fa-edit icon"></i>Edit Task</h2>
    <form action="EditTaskServlet" method="post">
        <input type="hidden" name="taskId" value="<%= task.getInt("task_id") %>">
        <label for="project"><i class="fas fa-project-diagram icon"></i>Project:</label>
        <input type="text" id="project" name="project" value="<%= task.getString("project") %>">
        
        <label for="date"><i class="fas fa-calendar-alt icon"></i>Date:</label>
        <input type="date" id="date" name="date" value="<%= task.getDate("date") %>">
        
        <label for="startTime"><i class="fas fa-clock icon"></i>Start Time:</label>
        <input type="time" id="startTime" name="startTime" value="<%= task.getTime("start_time") %>">
        
        <label for="endTime"><i class="fas fa-clock icon"></i>End Time:</label>
        <input type="time" id="endTime" name="endTime" value="<%= task.getTime("end_time") %>">
        
        <label for="category"><i class="fas fa-tag icon"></i>Category:</label>
        <input type="text" id="category" name="category" value="<%= task.getString("category") %>">
        
        <label for="description"><i class="fas fa-align-left icon"></i>Description:</label>
        <textarea id="description" name="description"><%= task.getString("description") %></textarea>
        
        <input type="submit" value="Update Task">
    </form>
    <a href="taskPage.jsp"><i class="fas fa-arrow-left icon"></i>Back to Task Management</a>
</body>
</html>
<%
    }
%>
