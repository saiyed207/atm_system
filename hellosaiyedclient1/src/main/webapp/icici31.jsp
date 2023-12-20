<%@ page import="java.io.IOException" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="javax.servlet.ServletException" %>
<%@ page import="javax.servlet.annotation.WebServlet" %>
<%@ page import="javax.servlet.http.HttpServlet" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="javax.servlet.http.HttpServletResponse" %>

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
            <div id="camera">
                <div id="lens"></div>
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
            <div class="screen">
                <div class="welcome">
                    <form method="post">
                        <div style="text-align:center">
                            <img width="120" height="34" src="icici.png"/>
                        </div>
                        <p class="well2" style="color: darkred">Please enter your pin</p>
                        <input type="password" class="pass" maxlength="4" id="pinInput" style="width:90px; height:20px;" name="pin">
                        <button id="btne1" type="submit">Submit</button>
                    </form>
                    <!-- Servlet code starts here -->
                    <%
                        if (request.getMethod().equalsIgnoreCase("POST")) {
                            String enteredPin = request.getParameter("pin");
                            String jdbcUrl = "jdbc:mysql://localhost:3307/icici";
                            String dbUser = "root";
                            String dbPassword = "root";

                            try {
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                Connection connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);
                                String sql = "SELECT * FROM icici.icici_users WHERE pin = ?";
                                PreparedStatement preparedStatement = connection.prepareStatement(sql);
                                preparedStatement.setString(1, enteredPin);
                                ResultSet resultSet = preparedStatement.executeQuery();

                                if (resultSet.next()) {
                                    int id = resultSet.getInt("id");
                                    String accountHolder = resultSet.getString("account_holder");
                                    String accountNumber = resultSet.getString("account_number");
                                    double balance = resultSet.getDouble("balance");
                                    session.setAttribute("balance", balance);
                                    request.setAttribute("id", id);
                                    request.setAttribute("accountHolder", accountHolder);
                                    request.setAttribute("accountNumber", accountNumber);
                                    request.setAttribute("balance", balance);

                                    resultSet.close();
                                    preparedStatement.close();
                                    connection.close();

                                    // Forward the request to your JSP page to display user details
                                    request.getRequestDispatcher("icici41.jsp").forward(request, response);
                                } else {
                                    // PIN is incorrect
                                    out.println("<p style='color:red;'>Incorrect PIN. Please try again.</p>");
                                }
                            } catch (ClassNotFoundException | SQLException e) {
                                e.printStackTrace();
                                // Handle database connection or query errors
                                out.println("<p style='color:red;'>An error occurred. Please try again later.</p>");
                            }
                        }
                    %>
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
            <div id="cash">
                <div id="cash1"></div>
            </div>
            <button id="help1" onclick="arr();">!</button>
            <p id="author">©Designed by Saiyed Afak Ahmed</p>
        </div>
    </div>
</body>
</html>
