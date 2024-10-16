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
        <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css" />
        <link rel="stylesheet" type="text/css" href="../css/style.css" />
        
        <script src="../css/jquery.min.js"></script>
        <script src="../css/bootstrap.min.js"></script>
    </head>
    <body>
        <div class="container">
            <div class="row" style="margin-top: 10px">
                <div class="col-md-3 text-center">
                    <img src="../images/dte_logo.gif" style="width:110px"/>
                </div>
                <div class="col-md-9">
                    <h5 class="text-center">Government Polytechnic, Arvi</h5>
                    <h1 class="text-center">Training & Placement Cell</h1>
                    <h6 class="text-center">Approved by AICTE, Recognised by DTE & Affiliated to MSBTE</h6>
                </div>
            </div>
           
            <div class="row" style=" margin-top: 20px;">
                <%@ include file="sidebar.jsp" %>
                <div class="col-md-9" style="padding: 0px">
                    <h3 style="margin: 0px; color:#fff; background-color: #f3974e; border-top-left-radius: 4px; border-top-right-radius: 4px; padding: 8px;">CHANGE PASSWORD</h3>
                    <div style="border:1px solid #ddd; width: 100%; padding: 8px; display: inline-block;" class="text-justify">
                        
                        <div class="col-md-4" style="margin:auto; float: none;">
                            <%
                            if(request.getParameter("status")!= null){
                                String login=request.getParameter("status");
                                if(login.equals("1")){
                                    %>
                                    <div class="alert alert-success">
                                        Password changed!
                                    </div>
                                    <%
                                }else{
                                    %>
                                    <div class="alert alert-danger">
                                        Current Password does not matched.
                                    </div>
                                    <%
                                }
                            }
                        %>
                        <form action="../WebService.jsp" name="updatepwd" method="post">
                            <div class="col-md-12">
                                <label>Current Password</label>
                                <input type="password" class="form-control" name="pwd" id="pwd" required="true" placeholder="********">
                            </div>
                            <div class="col-md-12"><br>
                                <label>New Password</label>
                                <input type="password" class="form-control" name="npwd" id="npwd" required="true" placeholder="********">
                            </div>
                            <div class="col-md-12"><br>
                                <label>Confirm Password</label>
                                <input type="password" class="form-control" name="cpwd" id="cpwd" required="true" placeholder="********">
                            </div>
                            <input type="hidden" name="action" value="updateuserpassword"/>
                            <div class="col-md-12 text-center"><br>
                                <a href="javascript:updatepwd();" class="btn btn-default">Submit</a>
                            </div>
                        </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>

<script>

function updatepwd(){
        var pwd=document.getElementById("pwd").value;
        var pwd1=document.getElementById("npwd").value;
        var pwd2=document.getElementById("cpwd").value;
        if(pwd==''){
            alert("Please enter password.");
        }else if(pwd1=='' || pwd2==''){
            alert("Please enter password.");
        }else if(pwd1!=pwd2){
            alert("Password does not matched.");
        }else{
            document.updatepwd.submit();
        }
    }
    </script>