<%@page import="java.io.PrintWriter"%>
<%@page import="javaServerlet.Member"%>
<!doctype html>

<% int id = 0;%> 
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link rel="stylesheet" href="css/style.css">
        <title>Blog POST</title>
    </head>
    <body>

        <%@include file="includes/header.html" %><br><br><br><br>

        <% Cookie[] ck = request.getCookies();        
          Member member;
            boolean b = false;
           
            for (int i = 0; i < ck.length; i++) {
                if (ck[i].getName().equals("id")) {
                    b = true;
                    id = Integer.parseInt(ck[i].getValue().toString());
                }
            }
            if(b){
               member = new Member(id);
             out.println("<div class='user-detail'>"
                     + "<div class='container'>" 
                     + "<h3>"+member.getName()+"</h3>"
                     + "</div></div>"       
             );
            }else{
            response.sendRedirect("register.jsp");
            }
        %>
        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    </body>
</html>