<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
</head>
<body>
<div class="container">
    <div class="row justify-content-center align-items-center vh-100">
        <div class="col-md-4">
            <div class="card shadow-lg">
                <div class="card-header">Login</div>
                <div class="card-body">
                    <form name="loginForm" action="${pageContext.request.contextPath}/login" method="post"
                          onsubmit="return validateForm()">
                        <div class="mb-3">
                            <input type="text" name="account" class="form-control" placeholder="Account"/>
                        </div>
                        <div class="mb-3">
                            <input type="password" name="password" class="form-control"
                                   placeholder="Password"/>
                        </div>
                        <div class="mb-3">
                            <input id="remember-me" type="checkbox" name="rememberMe"
                                   class="form-check-input"> <label for="remember-me">Remember me</label>
                        </div>
                        <%
                            String err = (String) request.getAttribute("error");
                            if (err != null) { %>
                        <p class="text-danger">
                            <%=err%>
                        </p>
                        <%}%>
                        <div class="d-grid">
                            <button class="btn btn-success" type="submit">Login</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    function validateForm() {
        const account = document.forms["loginForm"]["account"].value;
        const password = document.forms["loginForm"]["password"].value;
        alert(account);
        return true;
    }

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
            crossorigin="anonymous"></script>
</body>
</html>