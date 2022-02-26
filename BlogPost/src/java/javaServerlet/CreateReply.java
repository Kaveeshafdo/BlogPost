/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javaServerlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Kaveesha FDO
 */
@WebServlet(name = "CreateReply", urlPatterns = {"/CreateReply"})
public class CreateReply extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        try {
            
            int commentId = Integer.parseInt(req.getParameter("commentId").toString());
            int userId = Integer.parseInt(req.getParameter("userId").toString());  
            int postId = Integer.parseInt(req.getParameter("postId").toString());       
            String replyContent = req.getParameter("reply").toString();
            String query = "insert into Reply(Content,CommentId,UserId) values (?,?,?)";
            PreparedStatement ps  = DbConnect.connect().prepareStatement(query);
            ps.setString(1, replyContent);
            ps.setInt(2, commentId);
            ps.setInt(3, userId);
            ps.executeUpdate();
            req.setAttribute("postId", postId);
            req.setAttribute("userId", userId);
            RequestDispatcher rd = req.getRequestDispatcher("inside.jsp");
            rd.forward(req, resp);
            resp.sendRedirect("inside.jsp");
        } catch (SQLException ex) {
            Logger.getLogger(CreateComment.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
}
