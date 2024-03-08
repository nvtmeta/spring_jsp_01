package fsa.training.ems.controller;

import fsa.training.ems.service.EmployeeService;
import fsa.training.ems.service.impl.EmployeeServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "EmployeeDeleteController", value = "/employee/delete")
public class EmployeeDeleteController extends HttpServlet {
    private final EmployeeService employeeService = new EmployeeServiceImpl(); // EmployeeService

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");

        if (id == null) {
            //TODO :redirect to error page

        } else {
            System.out.println("id = " + id);
            boolean success = employeeService.delete(Long.parseLong(id));
            if (success) {
                resp.sendRedirect(req.getContextPath() + "/employee/list");
            }
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
