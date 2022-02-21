<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="css/style.css">
<title>BlogPost</title>
</head>
<body>
<form action="Register" method="post">
<table>
<tr><td id="name" >Name:</td><td><input type="text" name="name"></td></tr>
<tr><td>Email:</td><td><input type="text" name="email"></td></tr>
<tr><td>Password:</td><td><input type="password" name="password"></td></tr>
<tr><td>Confirm Password:</td><td><input type="password" name="repassword"></td></tr>
<tr><td></td><td><input type="submit" value="submit" name="register" id="subbtn" ></td></tr>
</table>
</form>
</body>
</html>