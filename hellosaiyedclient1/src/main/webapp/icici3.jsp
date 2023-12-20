<%@ page import="client.Afak, client.AfakimplService" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
                        <button id="btne1">Submit</button>
                    </form>
                    <%
            String pinParam = request.getParameter("pin");

            if (pinParam != null && !pinParam.isEmpty()) {
                try {
                    // Create an instance of the web service client
                    AfakimplService service = new AfakimplService();
                    Afak port = service.getAfakimplPort();

                    // Call the getUserInfoByPin method based on user input PIN
                    String userInfoResponse = port.getUserInfoByPin(pinParam);

                    // Extract account_holder and balance from the response
                    String accountHolder = ""; // Initialize as empty string
                    double balance = 0.0; // Initialize as 0.0
                    String errorMessage = null;

                    // Parse the response to extract account_holder and balance
                    if (userInfoResponse != null && !userInfoResponse.isEmpty()) {
                        String[] userInfoParts = userInfoResponse.split(",");
                        for (String part : userInfoParts) {
                            part = part.trim();
                            if (part.startsWith("Account Holder: ")) {
                                accountHolder = part.substring("Account Holder: ".length());
                            } else if (part.startsWith("Balance: ")) {
                                balance = Double.parseDouble(part.substring("Balance: ".length()));
                            }
                        }
                    } else {
                        errorMessage = "User not found.";
                    }

                    // Check if PIN verification succeeded
                    if (accountHolder != null && !accountHolder.isEmpty()) {
                        // Store data in session attributes
                        session.setAttribute("accountHolder", accountHolder);
                        session.setAttribute("pinParam", pinParam);
                        session.setAttribute("balance", balance);

                        // Redirect to the next page
                        response.sendRedirect("icici4.jsp");
                    } else {
                        
            %>
            <p style="color: red; font-size:10px; margin-top:30px; text-align:center">Incorrect Pin!!!</p>
            <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
            %>

            <p>An error occurred while fetching data.</p>

            <%
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










