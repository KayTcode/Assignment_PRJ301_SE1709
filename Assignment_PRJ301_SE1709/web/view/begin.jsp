<%-- 
    Document   : begin
    Created on : Mar 22, 2023, 12:50:50 AM
    Author     : anhth
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">

    <head>
        <link rel="icon" type="image/x-icon" href="./images/logoKT.png">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
              rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" />

        <title>KT Blog</title>
        <!-- Additional CSS Files -->
        <link rel="stylesheet" href="./css/myStyle.css">

    </head>

    <body>

        <!--Start Header-->
        <div class="banner" id="banner">
            <div class="navbar">
                <a href="home"><img src="./images/logoKT.png" class="logo"> </a>
                <ul class="nav">
                    <li><a href="home">Home</a></li>
                    <li><a href="#introduce">Introduce</a></li>
                    <li><a href="#support">Support</a></li>
                    <li><a href="#footer">Contact</a></li>


                    <c:if test="${sessionScope.user.role.roleID eq 3}">
                        <li>
                            <a href="usermanage"><button type="button" class="but-user"><i class="fa-solid fa-user"></i> ${sessionScope.user.nickname}</button></a>  
                        </li>
                        <li>
                            <a href="logout"><button type="button" class="but-user"> Logout</button></a>  
                        </li>
                    </c:if>
                    <c:if test="${sessionScope.user.role.roleID eq 2}">
                        <li>
                            <a href="../adminmanage"><button type="button" class="but-user"><i class="fa-solid fa-user"></i> ${sessionScope.user.nickname}</button></a>
                        </li>
                        <li>
                            <a href="logout"><button type="button" class="but-user">Logout</button></a>  
                        </li>
                    </c:if>
                </ul>
                <c:if test="${sessionScope.user eq null}">
                    <a href="login"><button type="button"><span></span>Login</button></a>
                            </c:if>
            </div>
            <!--Start Content-->
            <div class="content" id="content">
                <h1>Design Your Diary</h1>
                <p>You can start your story with KT Blog</p>
                <div>
                    <c:if test="${sessionScope.user eq null}">
                        <a href="register"><button type="button"><span></span>REGISTER</button></a>    
                    </c:if>
                     <c:if test="${sessionScope.user.role.roleID eq 3}">
                        <a href="newfeed"><button type="button"><span></span>NEW FEED</button></a>    
                    </c:if>
                    <c:if test="${sessionScope.user.role.roleID eq 2}">
                        <a href="adminmanage"><button type="button"><span></span>USER MANAGEMENT</button></a>    
                    </c:if>
                    <a href="#footer" style="color: #fff;"><button type="button"><span></span>CONTACT</button></a>
                </div>
            </div>
        </div>
        <!--Introduce-->
        <div class="introduce" id="introduce">
            <h1>About KayT Blog</h1>
            <div class="left-introduce">
                <h2>Introduce</h2>
                <p>
                    KayT Blog is a personal diary website where everyone can post their status.<br>
                    People can see your posts and interact with your posts.<br> Everyone can freely post their own
                    experiences or stories to share with others.
                </p><br>
                <h2>Feature</h2>
                <div class="feature">
                    <div class="security">
                        <div id="security-icon">
                            <i class="fa-solid fa-lock-open"></i>
                        </div>
                        <div id="security-content">
                            Secure your diary with a personal PIN code or password.
                        </div>
                    </div>

                    <div id="write-onl">
                        <div id="earth-icon">
                            <i class="fa-solid fa-earth-americas"></i>
                        </div>
                        <div id="write-onl-content">
                            Access your diary on our Website. Read & write entries, backup, etc.
                        </div>
                    </div>

                    <div class="share">
                        <div id="share-icon">
                            <i class="fa-solid fa-share"></i>
                        </div>
                        <div id="share-content">
                            Share notes with friends via Facebook.
                        </div>
                    </div>
                </div>
            </div>
            <div class="right-introduce">
                <img src="images/chill-dulich.jpg" alt="#">
            </div>
        </div>

        <!--Support-->
        <div class="support" id="support">
            <h1>Support</h1>
            <p>For more info and support, feel free to contact us</p>
            <div class="support-left">
                <form action="#" method="post">
                    <input type="text" name="sup-user-name" placeholder="Your Name..."><br>
                    <input type="text" name="sup-user-mail" placeholder="Your Mail..."><br>
                    <textarea name="message" id="message" cols="20" rows="500" placeholder="Your Message..."></textarea>
                    <div class="sup-button">
                        <span></span><input type="submit" value="Send">
                    </div>
                </form>
            </div>
            <div class="support-right">
                <ul class="support-infor">
                    <li><i class="fa-solid fa-phone"></i><strong>0989192643</strong></li>
                    <li><i class="fa-solid fa-envelope"></i><strong>thanhchhe161893@fpt.edu.vn</strong></li>
                </ul>
            </div>
        </div>

        <!--Start Footer-->
        <footer class="footer" id="footer">
            <h3>Code By KayT</h3>
            <p>This is a project of PRJ301<br>Spring 2023</p>
            <ul class="socials">
                <li><a href="#"><i class="fa-brands fa-facebook"></i></a></li>
                <li><a href="#"><i class="fa-brands fa-github"></i></a></li>
                <li><a href="#"><i class="fa-brands fa-instagram"></i></a></li>
            </ul>

            <ul class="footer-infor">
                <li><i class="fa-solid fa-phone"></i><strong>0989192643</strong></li>
                <li><i class="fa-solid fa-envelope"></i><strong>thanhchhe161893@fpt.edu.vn</strong></li>
            </ul>

        </footer>
    </body>

</html>
