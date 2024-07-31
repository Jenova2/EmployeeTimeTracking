<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
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
            transform: rotate(-10deg);
        }
        form {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            width: 300px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        label {
            margin-bottom: 5px;
            font-size: 16px;
            color: #555;
        }
        input[type="text"], input[type="password"], select {
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
        a {
            display: inline-block;
            text-decoration: none;
            color: #007bff;
            font-size: 16px;
            margin-top: 20px;
            transition: color 0.3s ease, transform 0.3s ease;
        }
        a:hover {
            color: #0056b3;
            transform: scale(1.1);
        }
    </style>
</head>
<body>
    <h2><i class="fas fa-user-plus icon"></i>Register</h2>
    <form action="RegisterServlet" method="post">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required>
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required>
        <label for="role">Role:</label>
        <select id="role" name="role" required>
            <option value="Admin">Admin</option>
            <option value="Associate">Associate</option>
        </select>
        <input type="submit" value="Register">
    </form>
    <a href="login.jsp"><i class="fas fa-sign-in-alt icon"></i>Back to Login</a>
</body>
</html>
