<%@ page import="fsa.training.ems.model.entity.Employee" %>
<%@ page import="java.util.List" %>
<%@ page import="fsa.training.ems.model.dto.EmployeeListDto" %><%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 2/29/2024
  Time: 7:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Employee List</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">
<jsp:include page="../fragment/Header.jsp"/>
<!-- Employee list -->
<div class="container-fluid">
    <div class="row justify-content-center">
        <div class="col-md-10">
            <div class="card shadow-sm border-0 mb-3">
                <div class="card-header text-bg-dark text-center">Employees List</div>
                <table class="table table-sm small table-bordered table align-middle mb-0">
                    <tr class="table-secondary">
                        <th>ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Date Of Birth</th>
                        <th>Level</th>
                        <th>Action</th>
                    </tr>
                    <%
                        List<EmployeeListDto> employees = (List<EmployeeListDto>) request.getAttribute("employees");
                        for (int i = 0; i < employees.size(); i++) {
                            EmployeeListDto employee = employees.get(i);
                    %>
                    <tr>
                        <td><%=employee.getId()%>
                        </td>
                        <td><%=employee.getName()%>
                        </td>
                        <td><%=employee.getEmail()%>
                        </td>
                        <td><%=employee.getDateOfBirth()%>
                        </td>
                        <td><%=employee.getLevel()%>
                        </td>
                        <td>
                            <a href="${pageContext.request.contextPath}/employee/detail?id=<%=employee.getId()%>"
                               class="btn btn-sm btn-primary"
                            >Details</a>
                            <a href="${pageContext.request.contextPath}/employee/edit?id=<%=employee.getId()%>"
                               class="btn btn-sm btn-warning" >Edit</a>
                            <a href="${pageContext.request.contextPath}/employee/delete?id=<%=employee.getId()%>" class="btn btn-sm btn-danger">Delete</a>
                        </td>
                    </tr>
                    <%
                        }
                    %>

                    </td>
                </table>
                <div class="m-3">
                    <a class="btn my-2 btn-primary" href="${pageContext.request.contextPath}/employee/add">
                        Thêm mới
                    </a>
                </div>

                <nav aria-label="Page navigation example">
                    <ul class="pagination">

                        <% int activePage = (int) request.getAttribute("page");
                            if (activePage > 1) {
                        %>
                        <li class="page-item <%= activePage == 1 ? "d-none" : ""%>">
                            <a class="page-link"
                               href="${pageContext.request.contextPath}/employee/list?page=<%= activePage - 1%>">Previous</a>
                        </li>
                        <%
                            }
                            long totalPage = (long) request.getAttribute("totalPage");

                            for (int i = 0; i < totalPage; i++) { %>
                        <li class="page-item <%= activePage == (i + 1)  ? "active" : ""%>">
                            <a class="page-link"
                               href="<%=activePage == (i + 1) ? "javascript:void(0)" : request.getContextPath() + "/employee/list?page=" + (i + 1) %>">
                                <%=i + 1%>
                            </a>
                        </li>
                        <% }
                            if (activePage < totalPage) {
                        %>
                        <li>
                            <a class="page-link <%= activePage == totalPage ? "d-none" : ""%> "
                               href="${pageContext.request.contextPath}/employee/list?page=<%= activePage +1%>">
                                Next</a>
                        </li>
                        <% } %>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</div>
<!-- Employee list -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>

<script>

</script>
</body>
</html>