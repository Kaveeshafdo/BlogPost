/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javaServerlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
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
@WebServlet(name = "Register", urlPatterns = {"/Register"})
public class Register extends HttpServlet {

    Connection conn = null;
    PreparedStatement pst;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String name = request.getParameter("name");
            String email = request.getParameter("reg_email");
            String pass = request.getParameter("reg_password");
            String rePass = request.getParameter("repassword");

            if (pass.equals(rePass)) {
                //if ((!name.equals("")) && (!email.equals("")) && (!pass.equals(""))) {         
                if (true) {
                    try {
                        Member member = new Member(name, email, pass, rePass);
                        member.setName(name);
                        member.setEmail(email);
                        member.setPass(pass);
                        out.println(member.getName());
                        out.println(member.getEmail());
                        out.println(member.getPass());
                        response.sendRedirect("welcome.jsp");
                    } catch (Exception e) {
                        out.println(e.getMessage());
                    }

                } else {
                    out.println("Empty Name, Email or Password");
                }
            } else {
                out.println("Invalid Password");
            }

        } catch (Exception ex) {
            Logger.getLogger(Register.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}
