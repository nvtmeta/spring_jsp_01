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

@WebServlet(name = "EmployeeController", value = {"/employee", "/employee/list"})
public class EmployeeController extends HttpServlet {

    private final EmployeeService employeeService = new EmployeeServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


//        FIXME: read from database


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
        req.getRequestDispatcher("/WEB-INF/employee/list_pro.jsp")
                .forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPut(req, resp);
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doDelete(req, resp);
    }
}
