<%@page import="jakarta.servlet.http.HttpSession"%>
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
    <title>Monthly Tasks/Hours Bar Chart</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
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
            transition: color 0.3s ease;
        }
        h2 .icon {
            margin-right: 10px;
            font-size: 40px;
            color: #007bff;
            transition: color 0.3s ease, transform 0.3s ease;
        }
        h2 .icon:hover {
            color: #0056b3;
            transform: rotate(-10deg) scale(1.1);
        }
        canvas {
            border: 1px solid #ccc;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
            transition: box-shadow 0.3s ease, transform 0.3s ease;
        }
        canvas:hover {
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
            transform: scale(1.02);
        }
        a {
            display: inline-block;
            text-decoration: none;
            color: #007bff;
            font-size: 18px;
            font-weight: bold;
            margin-top: 20px;
            transition: color 0.3s ease, transform 0.3s ease;
        }
        a:hover {
            color: #0056b3;
            transform: scale(1.1);
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
        <h2><i class="fas fa-calendar-day icon"></i>Monthly Tasks/Hours Bar Chart for <%= username %></h2>
        <canvas id="monthlyChart" width="400" height="400"></canvas>
        <a href="dashboard.jsp"><i class="fas fa-arrow-left icon"></i>Back to Dashboard</a>
        <div id="error-message" class="error-message"></div>
    </div>
    <script>
        fetch('MonthlyChartServlet')
        .then(response => response.json())
        .then(data => {
            console.log('Data received:', data);
            const labels = data.labels || [];
            const values = data.data || [];
            if (labels.length === 0 || values.length === 0) {
                document.getElementById('error-message').textContent = 'No data available for the chart.';
                return;
            }
            const ctx = document.getElementById('monthlyChart').getContext('2d');
            new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: labels,
                    datasets: [{
                        label: 'Tasks/Hours',
                        data: values,
                        backgroundColor: 'rgba(75, 192, 192, 0.2)',
                        borderColor: 'rgba(75, 192, 192, 1)',
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
                    },
                    scales: {
                        x: {
                            beginAtZero: true,
                            grid: {
                                display: false,
                            }
                        },
                        y: {
                            beginAtZero: true,
                            grid: {
                                color: 'rgba(0, 0, 0, 0.1)',
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
