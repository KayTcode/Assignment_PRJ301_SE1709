<%-- 
    Document   : profile
    Created on : Mar 22, 2023, 2:35:00 PM
    Author     : anhth
--%>

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
                    <th>Password</th>
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
                <tr>
                    <td>${sessionScope.user.username}</td>
                    <td>${sessionScope.user.password}</td>
                    <td>${sessionScope.user.firstname}</td>
                    <td>${sessionScope.user.lastname}</td>
                    <td>${sessionScope.user.address}</td>
                    <td>${sessionScope.user.nickname}</td>
                    <td>${sessionScope.user.gender}</td>
                    <td>${sessionScope.user.phonenumber}</td>
                    <td>${sessionScope.user.email}</td>
                    <td>${sessionScope.user.nationalnumber}</td>
                    <td><a href="update">Update</a></td>
                </tr>
            </tbody>
        </table>

    </body>
</html>
