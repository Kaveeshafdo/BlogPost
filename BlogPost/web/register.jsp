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
        <script type="text/javascript">
            function validate() {
                var name = document.reg_form.name.value;
                if (name == "") {
                    alert("Please Enter Name");
                    document.reg_form.name.focus();
                    return false;
                }
                var pass = document.reg_form.reg_password.value;
                if (pass == "") {
                    alert("Please Enter Password");
                    document.reg_form.reg_password.focus();
                    return false;
                }
                var email = document.reg_form.reg_email.value;
                if (email == "") {
                    alert("Please Enter Email");
                    document.reg_form.reg_email.focus();
                    return false;
                }
                var re_pass = document.reg_form.repassword.value;
                if (pass !== re_pass) {
                    alert("Password Mismatch");
                    document.reg_form.repassword.focus();
                    return false;
                }

            }
        </script>

    </head>

    <body>
        <%@include file="/includes/header.html" %>
        <div>
            <div class="reg-panel">
                <h1 class="form-title">Register</h1>
                <form name="reg_form" action="Register" method="post">
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
                        <input type="submit" value="Register" name="register" onclick="return validate();" class="btn form-control btn-primary"
                               id="subbtn"  data-bs-toggle="modal" data-bs-target="#myModal">
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
                        <input type="submit"  value="log In" class="btn form-control btn-primary" id="subbtn">
                    </div>
                </form>
            </div>
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
<%
    boolean b;
    if (request.getAttribute("isInserted") != null) {
        b = Boolean.parseBoolean(request.getAttribute("isInserted").toString());
        if (b) {
            out.println("<script> alert('Registered Completed'); </script>");
        } else {
            out.println("<script> alert('Registation Failed'); </script>");
        }
    }
    boolean c;
    if (request.getAttribute("isLoged") != null) {
        c = Boolean.parseBoolean(request.getAttribute("isLoged").toString());
        if (!c) {
            out.println("<script> alert('Logging Failed! ,  Incorrect Email or Password'); </script>");
        }
    }
%>