package fsa.training.ems.controller;


import fsa.training.ems.enums.EmployeeLevel;
import fsa.training.ems.model.entity.Employee;
import fsa.training.ems.service.EmployeeService;
import fsa.training.ems.service.impl.EmployeeServiceImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.math.BigDecimal;
import java.time.LocalDate;

@WebServlet(name = "EmployeeAddController", value = {"/employee/add"})
public class EmployeeAddController extends HttpServlet {

    private final EmployeeService employeeService = new EmployeeServiceImpl();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        get data of request
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String dateOfBirth = req.getParameter("dob");
        String level = req.getParameter("level");
        String salary = req.getParameter("salary");

        Employee employee = new Employee();
        employee.setName(name);
        employee.setEmail(email);
        employee.setDateOfBirth(LocalDate.parse(dateOfBirth));
        employee.setLevel(EmployeeLevel.valueOf(level));
        employee.setSalary(new BigDecimal(salary));

        System.out.println("employee = " + employee);

        employeeService.create(employee);

        resp.sendRedirect(req.getContextPath() + "/employee");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/view/employee/add.jsp").forward(req, resp);
    }
}
