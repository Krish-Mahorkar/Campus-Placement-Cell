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
                    <h3 style="margin: 0px; color:#fff; background-color: #f3974e; border-top-left-radius: 4px; border-top-right-radius: 4px; padding: 8px;">Admin Login</h3>
                    <div style="border:1px solid #ddd; width: 100%; padding: 8px;  display: inline-block;" class="text-justify">
                        <div class="col-md-4" style="margin: auto; margin-bottom: 20px;">
                            <br>
                            <form action="" method="POST">
                                <div class="col-md-12">
                                <label>Username</label><br>
                                <input type="text" class="form-control" name="username" id="username" required/>
                                </div>
                                <div class="col-md-12"><br>
                                <label>Password</label><br>
                                <input type="password" class="form-control" name="password" id="password" required/>
                                </div>
                                <div class="col-md-12"><br>
                                    <button type="button" class="btn btn-default login">Login</button>
                                    <button type="reset" class="btn btn-default">Reset</button>
                                </div>
                            </form>
                        </div>
                        <br><br><br>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
<script>
    $(document).on("click",".login",function(){
       var user= document.getElementById("username").value;
       var pass= document.getElementById("password").value;
       if(user==""){
           alert("Please enter username.");
           document.getElementById("username").focus();
       }else if(pass==""){
           alert("Please enter password.");
           document.getElementById("password").focus();
       }else{
          $.ajax({
              url:"WebService.jsp",
              method:"post",
              data:{"action":"adminlogin","username":user,"password":pass},
              success:function(res){
                  //alert(res);
                  if(res==1){
                      window.location.href="admin/home.jsp";
                  }else{
                      alert("Username/Password Invalid!");
                  }
              }
          });
       }
    });
    </script>