<%-- 
    Document   : cleardata
    Created on : 1 Mar, 2022, 6:14:24 PM
    Author     : Beast
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="CricPrediction.SQLconnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Connection con = SQLconnection.getconnection();
            Statement st = con.createStatement();
            int i = st.executeUpdate("truncate indiadata");
        %>
        <script>window.location.replace("Training.jsp?clear");</script>
    </body>
</html>dy>
</html>
