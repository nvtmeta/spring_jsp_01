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
<!-- Navbar -->
<nav class="navbar navbar-dark navbar-expand-lg bg-dark shadow small mb-3">
    <div class="container-fluid">
        <a class="navbar-brand" href="dash.html">
            <span class="brand-gradient">EMS</span>
        </a>
        <button
                class="navbar-toggler border-0"
                type="button"
                data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent"
                aria-expanded="false"
                aria-label="Toggle navigation">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-list"
                 viewBox="0 0 16 16">
                <path fill-rule="evenodd"
                      d="M2.5 12a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z"/>
            </svg>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="dash.html">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="employees-list.html">Employees</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="jobs-list.html">Jobs</a>
                </li>
            </ul>
            <form class="d-flex" role="search">
                <div class="hstack gap-3">
                    <div class="input-group">
                        <input class="form-control form-control-sm me-auto" type="text" placeholder="Search for..."
                               aria-label="Search for...">
                        <button type="button" class="btn btn-sm btn-success">
                            <!-- Search Icon -->
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                 class="bi bi-search" viewBox="0 0 16 16">
                                <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                            </svg>
                        </button>
                    </div>
                    <div class="vr"></div>
                    <a href="index.html" class="btn btn-sm btn-warning">
                        <!-- Power Icon -->
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                             class="bi bi-power" viewBox="0 0 16 16">
                            <path d="M7.5 1v7h1V1h-1z"/>
                            <path d="M3 8.812a4.999 4.999 0 0 1 2.578-4.375l-.485-.874A6 6 0 1 0 11 3.616l-.501.865A5 5 0 1 1 3 8.812z"/>
                        </svg>
                    </a>
                </div>
            </form>
        </div>
    </div>
</nav>
<!-- Navbar -->

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
                            <a href="#" class="btn btn-sm btn-primary" data-bs-toggle="modal"
                               data-bs-target="#employee_details">Details</a>
                            <a href="#" class="btn btn-sm btn-warning" data-bs-toggle="modal"
                               data-bs-target="#employee_edit">Edit</a>
                            <a href="#" class="btn btn-sm btn-danger" data-bs-toggle="modal"
                               data-bs-target="#employee_delete">Delete</a>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                </table>
                <%--                <%--%>
                <%--                    int size = 3; // Default size--%>
                <%--                    int currentPage = 1; // Default page--%>
                <%--                    Long totalPage = (Long) request.getAttribute("totalPage");--%>

                <%--                    String sizeStr = request.getParameter("size");--%>
                <%--                    String pageStr = request.getParameter("page");--%>

                <%--                    if (sizeStr != null && !sizeStr.isEmpty()) {--%>
                <%--                        size = Integer.parseInt(sizeStr);--%>
                <%--                    }--%>
                <%--                    if (pageStr != null && !pageStr.isEmpty()) {--%>
                <%--                        currentPage = Integer.parseInt(pageStr);--%>
                <%--                    }--%>

                <%--                %>--%>

                <%--                <nav aria-label="Page navigation example">--%>
                <%--                    <ul class="pagination">--%>
                <%--                        <li class="page-item <%= currentPage <= 1 ? "disabled" : "" %>">--%>
                <%--                            <a class="page-link" href="#" onclick="updatePagination(<%= Math.max(1, currentPage - 1) %>, <%= size %>)">Previous</a>--%>
                <%--                        </li>--%>
                <%--                        <% for (int i = 1; i <= totalPage; i++) { %>--%>
                <%--                        <li onclick="updatePagination(<%= i %>, <%= size %>)" class="page-item <%= i == currentPage ? "active" : "" %>">--%>
                <%--                            <a class="page-link" href="/employees?page=<%=i + 1%>"><%=i%></a>--%>
                <%--                        </li>--%>
                <%--                        <% } %>--%>
                <%--                        <li class="page-item <%= currentPage >= totalPage ? "disabled" : "" %>">--%>
                <%--                            <a class="page-link" href="#" onclick="updatePagination(<%= Math.min(totalPage, currentPage + 1) %>, <%= size %>)">Next</a>--%>
                <%--                        </li>--%>
                <%--                    </ul>--%>
                <%--                </nav>--%>
                <nav aria-label="Page navigation example">
                    <ul class="pagination">

                        <% int activePage = (int) request.getAttribute("page");
                            if (activePage > 1) {
                        %>
                        <li class="page-item <%= activePage == 1 ? "d-none" : ""%>">
                            <a class="page-link"
                               href="${pageContext.request.contextPath}/employee?page=<%= activePage - 1%>">Previous</a>
                        </li>
                        <%
                            }
                            long totalPage = (long) request.getAttribute("totalPage");

                            for (int i = 0; i < totalPage; i++) { %>
                        <li class="page-item <%= activePage == (i + 1)  ? "active" : ""%>">
                            <%--                            <a class="page-link <%= activePage == (i + 1)  ? "disabled" : ""%>"--%>
                            <%--                               href="${pageContext.request.contextPath}/employee?page=<%=i + 1%>&size=3"><%=i + 1%>--%>
                            <%--                            </a>--%>
                            <a class="page-link"
                               href="<%=activePage == (i + 1) ? "javascript:void(0)" : request.getContextPath() + "/employee?page=" + (i + 1) %>">
                                <%=i + 1%>
                            </a>
                        </li>
                        <% }
                            if (activePage < totalPage) {
                        %>
                        <li>
                            <a class="page-link <%= activePage == totalPage ? "d-none" : ""%> "
                               href="${pageContext.request.contextPath}/employee?page=<%= activePage +1%>">
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
    // function updatePagination(page, size) {
    //     try {
    //         console.log("page: " + page + ", size: " + size);
    //         let url = window.location.href;
    //         let params = new URLSearchParams(window.location.search);
    //         params.set('page', page);
    //         params.set('size', size);
    //
    //         console.log("params" + params);
    //         window.location.href = url.split('?')[0] + '?' + params.toString();
    //         return url.split('?')[0] + '?' + params.toString();
    //     } catch (error) {
    //         console.error("Error redirecting page:", error);
    //     }
    // }
</script>
</body>
</html>