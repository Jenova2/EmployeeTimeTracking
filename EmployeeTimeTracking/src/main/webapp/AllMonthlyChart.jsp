<%@page import="jakarta.servlet.http.HttpSession"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session == null || session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
    } else {
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
            background-color: #f9f9f9;
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
        }
        canvas {
            max-width: 100%;
            height: auto;
            border: 2px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background: #fff;
            transition: box-shadow 0.3s ease;
        }
        canvas:hover {
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2);
        }
        .chart-container {
            max-width: 800px;
            width: 100%;
        }
        .back-link {
            margin-top: 20px;
            font-size: 18px;
            color: #3498db;
            text-decoration: none;
            transition: color 0.3s ease, transform 0.3s ease;
        }
        .back-link:hover {
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
    <div class="chart-container">
        <h2><i class="fas fa-chart-bar icon"></i>Monthly Tasks/Hours Bar Chart</h2>
        <canvas id="ALLMonthlyChart" width="400" height="400"></canvas>
        <a href="dashboard.jsp" class="back-link"><i class="fas fa-arrow-left icon"></i>Back to Dashboard</a>
    </div>
    <script>
        fetch('AllMonthlyChartServlet')
        .then(response => response.json())
        .then(data => {
            console.log("Data received from servlet:", data); // Debugging log

            const ctx = document.getElementById('ALLMonthlyChart').getContext('2d');

            const labels = new Set();
            const datasetMap = {};

            // Process userTasks to get labels and datasetMap
            for (const [username, userData] of Object.entries(data.userTasks)) {
                datasetMap[username] = [];
                userData.labels.forEach((day, index) => {
                    labels.add(day);
                    datasetMap[username].push({
                        x: day,
                        y: userData.data[index]
                    });
                });
            }

            // Convert labels Set to an array and sort it
            const sortedLabels = Array.from(labels).sort();

            // Prepare datasets
            const datasets = Object.keys(datasetMap).map(username => ({
                label: username,
                data: datasetMap[username].map(point => point.y),
                backgroundColor: 'rgba(75, 192, 192, 0.2)',
                borderColor: 'rgba(75, 192, 192, 1)',
                borderWidth: 1
            }));

            new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: sortedLabels,
                    datasets: datasets
                },
                options: {
                    scales: {
                        x: {
                            type: 'category'
                        },
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });
        })
        .catch(error => {
            console.error("Error fetching data:", error); // Debugging log
        });
    </script>
</body>
</html>
<%
    }
%>
