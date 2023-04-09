<%-- 
    Document   : login
    Created on : Mar 15, 2023, 5:09:33 PM
    Author     : anhth
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login</title>
        <title>KT Blog</title>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
              rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" />
        <!-- Additional CSS Files -->
        <link rel="stylesheet" href="./css/styleLogin.css">

    </head>

    <body>
        <div class="banner">
            <div class="navbar">
                <a href="home"><img src="./images/logoKT.png" class="logo"></a>
                <ul class="nav">
                    <li><a href="home">Home</a></li>
                    <li><a href="#">Support</a></li>
                    <li><a href="#">Contact</a></li>
                </ul>
            </div>
            <div class="box" style="padding-top: 200px;">
                <div class="container">
                    <div class="top-header">
                        <strong style="color: greenyellow">${notification}</strong>
                        <header>
                            Login
                        </header><br>
                        <p style="color: white">${mess}</p>

                    </div>
                    <div class="input-field">
                        <form action="login" method="post">
                            <input type="text" name="username" id="username" class="input" placeholder="Username" required>
                            <i class="fa-solid fa-user"></i>
                            <input type="password" name="password" id="password" class="input" placeholder="Password" required>
                            <i class="fa-solid fa-lock"></i>
                            <input type="submit" name="submit" id="submit" class="submit">
                        </form>
                        <a href="register.jsp" style="color: #fff">Do you have account?</a>

                    </div>
                </div>
            </div>
        </div>
        
    </body>
</html>
