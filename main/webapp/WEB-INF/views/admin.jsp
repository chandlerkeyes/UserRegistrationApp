<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jstl/sql" %>
<%--
  Created by IntelliJ IDEA.
  User: chand
  Date: 10/12/2017
  Time: 10:59 PM
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin</title>
    <!-- CSS TEMPLATE -->
    <style>
        @import url(https://fonts.googleapis.com/css?family=Open+Sans:300,400,700);
        body {
            font-family: 'Open Sans', sans-serif;
            font-weight: 300;
            line-height: 1.42em;
            color:#A7A1AE;
            background-color:#1F2739;
        }

        h1 {
            font-size:3em;
            font-weight: 300;
            line-height:1em;
            text-align: center;
            color: #4DC3FA;
        }

        h2 {
            font-size:1em;
            font-weight: 300;
            text-align: center;
            display: block;
            line-height:1em;
            padding-bottom: 2em;
            color: #FB667A;
        }

        h2 a {
            font-weight: 700;
            text-transform: uppercase;
            color: #FB667A;
            text-decoration: none;
        }

        .blue { color: #185875; }
        .yellow { color: #FFF842; }

        .container th h1 {
            font-weight: bold;
            font-size: 1em;
            text-align: left;
            color: #185875;
        }

        .container td {
            font-weight: normal;
            font-size: 1em;
            -webkit-box-shadow: 0 2px 2px -2px #0E1119;
            -moz-box-shadow: 0 2px 2px -2px #0E1119;
            box-shadow: 0 2px 2px -2px #0E1119;
        }

        .container {
            text-align: left;
            overflow: hidden;
            width: 80%;
            margin: 0 auto;
            display: table;
            padding: 0 0 8em 0;
        }

        .container td, .container th {
            padding-bottom: 2%;
            padding-top: 2%;
            padding-left:2%;
        }

        /* Background-color of the odd rows */
        .container tr:nth-child(odd) {
            background-color: #323C50;
        }

        /* Background-color of the even rows */
        .container tr:nth-child(even) {
            background-color: #2C3446;
        }

        .container th {
            background-color: #1F2739;
        }

        .container td:first-child { color: #FB667A; }

        .container tr:hover {
            background-color: #464A52;
            -webkit-box-shadow: 0 6px 6px -6px #0E1119;
            -moz-box-shadow: 0 6px 6px -6px #0E1119;
            box-shadow: 0 6px 6px -6px #0E1119;
        }

        .container td:hover {
            background-color: #FFF842;
            color: #403E10;
            font-weight: bold;

            box-shadow: #7F7C21 -1px 1px, #7F7C21 -2px 2px, #7F7C21 -3px 3px, #7F7C21 -4px 4px, #7F7C21 -5px 5px, #7F7C21 -6px 6px;
            transform: translate3d(6px, -6px, 0);

            transition-delay: 0s;
            transition-duration: 0.4s;
            transition-property: all;
            transition-timing-function: line;
        }

        @media (max-width: 800px) {
            .container td:nth-child(4),
            .container th:nth-child(4) { display: none; }
        }
    </style>
</head>
<body>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>


<%--<form method="get">--%>
    <h1>Registered Users</h1>
    <table class="container">
        <thead>
        <tr>
            <th><h1>First Name</h1></th>
            <th><h1>Last Name</h1></th>
            <th><h1>Address1</h1></th>
            <th><h1>Address2</h1></th>
            <th><h1>City</h1></th>
            <th><h1>State</h1></th>
            <th><h1>Zip</h1></th>
            <th><h1>Country</h1></th>
            <th><h1>Date</h1></th>
        </tr>
        </thead>
        <!-- Loops through each row and places the data into the html table -->
        <%
            try {
                Class.forName("com.mysql.jdbc.Driver");
                String url = "jdbc:mysql://registration.cmgiitqbyhub.us-east-2.rds.amazonaws.com:3306/registration";
                String username = "root";
                String password = "brokk1234567";
                String query = "SELECT * FROM userregistration ORDER BY date DESC;";
                Connection conn = DriverManager.getConnection(url, username, password);
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(query);
                while (rs.next()) {
        %>
        <tbody>
        <tr>
            <td class="text-left"><%=rs.getString("firstName") %>
            </td>
            <td class="text-left"><%=rs.getString("lastName") %>
            </td>
            <td class="text-left"><%=rs.getString("address1") %>
            </td>
            <td class="text-left"><%=rs.getString("address2") %>
            </td>
            <td class="text-left"><%=rs.getString("city") %>
            </td>
            <td class="text-left"><%=rs.getString("state") %>
            </td>
            <td class="text-left"><%=rs.getString("zip") %>
            </td>
            <td class="text-left"><%=rs.getString("country") %>
            </td>
            <td class="text-left"><%=rs.getString("date") %>
            </td>
        </tr>
        </tbody>

        <%

            }
        %>
    </table>
    <%
            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
<%--</form>--%>
</body>
</html>
