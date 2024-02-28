<%-- 
    Document   : Prediction
    Created on : 28 Feb, 2022, 12:42:44 PM
    Author     : Beast
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
﻿<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <!--[if IE]>
            <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
            <![endif]-->
        <title>Cricket Win Predictor</title>
        <!-- BOOTSTRAP CORE STYLE  -->
        <link href="assets/css/bootstrap.css" rel="stylesheet" />
        <link href="scripts/style.css" rel="stylesheet" />
        <!-- FONT AWESOME STYLE  -->
        <link href="assets/css/font-awesome.css" rel="stylesheet" />
        <!-- CUSTOM STYLE  -->
        <link href="assets/css/style.css" rel="stylesheet" />
        <!-- GOOGLE FONT -->
        <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />

    </head>
      <body>
        <div id="loader">
            <div class="preloader"></div>
            <div class="loadBar">
                <div class="progress"></div>
            </div>
        </div>
    </body>
    <body >

        <div id="page" class="hidden">
        <div class="navbar-fixed-top navbar-inverse set-radius-zero" style="background-color: #1be900;
             background-image: linear-gradient(160deg, #1be900 0%, #80D0C7 100%);
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
                <div class="right-div">
                    <a href="index.jsp" class="btn btn-danger pull-right">LOGOUT</a>
                </div>
            </div>
            <section class="menu-section" style="">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="navbar-collapse collapse ">
                                <ul id="menu-top" class="nav navbar-nav navbar-right">
                                    <li><a href="Home.jsp">Home</a></li>
                                    <li><a href="Training.jsp">Train</a></li>
                                    <li><a href="Prediction.jsp" >Predict</a></li>
                                        <%--<li><a href="Graph.jsp" >Graph Analyze</a></li>--%>

                                </ul>
                            </div>
                        </div>

                    </div>
                </div>
            </section>
        </div>

        <%
            if (request.getParameter("success") != null) {%>
        <script>alert('Training Finished');</script>  
        <%}
        %>
        <%
            if (request.getParameter("failed") != null) {%>
        <script>alert('Upload The Training Dataset');</script>  
        <%}
        %>
        <!-- LOGO HEADER END-->

        <!-- MENU SECTION END-->
        <div class="content-wrapper">
            <br><br><br><br>
                            <div class="container">
                                <div class="row pad-botm">
                                    <div class="col-md-12">
                                        <h4 class="header-line">Prediction accuracy of trained model being: 92.33%</h4>
                                        
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="panel panel-primary">
                                            <div class="panel-heading">
                                                Test Data
                                            </div>
                                            <div class="panel-body">
                                                <form role="form" action="RandomForestPredictor" method="post">
                                                    <div class="form-group">
                                                        <label>Choose the Opponent Team</label>
                                                        <select class="form-control" name="opponent">
                                                            <option value="Afghanistan">Afghanistan</option>
                                                            <option value="Australia">Australia</option>
                                                            <option value="England">England</option>
                                                            <option value="Pakistan">Pakistan</option>
                                                            <option value="Bangladesh">Bangladesh</option>
                                                            <option value="Ireland">Ireland</option>
                                                            <option value="Netherlands">Netherlands</option>
                                                            <option value="New Zealand">New Zealand</option>
                                                            <option value="South Africa">South Africa</option>
                                                            <option value="Sri Lanka">Sri Lanka</option>
                                                            <option value="United Arab Emirates">United Arab Emirates</option>
                                                            <option value="West Indies">West Indies</option>
                                                            <option value="Zimbabwe">Zimbabwe</option>
                                                        </select>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Chasing</label>
                                                        <div class="radio">
                                                            <label>
                                                                <input type="radio" name="chasing" id="optionsRadios1" value="true" checked="">True
                                                            </label>
                                                        </div>
                                                        <div class="radio">
                                                            <label>
                                                                <input type="radio" name="chasing" id="optionsRadios2" value="false">False
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Highest Individual Score In 10 Overs</label>
                                                        <input class="form-control" name="topbs10" type="text" />
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Team Score In 10 Overs</label>
                                                        <input class="form-control" name="ins10" type="text" />
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Highest Individual Score In  20 Overs</label>
                                                        <input class="form-control" name="topbs20" type="text" />
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Team Score In 20 Overs</label>
                                                        <input class="form-control" name="ins20" type="text" />
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Highest Individual Score In 30 Overs</label>
                                                        <input class="form-control"  name="topbs30" type="text" />
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Team Score In 30 Overs</label>
                                                        <input class="form-control" name="ins30" type="text" />
                                                    </div>

                                                    <center><button type="submit" class="btn btn-info">Predict</button></center>

                                                </form>
                                            </div>
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
                                            <a>VAYMV</a> 
                                        </div>
                                    </div>
                                </div>
                            </section>
        </div>
                            <!-- FOOTER SECTION END-->
                            <!-- JAVASCRIPT FILES PLACED AT THE BOTTOM TO REDUCE THE LOADING TIME  -->
                            <!-- CORE JQUERY  -->
                            <script src="assets/js/jquery-1.10.2.js"></script>
                             <script src="scripts/script.js"></script>
                            <!-- BOOTSTRAP SCRIPTS  -->
                            <script src="assets/js/bootstrap.js"></script>
                            <!-- CUSTOM SCRIPTS  -->
                            <script src="assets/js/custom.js"></script>
                            </body>
                            </html>

