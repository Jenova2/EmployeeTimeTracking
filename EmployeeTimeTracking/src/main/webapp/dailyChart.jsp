<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session == null || session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    String username = (String) session.getAttribute("username");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Daily Tasks/Hours Pie Chart</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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
        h2 .icon:hover {
            color: #0056b3;
            transform: rotate(-10deg) scale(1.1);
        }
        canvas {
            max-width: 100%;
            height: auto;
            border: 2px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background: #fff;
            transition: box-shadow 0.3s ease, transform 0.3s ease;
        }
        canvas:hover {
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
            transform: scale(1.02);
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
            font-size: 20px;
            transition: transform 0.3s ease, color 0.3s ease;
        }
        .icon:hover {
            transform: rotate(15deg);
            color: #2980b9;
        }
        .container {
            width: 90%;
            max-width: 600px;
            margin: 20px auto;
        }
        .error-message {
            color: #e74c3c;
            font-size: 16px;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2><i class="fas fa-calendar-day icon"></i>Daily Tasks/Hours Pie Chart for <%= username %></h2>
        <canvas id="dailyChart" width="400" height="400"></canvas>
        <a href="dashboard.jsp"><i class="fas fa-arrow-left icon"></i>Back to Dashboard</a>
        <div id="error-message" class="error-message"></div>
    </div>
    <script>
        fetch('DailyChartServlet')
        .then(response => response.json())
        .then(data => {
            const labels = Object.keys(data);
            const values = Object.values(data);
            if (labels.length === 0 || values.length === 0) {
                document.getElementById('error-message').textContent = 'No data available for the chart.';
                return;
            }
            const ctx = document.getElementById('dailyChart').getContext('2d');
            new Chart(ctx, {
                type: 'pie',
                data: {
                    labels: labels,
                    datasets: [{
                        label: 'Tasks/Hours',
                        data: values,
                        backgroundColor: [
                            'rgba(255, 99, 132, 0.2)',
                            'rgba(54, 162, 235, 0.2)',
                            'rgba(255, 206, 86, 0.2)',
                            'rgba(75, 192, 192, 0.2)',
                            'rgba(153, 102, 255, 0.2)',
                            'rgba(255, 159, 64, 0.2)'
                        ],
                        borderColor: [
                            'rgba(255, 99, 132, 1)',
                            'rgba(54, 162, 235, 1)',
                            'rgba(255, 206, 86, 1)',
                            'rgba(75, 192, 192, 1)',
                            'rgba(153, 102, 255, 1)',
                            'rgba(255, 159, 64, 1)'
                        ],
                        borderWidth: 1
                    }]
                },
                options: {
                    responsive: true,
                    plugins: {
                        legend: {
                            position: 'top',
                        },
                        tooltip: {
                            callbacks: {
                                label: function(tooltipItem) {
                                    return tooltipItem.label + ': ' + tooltipItem.raw + ' hours';
                                }
                            }
                        }
                    }
                }
            });
        })
        .catch(error => {
            console.error('Error fetching data:', error);
            document.getElementById('error-message').textContent = 'Error fetching data for the chart.';
        });
    </script>
</body>
</html>
