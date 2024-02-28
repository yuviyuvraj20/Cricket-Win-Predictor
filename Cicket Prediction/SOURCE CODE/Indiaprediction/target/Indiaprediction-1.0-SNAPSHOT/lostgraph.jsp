<%-- 
    Document   : graph
    Created on : 2 Mar, 2022, 4:26:00 AM
    Author     : Beast
--%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="CricPrediction.SQLconnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page import="java.util.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
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
                <div class="right-div">
                    <a href="index.jsp" class="btn btn-danger pull-right">LOG ME OUT</a>
                </div>
            </div>
            <section class="menu-section" style="">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="navbar-collapse collapse ">
                                <ul id="menu-top" class="nav navbar-nav navbar-right">
                                   <li><a href="Home.jsp">Home</a></li>
                                    <li><a href="Training.jsp">Training Data</a></li>
                                    <li><a href="Prediction.jsp" >Prediction</a></li>
                                    <li><a href="Graph.jsp" >Graph Analyze</a></li>

                                </ul>
                            </div>
                        </div>

                    </div>
                </div>
            </section>
        </div>



        <%
            if (request.getParameter("success") != null) {%>
        <script>alert('Authentication Success');</script>  
        <%}
        %>
        <!-- LOGO HEADER END-->

        <!-- MENU SECTION END-->
        <div class="content-wrapper">
            <br><br><br><br>
                            <div class="container">
                                <div class="row pad-botm">
                                    <div class="col-md-12">
                                        <h4 class="header-line">Graph</h4>
                                    </div>
                                </div>
                                <%
                                    Gson gsonObj = new Gson();
                                    String dataPoints = null;
                                    Map<Object, Object> map = new HashMap<>();
                                    List<Map<Object, Object>> list = new ArrayList<>();

                                    //try{
                                    Connection connection = SQLconnection.getconnection();
                                    Statement statement = connection.createStatement();
                                    String xVal, yVal;

                                    ResultSet resultSet = statement.executeQuery("SELECT opposition, count(case when result = 'lost' then 1 else null end  ) as res  FROM indiadata GROUP BY opposition order by res desc ");
                                    ResultSetMetaData rsmd = resultSet.getMetaData();

                                    while (resultSet.next()) {
                                        xVal = resultSet.getString("opposition");
                                        yVal = resultSet.getString("res");
                                        //System.out.println(xVal.replace("v ", ""));
                                        // System.out.println(yVal);
                                        map = new HashMap<Object, Object>();
                                        map.put("y", yVal);
                                        map.put("name", xVal.replace("v ", ""));
                                        list.add(map);
                                        //System.out.println("className.methodName() "+list);
                                        dataPoints = gsonObj.toJson(list);

                                    }
                                    System.out.println("className.methodName()" + dataPoints);
                                    connection.close();
                 //	}
                                    //catch(SQLException e){
                                    //	out.println("<div class='alert alert-danger' style='margin:1%;'>Could not connect to the database. Please check if you have mySQL Connector installed on the machine - if not, try installing the same. Please refer to Instruction.txt</div>");
                                    //}


                                %>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="panel panel-primary">
                                            <div class="panel-heading">
                                                Matches Lost Analysis
                                            </div>
                                            <div class="panel-body">
                                                <div style="height: 500px;width: 900px" id="chartContainer"></div>

                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <script type="text/javascript">
                                window.onload = function () {

                                    var chart = new CanvasJS.Chart("chartContainer", {
                                        exportEnabled: true,
                                        animationEnabled: true,
                                        title: {
                                            text: "India Lost Analysis"
                                        },
                                        legend: {
                                            cursor: "pointer",
                                            itemclick: explodePie
                                        },
                                        data: [{
                                                type: "pie",
                                                showInLegend: true,
                                                toolTipContent: "{name}: <strong>{y}</strong>",
                                                indexLabel: "{name} - {y}"                            ,
                                                dataPoints: <%=dataPoints%>
                                            }]
                                    });
                                    chart.render();
                                    function explodePie(e) {
                                        if (typeof (e.dataSeries.dataPoints[e.dataPointIndex].exploded) === "undefined" || !e.dataSeries.dataPoints[e.dataPointIndex].exploded) {
                                            e.dataSeries.dataPoints[e.dataPointIndex].exploded = true;
                                        } else {
                                            e.dataSeries.dataPoints[e.dataPointIndex].exploded = false;
                                        }
                                        e.chart.render();

                                    }
                                }
                            </script>
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
                            <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
                            <script src="assets/js/custom.js"></script>
                            </body>
                            </html>


