<%@page import="jakarta.servlet.http.HttpSession"%>
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
    <title>Weekly Tasks/Hours Bar Chart</title>
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
            border-radius: 8px;
            background-color: #fff;
            margin-top: 20px;
            transition: box-shadow 0.3s ease, transform 0.3s ease;
        }
        canvas:hover {
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
            transform: scale(1.02);
        }
        a {
            color: #007bff;
            text-decoration: none;
            font-weight: bold;
            margin-top: 20px;
            display: inline-flex;
            align-items: center;
            transition: color 0.3s ease, transform 0.3s ease;
        }
        a:hover {
            color: #0056b3;
            text-decoration: underline;
            transform: scale(1.05);
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
            transition: transform 0.3s ease;
        }
        .back-link a:hover i {
            transform: translateX(-5px);
        }
    </style>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
	<div class="container">
        <h2><i class="fas fa-calendar-day icon"></i>Weekly Tasks/Hours Bar Chart for <%= username %></h2>
        <canvas id="weeklyChart" width="400" height="400"></canvas>
        <a href="dashboard.jsp"><i class="fas fa-arrow-left icon"></i>Back to Dashboard</a>
        <div id="error-message" class="error-message"></div>
    </div>
    <script>
        fetch('WeeklyChartServlet')
        .then(response => response.json())
        .then(data => {
            const ctx = document.getElementById('weeklyChart').getContext('2d');
            new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: data.labels,
                    datasets: [{
                        label: 'Tasks/Hours',
                        data: data.data,
                        backgroundColor: 'rgba(54, 162, 235, 0.2)',
                        borderColor: 'rgba(54, 162, 235, 1)',
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
            document.querySelector('body').innerHTML += '<p class="error-message">Error fetching data for the chart.</p>';
        });
    </script>
    <div class="back-link">
        <a href="dashboard.jsp"><i class="fas fa-arrow-left"></i>Back to Dashboard</a>
    </div>
</body>
</html>
