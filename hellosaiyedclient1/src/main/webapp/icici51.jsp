<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page session="true" %><!-- Enable session support -->
<%@ page import="com.mysql.cj.jdbc.Driver" %>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.SQLException" %>
<%@ page import="java.io.IOException" %>

<%
try {
    // Register the MySQL JDBC driver class
    Class.forName("com.mysql.cj.jdbc.Driver");

    // Database connection parameters
    String jdbcUrl = "jdbc:mysql://localhost:3307/icici";
    String dbUsername = "root";
    String dbPassword = "root";

    // Get the withdrawal amount entered by the user
    String withdrawAmountStr = request.getParameter("withdrawAmount");

    if (withdrawAmountStr != null && !withdrawAmountStr.isEmpty()) {
        double withdrawAmount = Double.parseDouble(withdrawAmountStr);

        if (withdrawAmount > 0) {
            // Retrieve the user's account holder and balance from the session
            String pinParam = (String) session.getAttribute("pinParam");
            double balance = (Double) session.getAttribute("balance");

            if (balance >= withdrawAmount) {
                double newBalance = balance - withdrawAmount;

                // Update the database with the new balance
                try (Connection connection = DriverManager.getConnection(jdbcUrl, dbUsername, dbPassword)) {
                    String updateQuery = "UPDATE icici_users SET balance = ? WHERE pin = ?";
                    try (PreparedStatement preparedStatement = connection.prepareStatement(updateQuery)) {
                        preparedStatement.setDouble(1, newBalance);
                        preparedStatement.setString(2, pinParam);
                        preparedStatement.executeUpdate();
                        connection.setAutoCommit(true); 
                    }
                }

                // Update the session with the new balance
                session.setAttribute("balance", newBalance);

                // Redirect to icici61.jsp
                response.sendRedirect("icici61.jsp");
            } else {
                // Insufficient balance
                response.sendRedirect("icici61.jsp?insufficientBalance=true");
            }
        } else {
            // Invalid withdrawal amount
            response.sendRedirect("icici61.jsp?invalidAmount=true");
        }
    }
} catch (ClassNotFoundException e) {
    e.printStackTrace();
    // Handle the class not found exception
} catch (NumberFormatException e) {
    // Invalid withdrawal amount
    response.sendRedirect("icici61.jsp?invalidAmount=true");
} catch (SQLException e) {
    e.printStackTrace();
    // Handle the SQL exception
} catch (IOException e) {
    e.printStackTrace();
    // Handle the IO exception
}
%>


<!DOCTYPE html>
<html>
<head>
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <link href='https://fonts.googleapis.com/css?family=Orbitron&text=0123456789:AMP' rel='stylesheet' type='text/css'>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@500&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@500&display=swap" rel="stylesheet">
    <div id="atmmac">
        <div id="outer">
            <div id="camera"><div id="lens"></div>
                <div id="light"></div>
            </div>
            <div id="com">
                <button id="b1"></button>
                <button id="b2"></button>
                <button id="b3"></button>
                <button id="b4"></button>
                <button id="b5"></button>
                <button id="b6"></button>
                <p id="com1"><b>ICICI BANK ATM</b></p>
            </div>
            <div class="screen" style="background-color:darkblue">
                <p  style="margin-top:5px; font-size:20px; text-align:center; color:yellow">Balance:<%= session.getAttribute("balance") %></p>
                <div id="witdrw">
                    <form method="post">
                       <h3 style="color:yellow; margin-top:-3px; text-align:center; font-size:15px;">Enter the amount to withdraw</h3>
                       <input style="text-align:center;"type="number"  name="withdrawAmount">
                       <div style="text-align:center; margin-top:10px">
                           <button style="color:white; background-color:green; border: 1px solid green; border-radius: 5px;"  type="submit">Submit</button>
                       </div>
                    </form>
                </div>
            </div>
        </div>
        <div id="card">
            <div id="indictr">
                <div id="card2"></div>
                <div id="credit"></div>
            </div>
        </div>
        <div id="botto">
            <div id="indicator2"></div>
            <div id="cash"><div id="cash1"></div></div>
            <button id="help1" onclick="arr();">!</button>
            <p id=author>©Designed by Saiyed Afak Ahmed</p>
        </div>
    </div>
</body>
</html>
