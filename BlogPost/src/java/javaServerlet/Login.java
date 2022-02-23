/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javaServerlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Kaveesha FDO
 */
@WebServlet(name = "Login", urlPatterns = {"/Login"})
public class Login extends HttpServlet {

    Connection conn = null;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        DbConnect.connect();
        try (PrintWriter out = response.getWriter()) {
            String log_email = request.getParameter("log_email");
            String log_password = request.getParameter("log_password");

            ResultSet rs = DbConnect.getDb("SELECT Id,Name,Email FROM Users WHERE Email='" + log_email + "' AND Password='" + log_password + "'");
            if (rs.next()) {
                int id = rs.getInt("Id");
                String name = rs.getString("Name");
                String email = rs.getString("Email");
                
                Member member = new Member(id,name,email);      

                Cookie ck = new Cookie("id", String.valueOf(id));
                response.addCookie(ck);
                response.sendRedirect("index.jsp");

            } else {
                out.println("Login Failed");

            }
        } catch (SQLException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}
