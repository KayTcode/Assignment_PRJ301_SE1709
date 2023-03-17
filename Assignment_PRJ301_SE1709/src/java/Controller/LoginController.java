/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import DAO.UserDBContext;
import Model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author anhth
 */
public class LoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        UserDBContext userDB = new UserDBContext();
        User u = userDB.getUser(username, password);
        try {
            if (u == null) {
                resp.getWriter().println("Login fail! Please input username and password");
                req.getRequestDispatcher("login.jsp").forward(req, resp);
            }else {
                req.getSession().setAttribute("user", u);
                Cookie user = new Cookie("username", u.getUsername());
                Cookie pass = new Cookie("password", u.getPassword());
                if (req.getParameter("remember") != null) {
                    user.setMaxAge(60 * 60 * 24);
                    pass.setMaxAge(60 * 60 * 24);

                } else {
                    user.setMaxAge(0);
                    pass.setMaxAge(0);
                }
                resp.addCookie(user);
                resp.addCookie(pass);

                req.getRequestDispatcher("home.jsp").forward(req, resp);
            }
        } catch (ServletException | IOException e) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, e);
        }
    }

}
