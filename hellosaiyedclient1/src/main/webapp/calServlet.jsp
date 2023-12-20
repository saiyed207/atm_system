<%@ page import="client.Afak, client.AfakimplService" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Hello World Client</title>
</head>
<body>
    <h1>Hello World Client</h1>
    
    <form method="post">
        Enter PIN: <input type="text" name="pin">
        <input type="submit" value="Fetch Data">
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
                }

    %>

    <p>Account Holder: <%= accountHolder %></p>
    <p>Balance: <%= balance %></p>

    <%
            } catch (Exception e) {
                e.printStackTrace();
    %>
    
    <p>An error occurred while fetching data.</p>
    
    <%
            }
        }
    %>
</body>
</html>
