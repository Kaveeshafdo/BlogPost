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
    <h1>Register</h1>
<tr><td id="name" >Name:</td><td><input type="text" name="name"></td></tr>
<tr><td>Email:</td><td><input type="text" name="reg_email"></td></tr>
<tr><td>Password:</td><td><input type="password" name="reg_password"></td></tr>
<tr><td>Confirm Password:</td><td><input type="password" name="repassword"></td></tr>
<tr><td></td><td><input type="submit" value="submit" name="register" id="subbtn" ></td></tr>
</table>
    <h1>Login</h1>
    <label>Email:</label><input type="text" name="log_email"><br>
    <label>Password:</label><input type="password" name="log_password"><br>
    <input type="submit" value="submit" name="register" id="subbtn" >
</form>
</body>
</html>