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
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Kaveesha FDO
 */
@WebServlet(name = "CreatePost", urlPatterns = {"/CreatePost"})
public class CreatePost extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String title = request.getParameter("title").toString();
            String description = request.getParameter("description").toString();
            int userId = Integer.parseInt(request.getParameter("userId").toString());

            try {
                PreparedStatement ps = DbConnect.connect().prepareStatement("insert into Post(Title,Description,UserId) values(?,?,?)");
                ps.setString(1, title);
                ps.setString(2, description);
                ps.setInt(3, userId);
                ps.executeUpdate();
                
            } catch (SQLException ex) {
                Logger.getLogger(CreatePost.class.getName()).log(Level.SEVERE, null, ex);
            }
            response.sendRedirect("index.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}
