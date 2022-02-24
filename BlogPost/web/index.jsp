<%@page import="java.io.PrintWriter"%>
<%@page import="javaServerlet.Member"%>
<!doctype html>

<% int id = 0;%> 
<% Cookie[] ck = request.getCookies();
    Member member = null;
    boolean b = false;

    for (int i = 0; i < ck.length; i++) {
        if (ck[i].getName().equals("id")) {
            b = true;
            id = Integer.parseInt(ck[i].getValue().toString());
        }
    }
    if (b) {
        member = new Member(id);
        //out.println("<div class='user-detail'>"
        //        + "<div class='container'>"
        //        + "<h3>" + member.getName() + "</h3>"
        //        + "</div></div>"
        //);
    } else {
        response.sendRedirect("register.jsp");
    }
%>
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
        <div>
            <%@include file="includes/header.html" %><br><br><br><br>
        </div>
        <div class="user-detail">
            <div class="container">
                <h3>Username : <% if (member != null) {
                        out.println(member.getName());
                    }%></h3>
            </div>
        </div>
        <div class="width-balancer col-xl-8 col-lg-10 col-md-10 col-sm-12">
            <div class="post-create ">
                <div class="mb-3 col-12">
                    <label for="exampleFormControlInput1" class="form-label">Title</label>
                    <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="Title">
                </div>
                <div class="mb-3 col-12">
                    <label for="exampleFormControlTextarea1" class="form-label">Description</label>
                    <textarea class="form-control" id="exampleFormControlTextarea1" rows="5"
                              placeholder="Type something you want."></textarea>
                </div>
                <button type="button" class="btn btn-primary">Publish</button>
            </div>
        </div>
            
        <footer class="text-center text-lg-start bg-light text-muted">

            <section
                class="d-flex justify-content-center justify-content-lg-between p-4 border-bottom" >

            </section>

            <div class="text-center p-4" style="background-color: rgba(0, 0, 0, 0.05);">
                © 2022 Copyright:
                <a class="text-reset fw-bold" href="index.jsp">BlogPost</a>
            </div>

        </footer>
            
        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    </body>
</html>