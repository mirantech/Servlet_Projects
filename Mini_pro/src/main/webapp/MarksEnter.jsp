<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
    response.setDateHeader("Expires", 0); // Proxies.
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Marks Entry</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f0f2f5;
            margin: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            animation: fadeIn 2s ease-in-out;
        }
        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }
        header {
            background-color: #4A90E2;
            color: white;
            padding: 10px 0;
            text-align: center;
        }
        footer {
            background-color: #333;
            color: white;
            padding: 10px 0;
            text-align: center;
            margin-top: auto;
        }
        h1 {
            color: #4A90E2;
            text-align: center;
            margin-bottom: 20px;
            animation: slideDown 1s ease-in-out;
        }
        @keyframes slideDown {
            from {
                transform: translateY(-50px);
                opacity: 0;
            }
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }
        .container {
            display: flex;
            align-items: center;
            justify-content: center;
            flex-grow: 1;
            padding: 20px;
            animation: fadeInUp 1s ease-in-out;
            position: relative;
        }
        @keyframes fadeInUp {
            from {
                transform: translateY(50px);
                opacity: 0;
            }
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }
        form {
            background-color: #fff;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            max-width: 600px;
            width: 100%;
            animation: zoomIn 0.5s ease-in-out;
            position: relative;
            z-index: 1;
        }
        @keyframes zoomIn {
            from {
                transform: scale(0.9);
                opacity: 0;
            }
            to {
                transform: scale(1);
                opacity: 1;
            }
        }
        .form-group {
            display: flex;
            flex-direction: column;
            margin-bottom: 20px;
        }
        .form-row {
            display: flex;
            justify-content: space-between;
        }
        .form-group.half {
            width: 48%;
        }
        .form-group.full {
            width: 100%;
        }
        label {
            margin-bottom: 5px;
            font-weight: bold;
            color: #333;
        }
        input[type="text"], input[type="number"] {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            transition: border-color 0.3s ease, box-shadow 0.3s ease, background-color 0.3s ease, transform 0.3s ease;
            text-transform: uppercase;
            background-color: #f9f9f9;
            position: relative;
        }
        input[type="text"]:focus, input[type="number"]:focus {
            border-color: #4A90E2;
            box-shadow: 0 0 5px rgba(74, 144, 226, 0.5);
            outline: none;
            background-color: #e6f7ff;
        }
        input[type="text"]:hover, input[type="number"]:hover {
            background-color: #e0e0e0;
        }
        button {
            display: block;
            width: 100%;
            padding: 15px;
            background-color: #4A90E2;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.3s ease, box-shadow 0.3s ease;
            position: relative;
        }
        button:hover {
            background-color: #357ABD;
        }
        button:active {
            animation: bounce 0.3s;
        }
        @keyframes bounce {
            from {
                transform: translateY(0);
            }
            to {
                transform: translateY(-10px);
            }
        }
        .floating-circles {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            overflow: hidden;
            z-index: 0;
        }
        .circle {
            position: absolute;
            width: 100px;
            height: 100px;
            background-color: rgba(74, 144, 226, 0.2);
            border-radius: 50%;
            animation: float 6s infinite ease-in-out;
        }
        @keyframes float {
            from {
                transform: translateY(0);
            }
            50% {
                transform: translateY(-20px);
            }
            to {
                transform: translateY(0);
            }
        }
        .circle:nth-child(1) {
            top: 10%;
            left: 20%;
            animation-duration: 6s;
        }
        .circle:nth-child(2) {
            top: 50%;
            left: 70%;
            animation-duration: 8s;
        }
        .circle:nth-child(3) {
            top: 80%;
            left: 30%;
            animation-duration: 10s;
        }
    </style>
    <script>
        // Function to redirect to the login page after 10 minutes of inactivity
        function startLogoutTimer() {
            setTimeout(function() { 
                window.location.href = "Admin.html?sessionExpired=true";
            }, 10 * 60 * 1000); // 10 minutes
        }
        
        // Start the logout timer when the page loads
        window.onload = startLogoutTimer;
    </script>
</head>
<body>
    <header>
        <h2>College Portal</h2>
    </header>
    <div class="container">
        <div class="floating-circles">
            <div class="circle"></div>
            <div class="circle"></div>
            <div class="circle"></div>
        </div>
        <form action="Admin_Login" method="post" target="_parent">
            <input name="purpose" placeholder="Text" type="hidden" value="I"/>
            <h1>Student Marks Entry</h1>
            <div class="form-group full">
                <label for="Stu_id">Student Roll:</label>
                <input type="text" id="Stu_id" name="Stu_id" required>
            </div>
            <div class="form-row">
                <div class="form-group half">
                    <label for="tam">Tamil:</label>
                    <input type="number" id="tam" name="tam" required>
                </div>
                <div class="form-group half">
                    <label for="eng">English:</label>
                    <input type="number" id="eng" name="eng" required>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group half">
                    <label for="mat">Maths:</label>
                    <input type="number" id="mat" name="mat" required>
                </div>
                <div class="form-group half">
                    <label for="sci">Science:</label>
                    <input type="number" id="sci" name="sci" required>
                </div>
            </div>
            <div class="form-group full">
                <label for="ss">Social Science:</label>
                <input type="number" id="ss" name="ss">
            </div>
            <button type="submit">SUBMIT</button>
        </form>
    </div>
    <footer>
        <p>&copy; 2024 College Portal. All rights reserved.</p>
    </footer>
</body>
</html>
