<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
    response.setDateHeader("Expires", 0); // Proxies.
   
%>
<!DOCTYPE html>
<html>
<head>
    <title>Logout</title>
    <style>
        body {
            text-align: center;
            background-color: #f0f0f0;
            font-family: Arial, sans-serif;
            color: #333;
            margin: 0;
            padding: 0;
        }
        .message {
            background-color: #4CAF50;
            color: white;
            padding: 20px;
            border-radius: 5px;
        }
        p {
            margin: 15px;
        }
        .footer {
            position: absolute;
            bottom: 10px;
            width: 100%;
            text-align: center;
            font-size: 12px;
            color: #999;
        }
    </style>
</head>

<body>
   <%
   HttpSession hs=request.getSession();
	hs.getAttribute("u_name");
	hs.invalidate();
    %>
    <div class="container">
        <div class="message">
            <h1>Logged out successfully!</h1>
            <p>Thank you for using our services. You have been logged out of your account.</p>
            <p>To log in again, please <a href="Admin.html" style="color: white; text-decoration: underline;">click here</a>.</p>
        </div>
    </div>
    <div class="footer">
        <p>&copy; 2024 College Name. All rights reserved.</p>
    </div>
</body>
</html>
