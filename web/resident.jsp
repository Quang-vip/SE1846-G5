<%-- 
    Document   : resident
    Created on : May 21, 2024, 1:19:48 PM
    Author     : Long
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="model.*" %>
<%@ page import="java.util.*" %>
<%@ page import="jakarta.servlet.http.Cookie" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Resident</title>
    <%
    List<NotificationAlert> notilist = (List<NotificationAlert>) session.getAttribute("notilist");       
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
        %>  
    <style media="screen">
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap');

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: "Poppins", sans-serif;
        }

        body {
            min-height: 100vh;
            background: white;
            color: white;
            background-size: cover;
            background-position: center;
        }

        .side-bar {
            background: #1b1a1b;
            backdrop-filter: blur(15px);
            width: 250px;
            height: 100vh;
            position: fixed;
            top: 0;
            left: -250px;
            overflow-y: auto;
            transition: 0.6s ease;
            transition-property: left;
        }

        .side-bar::-webkit-scrollbar {
            width: 0px;
        }



        .side-bar.active {
            left: 0;
        }

        h1 {

            text-align: center;
            font-weight: 500;
            font-size: 25px;
            padding-bottom: 13px;
            font-family: sans-serif;
            letter-spacing: 2px;
        }

        .side-bar .menu {
            width: 100%;
            margin-top: 30px;
        }

        .side-bar .menu .item {
            position: relative;
            cursor: pointer;
        }

        .side-bar .menu .item a {
            color: #fff;
            font-size: 16px;
            text-decoration: none;
            display: block;
            padding: 5px 30px;
            line-height: 60px;
        }

        .side-bar .menu .item a:hover {
            background: #33363a;
            transition: 0.3s ease;
        }

        .side-bar .menu .item i {
            margin-right: 15px;
        }

        .side-bar .menu .item a .dropdown {
            position: absolute;
            right: 0;
            margin: 20px;
            transition: 0.3s ease;
        }

        .side-bar .menu .item .sub-menu {
            background: #262627;
            display: none;
        }

        .side-bar .menu .item .sub-menu a {
            padding-left: 80px;
        }

        .rotate {
            transform: rotate(90deg);
        }

        .close-btn {
            position: absolute;
            color: #fff;

            font-size: 23px;
            right: 0px;
            margin: 15px;
            cursor: pointer;
        }

        .menu-btn {
            position: absolute;
            color: rgb(0, 0, 0);
            font-size: 35px;
            margin: 25px;
            cursor: pointer;
        }

        .main {
            color: black;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 50px;
        }

        .main h1 {
            font-size: 60px;
            text-align: center;
            line-height: 80px;
        }

        .apartment-list {
            display: flex;
            gap: 20px;
            flex-wrap: wrap;
        }

        .apartment-item {
            flex: 1 1 calc(33.333% - 40px);
            background-color: #f9f9f9;
            padding: 20px;
            border-radius: 8px;
            text-align: center;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
        }

        .apartment-item:hover {
            transform: translateY(-5px);
        }

        .apartment-item img {
            max-width: 100%;
            height: auto;
            border-radius: 8px;
            margin-bottom: 15px;
        }

        .apartment-item h2 {
            font-size: 20px;
            margin-bottom: 10px;
            color: #333;
        }
        .container {
            margin-left: 500px;
            margin-top: 100px;
            padding: 20px;
            max-width: 1200px;
            background-color: #fff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        button {
            display: inline-block;
            padding: 10px 20px;
            margin-top: 10px;
            font-size: 16px;
            color: #fff;
            background-color: #007BFF;
            border: none;
            border-radius: 4px;
            text-decoration: none;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #0056b3;
        }

        @media (max-width: 900px) {
            .main h1 {
                font-size: 40px;
                line-height: 60px;
            }
        }

        img {
            width: 100px;
            margin: 15px;
            border-radius: 50%;
            margin-left: 70px;
            border: 3px solid #b4b8b9;
        }

        header {
            background: #33363a;
        }
        .bell-icon {
            cursor: pointer;
            font-size: 24px;
            position: absolute;
            right: 10px;
            top: 10px;
        }
        .notification-box {
            display: none;
            border: 1px solid #ccc;
            background: #fff;
            padding: 10px;
            position: absolute;
            right: 10px;
            top: 40px;
            width: 300px;
            max-height: 400px;
            overflow-y: auto;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .notification-item {
            border-bottom: 1px solid #ddd;
            padding: 5px;
        }
        .notification-item:last-child {
            border-bottom: none;
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" charset="utf-8"></script>
</head>

<body>

    <div class="menu-btn">
        <i class="fas fa-bars"></i>
    </div>


    <div class="side-bar">

        <header>



            <div class="close-btn">

                <i class="fas fa-times"></i>
            </div>
            <img src=""
                alt="">
            <h1>Welcome</h1>
           
        </header>
        <div class="menu">
            <div class="item"><a href="#"><i class="fas fa-desktop"></i>Dashboard</a></div>
            <div class="item">
                <a class="sub-btn"><i class="fas fa-table"></i>Services<i class="fas fa-angle-right dropdown"></i></a>
                <div class="sub-menu">
                    <a href="requestservice.jsp" class="sub-item">Request</a>
                    <a href="addworker.jsp" class="sub-item">Add workers</a>
                    <a href="updateapartmenttype.jsp" class="sub-item">Update apart</a>
                </div>
            </div>
            <div class="item"><a href="#"><i class="fas fa-th"></i>Forms</a></div>
            <div class="item">
                <a class="sub-btn"><i class="fas fa-cogs"></i>Settings<i class="fas fa-angle-right dropdown"></i></a>
                <div class="sub-menu">
                    <a href="userDetails" class="sub-item">Account details</a>
                    <a href="#" class="sub-item">        <%
                        String username = null;
                        Cookie[] cookies = request.getCookies();
                        if (cookies != null) {
                            for (Cookie cookie : cookies) {
                                if (cookie.getName().equals("user")) {
                                    username = cookie.getValue();
                                    break;
                                }
                            }
                        }
                        if (username != null) {
                            out.println("<a href='LogoutServlet'>Logout</a>");
                        } else {
                            response.sendRedirect("login.jsp");
                            return;
                        }
                    %></a>
                </div>
            </div>
            <div class="item"><a href="#"><i class="fas fa-info-circle"></i>About</a></div>
        </div>
    </div>
    <section class="main">
        <div>
            <span class="bell-icon" onclick="toggleNotificationBox()">🔔</span>
            <div id="notificationBox" class="notification-box">
                <%
                    if (notilist != null && !notilist.isEmpty()) {
                        for (NotificationAlert notification : notilist) {
                        if(notification.isNotiStatus()){
                %>
                <div class="notification-item" style="background-color:#f0f0f0">
                    <%= notification.toString() %>
                </div>
                <%
                    }else{%>
                <div class="notification-item">
                    <%= notification.toString() %>
                </div>
                <%}              
                }
                    } else {
                %>
                <div class="notification-item">No notifications</div>
                <%
                    }
                %>
            </div>
        </div>
    </section>

    <script type="text/javascript">
        $(document).ready(function () {
            //jquery for toggle sub menus
            $('.sub-btn').click(function () {
                $(this).next('.sub-menu').slideToggle();
                $(this).find('.dropdown').toggleClass('rotate');
            });

            //jquery for expand and collapse the sidebar
            $('.menu-btn').click(function () {
                $('.side-bar').addClass('active');
                $('.menu-btn').css("visibility", "hidden");
            });

            $('.close-btn').click(function () {
                $('.side-bar').removeClass('active');
                $('.menu-btn').css("visibility", "visible");
            });
        });
        function toggleNotificationBox() {
                var notificationBox = document.getElementById('notificationBox');
                if (notificationBox.style.display === 'none' || notificationBox.style.display === '') {
                    notificationBox.style.display = 'block';
                } else {
                    notificationBox.style.display = 'none';
                }
            }
    </script>

</body>

</html>