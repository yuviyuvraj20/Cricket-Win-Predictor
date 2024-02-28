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
                        <h2 style="color: white">Cricket Win Predictor DMT project</h2>

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
            <script>alert('Prediction Done');</script>  
            <%}
            %>
            <!-- LOGO HEADER END-->

            <!-- MENU SECTION END-->


            <%
                String won = request.getParameter("won_ratio");
                String lost = request.getParameter("lost_ratio");
                String result = request.getParameter("result");
                
            %>
            <div class="content-wrapper">
                <br><br><br><br>
                                <div class="container">
                                    <div class="row pad-botm">
                                        <div class="col-md-12">
                                            <h4 class="header-line">Prediction accuracy of trained model being: 92.33% </h4>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="panel panel-primary">
                                                <div class="panel-heading">
                                                    Predicted Result  : <%=result%> 
                                                </div>
                                                <div class="panel-body col-md-12">
                                                    <div style="height: 500px;padding-left: 150px" id="chartContainer">WinProb  : <%=won%> <br> LossProb  : <%=lost%></div>

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
                                </body>
                                <script>
                                    <%--window.onload = function () {

                                        var chart = new CanvasJS.Chart("chartContainer", {
                                            exportEnabled: true,
                                            animationEnabled: true,
                                            title: {
                                                text: "Prediction"
                                            },
                                            legend: {
                                                cursor: "pointer",
                                                itemclick: explodePie
                                            },
                                            data: [{
                                                    type: "pie",
                                                    showInLegend: true,
                                                    toolTipContent: "{name}: <strong>{y}</strong>",
                                                    indexLabel: "{name} - {y}",
                                                    dataPoints: [
                                                        {y: <%=won%>, name: "Match Won", exploded: true},
                                                        {y: <%=lost%>, name: "Match Lost"}
                                                    ]
                                                }]
                                        });
                                        chart.render();
                                    }

                                    function explodePie(e) {
                                        if (typeof (e.dataSeries.dataPoints[e.dataPointIndex].exploded) === "undefined" || !e.dataSeries.dataPoints[e.dataPointIndex].exploded) {
                                            e.dataSeries.dataPoints[e.dataPointIndex].exploded = true;
                                        } else {
                                            e.dataSeries.dataPoints[e.dataPointIndex].exploded = false;
                                        }
                                        e.chart.render();

                                    }--%>
                                </script>

                                <!-- FOOTER SECTION END-->
                                <!-- JAVASCRIPT FILES PLACED AT THE BOTTOM TO REDUCE THE LOADING TIME  -->
                                <!-- CORE JQUERY  -->
                                <script src="assets/js/jquery-1.10.2.js"></script>
                                <!-- BOOTSTRAP SCRIPTS  -->
                                <script src="assets/js/bootstrap.js"></script>
                                <script src="scripts/script.js"></script>
                                <!-- CUSTOM SCRIPTS  -->
                                <script src="assets/js/custom.js"></script>
                                <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>

                                </html>

