<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Information</title>
</head>
<body>
    <h1>User Information</h1>
    
    <div>
        <p><strong>Account Holder:</strong> <%= request.getParameter("accountHolder") %></p>
        <p><strong>Balance:</strong> <%= request.getParameter("balance") %></p>
    </div>
</body>
</html>
