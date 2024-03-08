package fsa.training.ems.controller;


import fsa.training.ems.common.AppConstant;
import fsa.training.ems.enums.EmployeeLevel;
import fsa.training.ems.model.dto.EmployeeListDto;
import fsa.training.ems.model.entity.Employee;
import fsa.training.ems.service.EmployeeService;
import fsa.training.ems.service.impl.EmployeeServiceImpl;
import fsa.training.ems.utils.HibernateUtils;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.Arrays;
import java.util.List;

@WebServlet(name = "EmployeeController", value = {"/employee", "/employee/*"})
public class EmployeeController extends HttpServlet {

    private final EmployeeService employeeService = new EmployeeServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

//        check authentication
//        String account = (String) req.getSession().getAttribute("account");
//        if (account == null) {
//            resp.sendRedirect(req.getContextPath() + "/login");
//            return;
//        }

        String uri = req.getRequestURI();

//        FIXME: read from database
        if (uri.endsWith("/list")) {

            long totalItem = employeeService.getTotalItem();

            List<EmployeeListDto> employeeList = null;
            int page = AppConstant.DEFAULT_PAGE;
            long totalPage = 0L;
            if (totalItem > 0) {
                String pageStr = req.getParameter("page");
                String sizeStr = req.getParameter("size");

                if (pageStr != null) {
                    page = Integer.parseInt(pageStr);
                }

                int size = sizeStr != null ? Integer.parseInt(sizeStr) : AppConstant.DEFAULT_PAGE_SIZE;
                employeeList = employeeService.getAll(page, size);
                totalPage = totalItem <= size ? 1 :
                        (long) Math.ceil((double) totalItem / size);
            }
            System.out.println("employees = " + employeeList);
            req.setAttribute("employees", employeeList);
            req.setAttribute("totalPage", totalPage);
            req.setAttribute("page", page);
            req.getRequestDispatcher("/WEB-INF/view/employee/list_pro.jsp")
                    .forward(req, resp);
        } else if (uri.endsWith("/add")) {

            req.getRequestDispatcher("/WEB-INF/view/employee/add.jsp")
                    .forward(req, resp);
        } else if (uri.endsWith("/edit")) {
            String id = req.getParameter("id");
            Employee employee = employeeService.findById(Long.parseLong(id));
            System.out.println("employee = " + employee);
            req.setAttribute("employee", employee);

            req.getRequestDispatcher("/WEB-INF/view/employee/edit.jsp")
                    .forward(req, resp);
        } else if (uri.endsWith("/editSubmit")) {

            String id = req.getParameter("id");
            Employee employee = employeeService.findById(Long.parseLong(id));
            employee.setName(req.getParameter("name"));
            employee.setEmail(req.getParameter("email"));
            employee.setDateOfBirth(LocalDate.parse(req.getParameter("dob")));
            employee.setLevel(EmployeeLevel.valueOf(req.getParameter("level")));
            employee.setSalary(new BigDecimal(req.getParameter("salary")));
            employeeService.update(employee);
            resp.sendRedirect(req.getContextPath() + "/employee/list");

        } else if (uri.endsWith("/delete")) {
            req.getRequestDispatcher("/WEB-INF/view/employee/delete.jsp")
                    .forward(req, resp);

        } else if
        (uri.endsWith("/detail")) {

            String id = req.getParameter("id");
            Employee employee = employeeService.findById(Long.parseLong(id));
            System.out.println("employee = " + employee);
            req.setAttribute("employee", employee);

            req.getRequestDispatcher("/WEB-INF/view/employee/detail.jsp")
                    .forward(req, resp);
        }

    }

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

        resp.sendRedirect(req.getContextPath() + "/employee/list");

    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        Employee employee = employeeService.findById(Long.parseLong(id));
        req.setAttribute("employee", employee);
        System.out.println("employee = " + employee);
        employeeService.update(employee);
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doDelete(req, resp);
    }
}
