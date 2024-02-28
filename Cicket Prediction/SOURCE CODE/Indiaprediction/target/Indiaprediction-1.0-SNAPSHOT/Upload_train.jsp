<%-- 
    Document   : Upload_train
    Created on : 28 Feb, 2022, 2:12:42 AM
    Author     : Beast
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="icon" type="image/png" href="images/favicon-32x32.png" sizes="32x32" />
        <link rel="icon" type="image/png" href="images/favicon-16x16.png" sizes="16x16" />
        <title>Cricket Prediction</title>
        <!--stylesheet-->
        <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,700,900" rel="stylesheet">
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link href="styles/styles.css" rel="stylesheet" type="text/css">
        <link href="styles/custom-responsive-styles.css" rel="stylesheet" type="text/css">
        <!--scripts-->
        <script type="text/javascript" src="scripts/jquery-3.2.1.min.js"></script>
        <script type="text/javascript" src="scripts/all-plugins.js"></script>
        <script type="text/javascript" src="scripts/plugins-activate.js"></script>
    </head>

    <body id="page-top">
        <!-- Navigation -->
        <div class="logo">
            <i class="fa fa-search-plus" aria-hidden="true"><span>Cricket Prediction</span></i>
        </div>
        <a class="menu-toggle rounded" href="#">
            <i class="fa fa-bars"></i>
        </a>
        <nav id="sidebar-wrapper">
            <ul class="sidebar-nav">
                <li class="sidebar-brand">
                    <a class="smooth-scroll" href="#Header"></a>
                </li>
                <li class="sidebar-nav-item">
                    <a class="smooth-scroll" href="#">Login</a>
                </li>
            </ul>
        </nav>
        <%
          if (request.getParameter("failed") != null) {%>
        <script>alert('Authentication Failed');</script>  
        <%}
        %>
        <section id="Contact" class="content-section">
            <div class="container">
                <div class="block-heading">
                    <h2>Upload Training Data</h2>
                    <p></p>
                </div>
                <div class="row">
                    <div class="col-sm-12 col-md-4 col-lg-4">
                    </div>
                    <div class="col-sm-12 col-md-6 col-lg-6">
                        <div class="form-wrap">
                            <form action="admin" method="post">
                                <div class="fname floating-label">
                                    <label for="title">File</label>
                                    <br>
                                    <input type="file" class="floating-input" name="datafile" />

                                </div>
                                <div class="submit-btn">
                                    <button type="submit">Submit</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <footer class="footer text-center">
            <div class="container">
                <ul class="list-inline">
                    <li class="list-inline-item">
                        <a class="social-link rounded-circle text-white mr-3" href="javascript:void(0)">
                            <i class="fa fa-facebook" aria-hidden="true"></i>
                        </a>
                    </li>
                    <li class="list-inline-item">
                        <a class="social-link rounded-circle text-white mr-3" href="javascript:void(0)">
                            <i class="fa fa-twitter" aria-hidden="true"></i>
                        </a>
                    </li>
                    <li class="list-inline-item">
                        <a class="social-link rounded-circle text-white" href="javascript:void(0)">
                            <i class="fa fa-linkedin" aria-hidden="true"></i>
                        </a>
                    </li>
                </ul>
                <p class="text-muted small mb-0">Cricket Win Prediction</p>
            </div>
        </footer>
    </body>
</html>

