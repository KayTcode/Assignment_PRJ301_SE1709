<%-- 
    Document   : updateprofile
    Created on : Mar 22, 2023, 2:49:32 PM
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
        <form method="post" action="update">
             <input name="id" value="${sessionScope.user.userID}"  type="hidden">
            Username: <input type="text" value="${sessionScope.user.username}" readonly="readonly"><br>
            Password:<input type="text" value="${sessionScope.user.getPassword()}" name="password"><br>
            First Name: <input type="text" value="${sessionScope.user.getFirstname()}" name="firstname"><br>
            Last Name: <input type="text" value="${sessionScope.user.getLastname()}" name="lastname"><br>
            Address: <input type="text" value="${sessionScope.user.getAddress()}" name="address"><br>
            Nickname: <input type="text" value="${sessionScope.user.getNickname()}" name="nickname"><br>
            Gender: <input type="radio" value="1" name="gender" ${sessionScope.user.isGender()== true ?"checked" :""}> Male 
            <input type="radio" value="0" name="gender" ${sessionScope.user.isGender()== false ?"checked" :""}> Female<br>
            Phone Number: <input type="text" value="${sessionScope.user.getPhonenumber()}" name="phonenumber"><br>
            Email: <input type="text" value="${sessionScope.user.getEmail()}" name="email"><br>
            National ID: <input type="text" value="${sessionScope.user.getNationalnumber()}" name="nationalnumber"><br>
            <input type="submit" name="submit" value="Save">
        </form>
    </body>
</html>
