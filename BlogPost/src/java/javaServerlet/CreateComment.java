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
            super.doPost(req, resp);
            int uid = Integer.parseInt(req.getAttribute("userId").toString());
            int pid = Integer.parseInt(req.getAttribute("postId").toString());
            String comment = req.getAttribute("comment").toString();
            String query = "insert into comment(Content,UserId,PostId) values (?,?,?)";
            PreparedStatement ps  = DbConnect.connect().prepareStatement(query);
            ps.setString(1, comment);
            ps.setInt(2, uid);
            ps.setInt(3, pid);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CreateComment.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }

}
