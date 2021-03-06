/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javaServerlet;

import java.io.IOException;
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
 * @author Jamit
 */
@WebServlet(name = "CreateComment", urlPatterns = {"/CreateComment"})
public class CreateComment extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            
            int uid = Integer.parseInt(req.getParameter("userId").toString());
            int pid = Integer.parseInt(req.getParameter("postId").toString());
            String comment = req.getParameter("comment").toString();
            String query = "insert into comment(Content,UserId,PostId) values (?,?,?)";
            PreparedStatement ps  = DbConnect.connect().prepareStatement(query);
            ps.setString(1, comment);
            ps.setInt(2, uid);
            ps.setInt(3, pid);
            ps.executeUpdate();
            req.setAttribute("postId", pid);
            req.setAttribute("userId", uid);
            RequestDispatcher rd = req.getRequestDispatcher("inside.jsp");
            rd.forward(req, resp);
            resp.sendRedirect("inside.jsp");
        } catch (SQLException ex) {
            Logger.getLogger(CreateComment.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
     @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}
