<%--
  Created by IntelliJ IDEA.
  User: thinh
  Date: 3/7/2024
  Time: 8:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<!-- Navbar -->
<nav class="navbar navbar-dark navbar-expand-lg bg-dark shadow small mb-3">
    <div class="container-fluid">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/employee/list">
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

</body>
</html>
