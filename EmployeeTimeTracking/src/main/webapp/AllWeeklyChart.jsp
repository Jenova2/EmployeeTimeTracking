<!DOCTYPE html>
<html>
<head>
    <title>Weekly Tasks/Hours Bar Chart</title>
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
        h2 {
            color: #2c3e50;
            margin-bottom: 20px;
            font-size: 24px;
            font-weight: bold;
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
            margin: 20px;
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
        <h2><i class="fas fa-calendar-week icon"></i>Weekly Tasks/Hours Bar Chart</h2>
        <canvas id="AllWeeklyChart" width="400" height="400"></canvas>
        <a href="dashboard.jsp" class="back-link"><i class="fas fa-arrow-left icon"></i>Back to Dashboard</a>
    </div>
    <script>
        fetch('AllWeeklyChartServlet')
        .then(response => response.json())
        .then(data => {
            const ctx = document.getElementById('AllWeeklyChart').getContext('2d');

            const labels = [];
            const datasetMap = {};

            data.datasets.forEach(item => {
                if (!labels.includes(item.day)) {
                    labels.push(item.day);
                }
                if (!datasetMap[item.username]) {
                    datasetMap[item.username] = [];
                }
                datasetMap[item.username].push({
                    x: item.day,
                    y: item.duration
                });
            });

            const datasets = Object.keys(datasetMap).map(username => ({
                label: username,
                data: datasetMap[username],
                backgroundColor: 'rgba(54, 162, 235, 0.2)',
                borderColor: 'rgba(54, 162, 235, 1)',
                borderWidth: 1
            }));

            new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: labels,
                    datasets: datasets
                },
                options: {
                    scales: {
                        x: {
                            title: {
                                display: true,
                                text: 'Days of the Week'
                            }
                        },
                        y: {
                            title: {
                                display: true,
                                text: 'Hours'
                            },
                            beginAtZero: true
                        }
                    }
                }
            });
        })
        .catch(error => {
            console.error("Error fetching data:", error);
        });
    </script>
</body>
</html>
