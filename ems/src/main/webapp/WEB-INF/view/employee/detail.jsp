<%@ page import="fsa.training.ems.model.entity.Employee" %>
<%@ page import="fsa.training.ems.enums.EmployeeLevel" %><%--
  Created by IntelliJ IDEA.
  User: thinh
  Date: 3/7/2024
  Time: 2:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <title>Employee detail</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
</head>

<body>
    <h1 class="text-center mt-2">Employee detail <h1>

    <form action="${pageContext.request.contextPath}/employee" method="post" class="p-2 m-2 w-25 mx-auto">
        <% Employee employee = (Employee) request.getAttribute("employee");
        %>
        <!-- Textarea -->
        <div class="form-group">
            <label class="fw-bold text-primary" for="dob">date_of_birth:</label>
            <input disabled value="<%=employee.getDateOfBirth()%>" type="date" name="dob" class="form-control" id="dob">
        </div>
        <div class="form-group mt-3">
            <label class="fw-bold text-primary" for="email">email:</label>
            <input disabled value="<%=employee.getEmail()%>" type="email" name="email" class="form-control" id="email">
        </div>

        <div class="form-group mt-3">
            <label class="fw-bold text-primary" for="name">name:</label>
            <input disabled value="<%=employee.getName()%>" type="text" name="name" class="form-control" id="name">
        </div>
        <div class="form-group mt-3">
            <label class="fw-bold text-primary" for="salary">salary:</label>
            <input disabled value="<%=employee.getSalary()%>" type="number" name="salary" class="form-control" id="salary">
        </div>


        <div class="form-group mt-3">
            <label class="fw-bold text-primary" for="level">level</label>
            <select disabled name="level" id="level">
                <option  <%= employee.getLevel() == EmployeeLevel.FRESHER ? "selected" : "" %> value="FRESHER">FRESHER</option>
                <option <%= employee.getLevel() == EmployeeLevel.JUNIOR ? "selected" : "" %> value="JUNIOR">JUNIOR</option>
                <option <%= employee.getLevel() == EmployeeLevel.SENIOR ? "selected" : "" %> value="SENIOR">SENIOR</option>
                <option <%= employee.getLevel() == EmployeeLevel.EXPERT ? "selected" : "" %>  value="EXPERT">EXPERT</option>
            </select>
        </div>
        <input type="submit" value="Submit" class="btn btn-primary mt-3">
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>