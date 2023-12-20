<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
    <style>
     .icici {
                z-index: 999; /* You can adjust this value as needed */
                position: relative;
                margin-left:80%;
                text-align:center;
               
                cursor: pointer;
            transition: all 0.5s ease;
                
            }
    </style>
        <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
     
      <link rel="stylesheet" href="style.css">
    </head>
    <body>
    <div class="icici" id="card1" onclick="insertIntoCredit('card1')" style="width: 50px; height: 60px; background-color: green; color: white">
    <button   onclick="speakWelcomeMessage1()" style="color:white; height:100%; width:100%; background-color:darkred">ICICI</button></div>
    <div class="icici" id="card2" onclick="insertIntoCredit('card2')" style="width: 50px; height: 60px; background-color: blue; color: white ;margin-top:70px; border:none" >
    <button   onclick="speakWelcomeMessage()" style="color:white; height:100%; width:100%; background-color:blue">SBI</button></div>
  
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
        <div class="screen">
        <div style="text-align:center">
                    <img width="120" height="34" src="icici.png"/>
                    </div>
          
            <div  style="background-color:lightblue">
             <p id="final3" style="color:red">Enter your card</p>
           
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
        // Function to speak a welcome message in Hindi
        function speakWelcomeMessage() {
            var message = new SpeechSynthesisUtterance("I.C.I.C.I. bank mai aapka swagat hai. Apka S.B.I. card process hoa raha hai");
            // Set the voice to an Indian Hindi voice (adjust as needed)
            var voices = window.speechSynthesis.getVoices();
            message.voice = voices.find(function(voice) {
                return voice.lang === "hi-IN";
            });
            window.speechSynthesis.speak(message);
        }

        // Wait for the document to be fully loaded
        $(document).ready(function() {
            speakWelcomeMessage();
        });
    </script>
    <script>
        // Function to speak a welcome message in Hindi
        function speakWelcomeMessage1() {
            var message = new SpeechSynthesisUtterance("I.C.I.C.I. bank mai aapka swagat hai. Apka I.C.I.C.I. card process hoa raha hai");
            // Set the voice to an Indian Hindi voice (adjust as needed)
            var voices = window.speechSynthesis.getVoices();
            message.voice = voices.find(function(voice) {
                return voice.lang === "hi-IN";
            });
            window.speechSynthesis.speak(message);
        }

        // Wait for the document to be fully loaded
        $(document).ready(function() {
            speakWelcomeMessage();
        });
    </script>
       
       <script>
       function insertIntoCredit(cardId) {
           var cardElement = document.getElementById(cardId);
           var creditElement = document.getElementById('credit');
           
           // Calculate the position of the credit area
           var creditRect = creditElement.getBoundingClientRect();
           var cardRect = cardElement.getBoundingClientRect();
           
           // Calculate the position difference
           var deltaX = creditRect.left - cardRect.left;
           var deltaY = creditRect.top - cardRect.top;
           
           // Apply a CSS transform to move the card to the credit area
           cardElement.style.transform = `translate(${deltaX}px, ${deltaY}px)`;
           
           // After the animation is complete, insert the card into the credit area
           setTimeout(function () {
               cardElement.style.opacity = 0; // Optionally fade out the card
               creditElement.appendChild(cardElement);
               
               // Redirect based on cardId
               if (cardId === 'card1') {
                   // Redirect to icici.jsp
                   setTimeout(function () {
                       window.location.href = 'icici1.jsp';
                   }, 500); // Adjust the delay as needed
               } else if (cardId === 'card2') {
                   // Redirect to icici1.jsp
                   setTimeout(function () {
                       window.location.href = 'icici.jsp';
                   }, 500); // Adjust the delay as needed
               }
           }, 500); // Adjust the delay as needed
       }
   </script>



 

         
             
    </body>
</html>