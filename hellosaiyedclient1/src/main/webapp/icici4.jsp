<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="ISO-8859-1">
    <title>ICICI Bank ATM</title>
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <link rel="stylesheet" href="style.css">
</head>

<body>
    <link href='https://fonts.googleapis.com/css?family=Orbitron&text=0123456789:AMP' rel='stylesheet' type='text/css'>
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
            <div class="screen" style="background-color: darkblue;">
                <div id="pincrt">
                    <div id="success">
                        <button id="wdr" onclick="redirectToWithdraw()">WITHDRAW</button>
                        <button id="mst">DEPOSIT</button>
                        <button id="cpin">CHANGE PIN</button>
                        <button id="det">DETAILS</button>

                        <p id="user23" style="margin-top: -10px; color: yellow; font-size: 20px; margin-left: -20px;">Balance: <%= session.getAttribute("balance") %></p>
                        <p id="user23" style="color: yellow; font-size: 20px; margin-left: -40px;">Welcome: <%= session.getAttribute("accountHolder") %><br> </p>
                    </div>
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

    <script>
        function redirectToWithdraw() {
            window.location.href = "icici5.jsp";
        }
    </script>
</body>

</html>
