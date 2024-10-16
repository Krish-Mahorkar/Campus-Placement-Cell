<%-- 
    Document   : index
    Created on : Mar 30, 2018, 12:32:49 AM
    Author     : Brothers
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Training & placement Cell</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
        <link rel="stylesheet" type="text/css" href="css/style.css" />
        
        <script src="css/jquery.min.js"></script>
        <script src="css/bootstrap.min.js"></script>
    </head>
    <body>
        <div class="container">
            <div class="row" style="margin-top: 10px">
                <div class="col-md-3 text-center">
                    <img src="images/dte_logo.gif" style="width:110px"/>
                </div>
                <div class="col-md-9">
                    <h5 class="text-center">Government Polytechnic, Arvi</h5>
                    <h1 class="text-center">Training & Placement Cell</h1>
                    <h6 class="text-center">Approved by AICTE, Recognised by DTE & Affiliated to MSBTE</h6>
                </div>
            </div>
           
            <div class="row" style=" margin-top: 20px;">
                 <%@ include file="includes/main-sidebar.jsp" %>
                <div class="col-md-9" style="padding: 0px">
                    <h3 style="margin: 0px; color:#fff; background-color: #f3974e; border-top-left-radius: 4px; border-top-right-radius: 4px; padding: 8px;">Welcome to Training & placement Cell</h3>
                    <div style="border:1px solid #ddd; width: 100%; padding: 8px; display: inline-block;" class="text-justify">
                        <h4><b>Vision</b></h4> 
To become a globally recognised technical educational institute, committed to produce competent manpower, fulfilling needs of industry and society.
<h4><b>Mission</b></h4>
*Impart technical knowledge effectively through well qualified and trained faculty.
*Contribute towards curriculum and resource updating, incorporating latest technological trends.
*Equip students with technical skills and intellectual capability to meet current industrial needs.
*Inculcate values and ethics in students for contribution towards social development 
                        <br><center><img src="images/dte_logo.gif" style="width:100px"/></center><br>
                       <h4>List of Departments:</h4>
                       <ul>
                           <li>Computer Engineering</li>
                           <li>Electrical Engineering</li>
                           <li>Electronics Telecommunication & Engineering</li>
                           <li>Civil Engineering</li>
                           <li>Chemical Engineering</li>
                           <li>Mechanical Engineering</li>
                       </ul>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>