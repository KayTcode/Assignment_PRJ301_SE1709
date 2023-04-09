<%-- 
    Document   : usermanage
    Created on : Mar 22, 2023, 1:36:32 PM
    Author     : anhth
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello ${sessionScope.user.nickname}</h1>
        <table border="1">
            <thead>
                <tr>
                    <th>Username</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Address</th>
                    <th>Nickname</th>
                    <th>Gender</th>
                    <th>Phone Number</th>
                    <th>Email</th>
                    <th>National ID</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${datauser}" var="du">
                    <tr>
                        <td>${du.getUsername()}</td>
                        <td>${du.getFirstname()}</td>
                        <td>${du.getLastname()}</td>
                        <td>${du.getAddress()}</td>
                        <td>${du.getNickname()}</td>
                        <c:if test="${du.isGender()}">
                            <td>Male</td> 
                        </c:if>
                        <c:if test="${!du.isGender()}">
                            <td>Female</td> 
                        </c:if>
                        <td>${du.getPhonenumber()}</td>
                        <td>${du.getEmail()}</td>
                        <td>${du.getNationalnumber()}</td>
                        <td><a href="delete?id=${du.getUserID()}">Delete</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

    </body>
</html>
