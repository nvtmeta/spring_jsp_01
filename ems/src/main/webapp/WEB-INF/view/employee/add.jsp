<%@ page import="java.util.List" %>
<%@ page import="fsa.training.ems.model.dto.EmployeeListDto" %>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<!DOCTYPE html>
<html>

<head>
    <title>Employee Add</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
</head>

<body>
<h1 class="text-center mt-2">Employee Add</h1>
<br />

<form action="${pageContext.request.contextPath}/employee/add" method="post" class="p-2 m-2 w-25 mx-auto">

    <!-- Textarea -->
    <div class="form-group">
        <label class="fw-bold text-primary" for="dob">date_of_birth:</label>
        <input type="date" name="dob" class="form-control" id="dob">
    </div>
    <div class="form-group mt-3">
        <label class="fw-bold text-primary" for="email">email:</label>
        <input type="email" name="email" class="form-control" id="email">
    </div>

    <div class="form-group mt-3">
        <label class="fw-bold text-primary" for="name">name:</label>
        <input type="text" name="name" class="form-control" id="name">
    </div>
    <div class="form-group mt-3">
        <label class="fw-bold text-primary" for="salary">salary:</label>
        <input type="number" name="salary" class="form-control" id="salary">
    </div>


    <div class="form-group mt-3">
        <label class="fw-bold text-primary" for="level">level</label>
        <select name="level" id="level">
            <option value="FRESHER">FRESHER</option>
            <option value="JUNIOR">JUNIOR</option>
            <option value="SENIOR">SENIOR</option>
            <option value="EXPERT">EXPERT</option>
        </select>
    </div>
        <input type="submit" value="Submit" class="btn btn-primary mt-3">
</form>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>