<%-- 
    Document   : inside
    Created on : Feb 24, 2022, 11:34:36 AM
    Author     : Kaveesha FDO
--%>

<%@page import="javaServerlet.DbConnect"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="javaServerlet.Member"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% Member member = new Member();
    int pid = Integer.parseInt(request.getParameter("postId").toString());
    int uid = Integer.parseInt(request.getParameter("userId").toString());
    String title = request.getParameter("title").toString();
    String desc = request.getParameter("description").toString();

    ResultSet rs = DbConnect.getDb("SELECT Name FROM Users WHERE Id='" + uid + "'");
    if (rs.next()) {
        String name = rs.getString("Name");
        member.setName(name);

    }
%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/styles.css" rel="stylesheet" />
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <div>
            <%@include file="includes/header.html" %>
        </div><br><br><br><br>
        <div class="user-detail">
            <div class="container">
                <h3>Username : <% if (member != null) {
                        out.println(member.getName());
                    }%></h3>
            </div>
        </div>
        <div class="width-balancer col-xl-8 col-lg-10 col-md-10 col-sm-12">

            <div class="container mt-5">
                <div class="row">
                    <div class="col-lg-8">
                        <!-- Post content-->
                        <article>
                            <!-- Post header-->
                            <header class="mb-4">
                                <!-- Post title-->
                                <h1 class="fw-bolder mb-1"><%=title%></h1>
                                <!-- Post meta content-->   
                            </header>
                            <!-- Preview image figure-->

                            <!-- Post content-->
                            <section class="mb-5">
                                <p class="fs-5 mb-4"><%=desc%></p>                                          

                                <p class="fs-5 mb-4"></p>
                                <p class="fs-5 mb-4"></p>
                            </section>
                        </article>
                        <!-- Comments section-->
                        <section class="mb-5">
                            <div class="card bg-light">
                                <div class="card-body comment-area">
                                    <!-- Comment form-->
                                    <form class="mb-4" action="CreateComment" method="post">
                                        <input type="hidden" name="postId" value="<%=pid%>">
                                        <input type="hidden" name="userId" value="<%=uid%>">
                                        <textarea class="form-control comment-box" rows="4" placeholder="Join the discussion and leave a comment!" name="comment"></textarea>
                                        <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                                            <input type="submit" class="btn btn-outline-success comment-button" value="Comment">
                                        </div>
                                    </form>

                                    <!-- Comment with nested comments-->
                                    <div class="d-flex mb-4">
                                        <!-- Parent comment-->
                                        <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
                                        <div class="ms-3">
                                            <div class="fw-bold">Commenter Name</div>
                                            If you're going to lead a space frontier, it has to be government; it'll never be private enterprise. Because the space frontier is dangerous, and it's expensive, and it has unquantified risks.
                                            <!-- Child comment 1-->
                                            <div class="d-flex mt-4">
                                                <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
                                                <div class="ms-3">
                                                    <div class="fw-bold">Commenter Name</div>
                                                    And under those conditions, you cannot establish a capital-market evaluation of that enterprise. You can't get investors.
                                                </div>
                                            </div>
                                            <!-- Child comment 2-->
                                            <div class="d-flex mt-4">
                                                <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
                                                <div class="ms-3">
                                                    <div class="fw-bold">Commenter Name</div>
                                                    When you put money directly to a problem, it makes a good headline.
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Single comment-->
                                    <div class="d-flex">
                                        <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
                                        <div class="ms-3">
                                            <div class="fw-bold">Commenter Name</div>
                                            When I look at the universe and all the ways the universe wants to kill us, I find it hard to reconcile that with statements of beneficence.
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </div>
                    <!-- Side widgets-->

                </div>
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
    </body>
</html>
