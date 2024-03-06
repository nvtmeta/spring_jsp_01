package fsa.training.ems.controller;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "LoginController", value = {"/login", "/login/*"})
public class LoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        req.getRequestDispatcher("/WEB-INF/view/auth/login.jsp")
                .forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String account = req.getParameter("account");
        String password = req.getParameter("password");
        System.out.println("account" + account + "password" + password);

//        FIXME
        if ("admin".equalsIgnoreCase(account) && "admin".equalsIgnoreCase(password)) {
//            req.getRequestDispatcher("/WEB-INF/view/auth/login.jsp")
//                    .forward(req, resp);
            resp.sendRedirect(req.getContextPath() + "/employee");
    //instead call direct view, we call EmployeeController

        } else {
            req.setAttribute("error", "Account or password is invalid");
            req.getRequestDispatcher("/WEB-INF/view/auth/login.jsp")
                    .forward(req, resp);
        }
    }

}
