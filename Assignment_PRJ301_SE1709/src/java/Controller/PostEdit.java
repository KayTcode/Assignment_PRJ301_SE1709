/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.PostDAO;
import Model.Post;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

/**
 *
 * @author anhth
 */
public class PostEdit extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet PostEdit</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PostEdit at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        HttpSession session = request.getSession();
//        session.getAttribute("user");
//        PostDAO pDAO = new PostDAO();
        String postID = request.getParameter("postID");

//        String userID = request.getParameter("userID");
//        String description = request.getParameter("description");
//        if (postID != null) {
//            pDAO.editPost(postID, userID, description);
        request.setAttribute("postID", postID);
        String description = request.getParameter("description");
        PostDAO pDAO = new PostDAO();
        ArrayList<Post> listofPost = pDAO.getListPostbyID(postID); 
        request.setAttribute("datalistofPost", listofPost);
//        response.sendRedirect("postedit");
        request.getRequestDispatcher("./view/updatePost.jsp").forward(request, response);
//            response.sendRedirect("newfeed");
//        }
        //  processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.getAttribute("user");
        PostDAO pDAO = new PostDAO();
        String postID_raw = request.getParameter("postID");

        if (postID_raw != null) {
            int postID = Integer.parseInt(postID_raw);
            String userID_raw = request.getParameter("userID");
            int userID = Integer.parseInt(userID_raw);
            String description = request.getParameter("description");
            pDAO.editPost(postID, userID, description);
//            request.getRequestDispatcher("./view/newfeed.jsp").forward(request, response);
            ArrayList<Post> list = pDAO.getListPost();
            request.setAttribute("data", list);
            response.sendRedirect("newfeed");
//            request.getRequestDispatcher("./view/newfeed.jsp").forward(request, response);
//            processRequest(request, response);

//            response.sendRedirect("newfeed");
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
