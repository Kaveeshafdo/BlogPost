<%-- 
    Document   : inside
    Created on : Feb 24, 2022, 11:34:36 AM
    Author     : Kaveesha FDO
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="javaServerlet.DbConnect"%>
<%@page import="javaServerlet.Member"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% Member member = new Member();
    int pid = Integer.parseInt(request.getParameter("postId").toString());
    int uid = Integer.parseInt(request.getParameter("userId").toString());
    String title = null;
    String desc = null;
    int publisherID = 0;
    try {
        ResultSet rs = DbConnect.getDb("SELECT Name FROM Users WHERE Id='" + uid + "'");
        if (rs.next()) {
            String name = rs.getString("Name");
            member.setName(name);
        }
        ResultSet postData = DbConnect.getDb("SELECT * FROM Post WHERE Id='" + pid + "'");
        if (postData.next()) {
            title = postData.getString("Title");
            desc = postData.getString("Description");
            publisherID = postData.getInt("UserId");
        }
    } catch (SQLException ex) {
        ex.printStackTrace();
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
                                        <textarea class="form-control comment-box" id='commentBox' rows="4" placeholder="Join the discussion and leave a comment!" name="comment"></textarea>
                                        <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                                            <input type="submit" class="btn btn-outline-success comment-button" value="Comment">
                                        </div>
                                    </form>
                                    <%
                                        String query = "SELECT [blog].[dbo].[Comment].id, [blog].[dbo].[Comment].UserId ,[Content] ,[UserId] ,[PostId], [Name]"
                                                + " FROM [blog].[dbo].[Comment] inner join [blog].[dbo].[Users] on [blog].[dbo].[Comment].UserId=[blog].[dbo].[Users].Id where PostId=" + pid;
                                        ResultSet rs = DbConnect.getDb(query);
                                        while (rs.next()) {
                                            out.print("<div class='commenter'>" + rs.getString("Name") + "</div>"
                                                    + "<hr class='comment-div-hr'> "
                                                    + "<div class='comment-content'>" + rs.getString("Content")
                                                    + "</div>");

                                            out.println("<form class='mb-4' action='CreateReply' method='post'> "
                                                    + "<input type='hidden' name='commentId' value='" + rs.getInt("id") + "'> "
                                                    + "<input type='hidden' name='postId' value='" + pid + "'> "
                                                    + "<input type='hidden' name='userId' value='" + uid + "'> <hr class='comment-div-hr'>"
                                                    + "<div class='reply-box'>"
                                                    + " <textarea class='form-control comment-box' id='commentBox' rows='1' placeholder='Join the discussion and leave a comment!' name='reply'></textarea>"
                                                    + "<div class='d-grid gap-2 d-md-flex justify-content-md-end'>"
                                                    + "<input type='submit' class='btn btn-outline-success comment-button' value='Reply'>"
                                                    + "</div></div>"
                                                    + "</form>");
                                            String replyquery = "SELECT [blog].[dbo].[Reply].[Id] ,[Content] ,[CommentId] ,[UserId], Name"
                                                    + " FROM [blog].[dbo].[Reply] inner join [blog].[dbo].[Users] on [blog].[dbo].[Reply].UserId=[blog].[dbo].[Users].Id WHERE CommentId= " + rs.getInt("id");
                                            ResultSet replyrs = DbConnect.getDb(replyquery);
                                            while (replyrs.next()) {
                                                out.print("<div class='reply'><div class='commenter'>" + replyrs.getString("Name") + "</div>"
                                                        + "<hr class='comment-div-hr'> "
                                                        + "<div class='comment-content'>" + replyrs.getString("Content")
                                                        + "</div></div>");
                                            }

                                        }
                                    %>
                                </div>
                            </div>
                        </section>


                    </div>
                    <!-- Side widgets-->

                </div>
            </div>
        </div>
        <script>
            function setForReply() {
                document.getElementById("commentBox").focus();
            }
        </script>
    </body>
</html>
