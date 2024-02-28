<%-- 
    Document   : view_dataset
    Created on : 1 Mar, 2022, 5:34:22 PM
    Author     : Beast
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="CricPrediction.SQLconnection"%>
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
        <link href="assets/js/dataTables/dataTables.bootstrap.css" rel="stylesheet" />
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
             "> 
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
        <script>alert('Data Preprocessed ');</script>  
        <%}
        %>
        <!-- LOGO HEADER END-->

        <!-- MENU SECTION END-->
        <div class="content-wrapper">
            <br><br><br><br>
                            <div class="container">
                                <div class="row pad-botm">
                                    <div class="col-md-12">
                                        <h4 class="header-line">Preview</h4>
                                    </div>
                                </div>

                                <div class="row" >
                                    <div class="col-md-12">
                                        <!-- Advanced Tables -->
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                Training Data
                                            </div>
                                            <div class="panel-body"  >
                                                <div class="table-responsive"  >
                                                    <table class="table table-striped table-bordered table-hover" id="dataTables-example" >
                                                        <thead>
                                                            <tr>
                                                                <%--<th>Team</th>--%>
                                                                <th>Score</th>
                                                                <th>Overs</th>
                                                                <th>RPO</th>
                                                                <th>Inns</th>
                                                                <th>Opposition</th>
                                                                <%--<th>Ground</th>--%>
                                                                <%--<th>Date</th>--%>
                                                                <th>Result</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <%
                                                                Connection con = SQLconnection.getconnection();
                                                                Statement st = con.createStatement();
                                                                try {
                                                                    ResultSet rs = st.executeQuery("Select * from indiadata");
                                                                    while (rs.next()) {
                                                            %>
                                                            <tr class="odd gradeX">
                                                                <%--<td class="center"><%=rs.getString("Team")%></td>--%>
                                                                <td class="center"><%=rs.getString("Score")%></td>
                                                                <td class="center"><%=rs.getString("Overs")%></td>
                                                                <td class="center"><%=rs.getString("RPO")%></td>
                                                                <td class="center"><%=rs.getString("Inns")%></td>
                                                                <td class="center"><%=rs.getString("Opposition")%></td>
                                                                <%--<td class="center"><%=rs.getString("Ground")%></td>--%>
                                                                <%--<td class="center"><%=rs.getString("StartDate")%></td>--%>
                                                                <td class="center"><%=rs.getString("Result")%></td>
                                                                <%                                        }
                                                                    } catch (Exception ex) {
                                                                        ex.printStackTrace();
                                                                    }

                                                                %>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                            <br><br><br>
                                                                        <center> <form action="datat" method="post">
                                                                                <input type="hidden" value="data" name="data">
                                                        <button type="submit" class="btn btn-info">Proceed to Predict</button>
                                                                            </form></center>
                                                </div>

                                            </div>
                                        </div>
                                        <!--End Advanced Tables -->
                                    </div>
                                </div>
                            </div>
                            </div>
                            <!-- CONTENT-WRAPPER SECTION END-->
                            <section class="footer-section" >
                                <div class="container">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <a>VAYMV</a> 
                                        </div>
                                    </div>
                                </div>
                            </section>
        </div>
                            </body>
                            <!-- FOOTER SECTION END-->
                            <!-- JAVASCRIPT FILES PLACED AT THE BOTTOM TO REDUCE THE LOADING TIME  -->
                            <!-- CORE JQUERY  -->
                            <script src="assets/js/jquery-1.10.2.js"></script>
                            <!-- BOOTSTRAP SCRIPTS  -->
                            <script src="assets/js/bootstrap.js"></script>
                            <script src="scripts/script.js"></script>
                            <!-- CUSTOM SCRIPTS  -->
                            <script src="assets/js/custom.js"></script>
                            <script src="assets/js/dataTables/jquery.dataTables.js"></script>
                            <script src="assets/js/dataTables/dataTables.bootstrap.js"></script>
                            
                            
                            </html>