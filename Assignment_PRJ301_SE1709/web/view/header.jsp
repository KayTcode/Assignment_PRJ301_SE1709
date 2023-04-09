<%-- 
    Document   : header
    Created on : Mar 22, 2023, 2:29:43 AM
    Author     : anhth
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
                            <a href="logout"><button type="button" class="but-user"><i class="fa-solid fa-user"></i> Logout</button></a>  
                        </li>
                    </c:if>
                    <c:if test="${sessionScope.user.role.roleID eq 2}">
                        <li>
                            <a href="../adminmanage"><button type="button" class="but-user"><i class="fa-solid fa-user"></i> ${sessionScope.user.nickname}</button></a>
                        </li>
                        <li>
                            <a href="logout"><button type="button" class="but-user"><i class="fa-solid fa-user"></i>Logout</button></a>  
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

                    <a href="#footer" style="color: #fff;"><button type="button"><span></span>CONTACT</button></a>
                </div>
            </div>
        </div>
</html>
