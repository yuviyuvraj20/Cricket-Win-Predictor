<%@page contentType="text/html" pageEncoding="UTF-8"%>﻿
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <!--[if IE]>
            <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
            <![endif]-->
        <title>Cricket Win Predictor Using Random Forest</title>
        <!-- BOOTSTRAP CORE STYLE  -->
        <link href="assets/css/bootstrap.css" rel="stylesheet" />
        <!-- FONT AWESOME STYLE  -->
        <link href="assets/css/font-awesome.css" rel="stylesheet" />
        <!-- CUSTOM STYLE  -->
        <link href="assets/css/style.css" rel="stylesheet" />
        <!-- GOOGLE FONT -->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />

    </head>
    <body>
        <div class="navbar-fixed-top navbar-inverse set-radius-zero" style="background-color: #0093E9;
background-image: linear-gradient(160deg, #0093E9 0%, #80D0C7 100%);
" >
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <h2 style="color: white">Cricket Win Predictor</h2>
                    
                </div>
            </div>
            <section class="menu-section" style="">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="navbar-collapse collapse ">
                            <ul id="menu-top" class="nav navbar-nav navbar-right">
                                <li><a href="admin.jsp" >Admin</a></li>
                            </ul>
                        </div>
                    </div>

                </div>
            </div>
        </section>
        </div>
        
                <%
            if (request.getParameter("failed") != null) {%>
        <script>alert('Authentication failed');</script>  
        <%}
        %>
        <!-- LOGO HEADER END-->
        
        <!-- MENU SECTION END-->
             <div class="content-wrapper">
             <br><br><br><br>
            <div class="container">
                <div class="row pad-botm">
                    <div class="col-md-12">
                        <h4 class="header-line">Cricket Win Predictor</h4>
                    </div>
                </div>
               
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="alert alert-info">
                                            <img width="900" src="images/predict.jpg" alt="Background">
                                        </div>
                                    </div>

                                </div>
                                </div>
                                </div>
        <!-- CONTENT-WRAPPER SECTION END-->
        <section class="footer-section">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <a>Yuvraj Saini</a> 
                    </div>
                </div>
            </div>
        </section>
        <!-- FOOTER SECTION END-->
        <!-- JAVASCRIPT FILES PLACED AT THE BOTTOM TO REDUCE THE LOADING TIME  -->
        <!-- CORE JQUERY  -->
        <script src="assets/js/jquery-1.10.2.js"></script>
        <!-- BOOTSTRAP SCRIPTS  -->
        <script src="assets/js/bootstrap.js"></script>
        <!-- CUSTOM SCRIPTS  -->
        <script src="assets/js/custom.js"></script>
    </body>
</html>
