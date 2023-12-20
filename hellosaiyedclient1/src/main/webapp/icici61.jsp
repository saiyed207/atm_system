<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page session="true" %><!-- Enable session support -->

<!DOCTYPE html>
<html>
    <head>
    
        <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
     
      <link rel="stylesheet" href="style.css">
    </head>
    <body>
    
  
  <!--   -->
    
    <link href='https://fonts.googleapis.com/css?family=Orbitron&text=0123456789:AMP' rel='stylesheet' type='text/css'>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@500&display=swap" rel="stylesheet">
    
    
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@500&display=swap" rel="stylesheet">
    <div id="atmmac">
    
    <div id="outer">
    <div id="camera"><div id="lens"></div>
        <div id="light"></div>
    </div>
    <div id="com">
    
        <button id="b1" ></button>
        <button id="b2"></button>
        <button id="b3"></button>
        <button id="b4"></button>
        <button id="b5"></button>
        <button id="b6"></button>




        
    <p id="com1"><b>ICICI BANK ATM</b></p></div>
        <div class="screen" style="background-color:lightred">
        
          
             <div id="result">
        <div style="text-align:center">
                    <img width="120" height="34" src="icici.png"/>
                    </div><br>
          <p style="color:darkred; font-size:20px; margin:6px;">Remaining Amount: <%= session.getAttribute("balance") %> </p>
          <p id="wdt3"></p>
        
          
          <center> <button id="back6">Back</button></center>
          </div>





       
        
        
        
    </div>     
        </div>
        <div id="card">
        <div id="indictr">
       
            <div id="card2">
                 
                 </div>
                 
                 <div id="credit"></div>
            </div>
            </div>
        </div>
        <div id="botto">
        
          <div id="indicator2"> </div> <div id="cash"><div id="cash1"></div></div>
          
            <button id="help1" onclick="arr();">!</button>       
           <p id=author>©Designed by Saiyed Afak Ahmed</p>
        </div>
       </div>
       
        
       <script>
        // Add this JavaScript code to redirect after 3 seconds
        setTimeout(function() {
            window.location.href = "icici7.jsp";
        }, 2000); // 3000 milliseconds (3 seconds)
    </script>
             
    </body>
</html>