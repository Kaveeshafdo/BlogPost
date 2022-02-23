<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
       

        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="css/style.css">
        <title>Register</title>
    </head>

    <body>
        <%@include file="/includes/header.html" %>
        <div class="reg-panel">
            <h1 class="form-title">Register</h1>
            <form action="Register" method="post">
                <div class="mb-3">
                    <label for="name" class="form-label">Name</label>
                    <input type="text" name="name" class="form-control" id="name">
                </div>
                <div class="mb-3">
                    <label for="reg_email" class="form-label">Email</label>
                    <input type="email" name="reg_email" class="form-control" id="reg_email">
                </div>
                <div class="mb-3">
                    <label for="reg_password" class="form-label">Password</label>
                    <input type="password" name="reg_password" class="form-control" id="reg_password">
                </div>
                <div class="mb-3">
                    <label for="repassword" class="form-label">Repeat Password</label>
                    <input type="password" name="repassword" class="form-control" id="repassword">
                </div>
                <div class="mb-3">
                    <input type="submit" value="Register" name="register" class="btn form-control btn-primary" id="subbtn">
                </div>
            </form>
        </div>
        <div class="divider">
        </div>
        <div class="log-panel">
            <h1 class="form-title">Login</h1>
            <form action="Login" method="post">
                <div class="mb-3">
                    <label for="log_email" class="form-label">Email</label>
                    <input type="email" name="log_email" class="form-control" id="log_email">
                </div>
                <div class="mb-3">
                    <label for="log_password" class="form-label">Password</label>
                    <input type="password" name="log_password" class="form-control" id="log_password">
                </div>
                <div class="mb-3">
                    <input type="submit" name="register" value="log In" class="btn form-control btn-primary" id="subbtn">
                </div>
            </form>
        </div>


        <!-- Optional JavaScript; choose one of the two! -->

        <!-- Option 1: Bootstrap Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>

        <!-- Option 2: Separate Popper and Bootstrap JS -->
        <!--
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
        -->
    </body>

</html>