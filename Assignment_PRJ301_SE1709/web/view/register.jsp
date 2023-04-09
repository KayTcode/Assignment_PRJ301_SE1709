<%-- 
    Document   : register
    Created on : Mar 20, 2023, 7:41:08 PM
    Author     : anhth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
         <link rel="icon" type="image/x-icon" href="./images/logoKT.png">
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login</title>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
              rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" />
        <title>KT Blog</title>
        <!-- Additional CSS Files -->
        <link rel="stylesheet" href="./css/styleLogin.css">
        <<link rel="stylesheet" href="./css/myStyle.css"/>
    </head>

    <body>
        <div class="banner">
            <div class="navbar">
                <a href="home"><img src="./images/logoKT.png" class="logo"></a>
                <ul class="nav">
                    <li><a href="../index.html">Home</a></li>
                    <li><a href="#">Support</a></li>
                    <li><a href="#">Contact</a></li>
                </ul>
                <a href="login"><button type="button"><span></span>Login</button></a>
            </div>
            <div class="box" style="padding-top: 200px;">
                <div class="container-register">
                    <div class="top-header">
                        <header>Register</header>
                    </div>
                    <form method="post" action="register">
                            <div class="input-field">
                                <input type="text" name="username" id="username" class="input" placeholder="Username" required>
                                <i class="fa-solid fa-user"></i>
                            </div>
                            <div class="input-field">
                                <input type="password" name="password" id="password" class="input" placeholder="Password"
                                       required>
                                <i class="fa-solid fa-lock"></i>
                            </div>
                            <div class="input-field">
                                <input type="password" name="repassword" id="repassword" class="input"
                                       placeholder="Repassword" required>
                                <i class="fa-solid fa-lock"></i>
                            </div>
                            <div class="input-field">
                                <input type="submit" name="submit" id="submit" class="submit">
                            </div>
                    </form>
                    ${mess}
                </div>
            </div>
        </div>
    </body>
</html>
