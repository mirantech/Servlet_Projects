<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
    response.setDateHeader("Expires", 0); // Proxies.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Marks</title>
<style>
    body {
        background-image: url("39.jpg");
        background-size: cover;
        font-family: Arial, sans-serif;
        color: #333;
    }
    table {
        margin-left: auto;
        margin-right: auto;
        margin-top: 10%;
        border-width: 1px;
        border-style: solid;
        border-color: #ddd;
        border-collapse: collapse;
        width: 60%;
        background-color: rgba(255, 255, 255, 0.9);
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    th, td {
        border-width: 1px;
        padding: 10px;
        border-style: solid;
        border-color: #ddd;
        text-align: left;
    }
    th {
        background-color: #f2f2f2;
        color: #333;
    }
    td {
        background-color: #fff;
    }
    .greenclass, .pass {
        background-color: green;
        color: black;
    }
    .redclass, .fail {
        background-color: red;
        color: black;
    }
    .button-container {
        text-align: center;
        margin-top: 20px;
    }
    button {
        padding: 10px 20px;
        background-color: #007bff;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
        transition: background-color 0.3s;
        margin: 5px;
    }
      .error-message {
        text-align: center;
        padding: 20px;
        background-color: #ffdddd;
        color: #d8000c;
        border: 1px solid #d8000c;
        border-radius: 5px;
        margin: 20% auto;
        width: 50%;
    }
    button:hover {
        background-color: #0056b3;
    }
    @media print{
        .button-container {
            display: none;
        }
    }
</style>
<script>
    function printTable() {
        window.print();
    }
</script>
</head>
<body>

<form action="Logout.jsp">
    <table>
        <%
    HttpSession htp = request.getSession(false);
    if (htp == null || htp.getAttribute("u_name") == null) {
        response.sendRedirect("Logout.jsp");
        return;
    }

            // Retrieve session attributes and convert them to integers
            int tam = (int) htp.getAttribute("tam");
            int eng = (int) htp.getAttribute("eng");
            int mat = (int) htp.getAttribute("mat");
            int sci = (int) htp.getAttribute("sci");
            int ss = (int) htp.getAttribute("ss");

            int total = tam + eng + mat + sci + ss;
            double avg = total / 5.0;
            String status = (tam >= 35 && eng >= 35 && mat >= 35 && sci >= 35 && ss >= 35) ? "Pass" : "Fail";
            String overallGrade = getGrade((int) avg);
        %>

        <%! 
            String getGrade(int marks) {
                if (marks >= 90) {
                    return "A";
                } else if (marks >= 80) {
                    return "B";
                } else if (marks >= 70) {
                    return "C";
                } else if (marks >= 60) {
                    return "D";
                } else {
                    return "F";
                }
            }
        %>

        <tr>
            <th>Roll No</th>
            <td colspan="2"><%= htp.getAttribute("Roll_No") %></td>
        </tr>
        <tr>
            <th>Name</th>
            <td colspan="2"><%= htp.getAttribute("Name") %></td>
        </tr>
        <tr>
            <th>Subject</th>
            <th>Marks</th>
            <th>Grade</th>
        </tr>
        <tr>
            <th>Tamil</th>
            <td><%= tam %></td>
            <td><%= getGrade(tam) %></td>
        </tr>
        <tr>
            <th>English</th>
            <td><%= eng %></td>
            <td><%= getGrade(eng) %></td>
        </tr>
        <tr>
            <th>Maths</th>
            <td><%= mat %></td>
            <td><%= getGrade(mat) %></td>
        </tr>
        <tr>
            <th>Science</th>
            <td><%= sci %></td>
            <td><%= getGrade(sci) %></td>
        </tr>
        <tr>
            <th>Social</th>
            <td><%= ss %></td>
            <td><%= getGrade(ss) %></td>
        </tr>
        <tr>
            <th>Total Marks</th>
            <td><%= total %></td>
            <td></td>
        </tr>
        <tr>
            <th>Average Marks</th>
            <td><%= avg %></td>
            <td><%= overallGrade %></td>
        </tr>
        <tr>
            <th>Status</th>
            <td class="<%= status.equals("Pass") ? "pass" : "fail" %>"><%= status %></td>
            <td></td>
        </tr>
    </table>
    <div class="button-container">
        <button type="button" class="print-button" onclick="printTable()">Print</button>
        <button type="submit" class="logout-button">Logout</button>
    </div>
</form>
</body>
</html>
