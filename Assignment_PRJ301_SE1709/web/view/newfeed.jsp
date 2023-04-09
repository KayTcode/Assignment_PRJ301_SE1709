<%-- 
    Document   : newfeed
    Created on : Mar 22, 2023, 11:01:21 AM
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
                    <form method="post" action="newfeed">
                        <div class="post-top">
                            <input type="hidden" name="userID" value="${sessionScope.user.userID}">
                            <div class="dp">
                                <img src="./images/user.jpg" alt=""><!--Anh dai dien cua user-->
                            </div>
                            <input type="text" name="description" placeholder="What's on you mind ?">
                        </div>
                        <div class="post-bottom">
                            <div class="action">
                                <i class="fa-solid fa-image"></i>
                                <span>Images</span>
                            </div>
                            <button type="submit">
                                <div class="action">
                                    <i class="fa-solid fa-paper-plane-top"></i>
                                    <span>Send</span>
                                </div>
                            </button>
                            <div class="action">
                                <i class="fa-solid fa-camera"></i>
                                <span>Images Camera</span>
                            </div>
                        </div>
                    </form>
                </div>

                <c:forEach items="${data}" var="d">
                    <div class="post">
                        <div class="post-top">
                            <div class="dp">
                                <img src="./images/user.jpg" alt=""><!--Anh dai dien cua user-->
                            </div>
                            <div class="post-infor">
                                <p class="name">${d.user.nickname}</p><!--Lay nickname tu database-->
                                <span class="time"></span> <!--Lay timedate post tu database-->
                            </div>
                                <div style="padding: 10px"><a href="postdelete?postID=${d.postID}">Delete</a></div>
                                <div style="padding: 10px"><a href="postedit?postID=${d.postID}">Edit</a></div>

                        </div>
                        <div class="post-content">
                            ${d.getDescription()}
                        </div>
                        <div class="post-bottom">
                            <div class="action">
                                <i class="fa-solid fa-thumbs-up"></i>
                                <span>${d.getLiked()}</span>
                            </div>
                            <div class="action">
                                <i class="fa-solid fa-comment"></i>
                                <span>Comment</span>
                            </div>
                            <div class="action">
                                <i class="fa-solid fa-share"></i>
                                <span>Share</span>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <div class="right-panel"></div>
        </div>
    </body>

</html>
