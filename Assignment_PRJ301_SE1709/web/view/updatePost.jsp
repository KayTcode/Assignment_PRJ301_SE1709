<%-- 
    Document   : updatePost
    Created on : Mar 22, 2023, 4:52:17 PM
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
        <title>New Feed</title>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap"
              rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" />
        <link rel="stylesheet" href="./css/MyNewFeedStyle.css">
    </head>

    <body>
        <nav>
            <div class="nav-left">
                <a href="home"><img src="./images/logoKT.png" alt="logo"></a>
                <input type="text" placeholder="Search">
            </div>
            <div class="nav-middle">
                <a href="newfeed" class="active">
                    <i class="fa-solid fa-house"></i>
                </a>
                <a href="#">
                    <i class="fa-solid fa-users"></i>
                </a>
                <a href="#">
                    <i class="fa-sharp fa-solid fa-circle-play"></i>
                </a>
                <a href="#">
                    <i class="fa-solid fa-user-friends"></i>
                </a>
            </div>
            <div class="nav-right">
                <span class="profile"></span>
                <a href="#">
                    <i class="fa-sharp fa-solid fa-bell"></i>
                </a>
                <a href="#">
                    <i class="fa-solid fa-ellipsis"></i>
                </a>
            </div>
        </nav>
        <div class="container">
            <div class="left-panel">
                <ul>
                    <li>
                        <span class="profile"></span>
                        <div class="name">${sessionScope.user.nickname}</div>
                    </li>
                    <li>
                        <i class="fa-solid fa-users"></i>
                        <div class="name">Friends</div>
                    </li>
                    <li>
                        <i class="fa-sharp fa-solid fa-circle-play"></i>
                        <div class="name">Video</div>
                    </li>
                    <li>
                        <i class="fa-solid fa-user-friends"></i>
                        <div class="name">Groups</div>
                    </li>                
                </ul>
            </div>

            <div class="middle-panel">
                <div class="post">
                    <form method="post" action="postedit">
                        <div class="post-top">
                            <input type="hidden" name="postID" value="${postID}">
                            <input type="hidden" name="userID" value="${sessionScope.user.userID}">
                            <div class="dp">
                                <img src="./images/user.jpg" alt=""><!--Anh dai dien cua user-->
                            </div>
                            <c:forEach items="${datalistofPost}" var="da">
                                <input type="text" name="description" value="${da.getDescription()}">
                            </c:forEach>
                            
                        </div>
                        <div class="post-bottom">
                            <div class="action">
                                <i class="fa-solid fa-image"></i>
                                <span>Images</span>
                            </div>
                            <input type="submit" value="save" name="savebt">
                            <div class="action">
                                <i class="fa-solid fa-paper-plane-top"></i>
                            </div>
                            <div class="action">
                                <i class="fa-solid fa-camera"></i>
                                <span>Images Camera</span>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
