<%@ page import="java.util.List" %>
<%@ page import="fsa.training.ems.model.dto.EmployeeListDto" %>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>Employee List</title>
</head>
<body>
    <h1>Employee List</h1>
    <br/>
        <%
            List<EmployeeListDto> employees = (List<EmployeeListDto>) request.getAttribute("employees");
         %>
         <table>
            <tr >
                <th>ID </th>
                <th>Name </th>
                <th>Email </th>
                <th>Level </th>
                <th>DOB </th>
            </tr>
             <%
                for (int i =0; i< employees.size(); i++) {
                    EmployeeListDto employee = employees.get(i);
              %>
                <tr>
                    <td><%=employee.getId()%> </td>
                    <td><%=employee.getName()%> </td>
                    <td><%=employee.getEmail()%> </td>
                    <td><%=employee.getLevel()%> </td>
                    <td><%=employee.getDateOfBirth()%> </td>
                </tr>

               <%
                    }
               %>
         </table>

</body>
</html>


