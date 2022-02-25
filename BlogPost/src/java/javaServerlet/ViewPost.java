/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javaServerlet;

import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "ViewPost", urlPatterns = {"/ViewPost"})
public class ViewPost extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            int pid = Integer.parseInt(request.getParameter("postId").toString());
            int uid = Integer.parseInt(request.getParameter("userId").toString());
            String title = request.getParameter("title");
            String desc = request.getParameter("description");
            request.setAttribute("postId", pid);
            request.setAttribute("userId", uid);
            request.setAttribute("title", title);
            request.setAttribute("description", desc);
            RequestDispatcher rd = request.getRequestDispatcher("inside.jsp");
            rd.forward(request, response);          
            response.sendRedirect("inside.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

}
