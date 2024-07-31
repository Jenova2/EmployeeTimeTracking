<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
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
        }
        form {
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            width: 90%;
            max-width: 400px;
            box-sizing: border-box;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        label {
            display: flex;
            align-items: center;
            margin-bottom: 12px;
            font-weight: bold;
            color: #555;
        }
        input[type="text"],
        input[type="password"] {
            width: calc(100% - 40px);
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            margin-bottom: 20px;
            box-sizing: border-box;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }
        input[type="text"]:focus,
        input[type="password"]:focus {
            border-color: #007bff;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
            outline: none;
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
        .icon {
            margin-right: 10px;
            color: #007bff;
            font-size: 20px;
            transition: color 0.3s ease;
        }
        .icon:hover {
            color: #0056b3;
            transform: rotate(15deg);
        }
    </style>
</head>
<body>
    <h2><i class="fas fa-user icon"></i>Login</h2>
    <form action="LoginServlet" method="post">
        <label for="username">
            <i class="fas fa-user icon"></i>Username:
        </label>
        <input type="text" id="username" name="username">
        
        <label for="password">
            <i class="fas fa-lock icon"></i>Password:
        </label>
        <input type="password" id="password" name="password">
        
        <input type="submit" value="Login">
    </form>
</body>
</html>
