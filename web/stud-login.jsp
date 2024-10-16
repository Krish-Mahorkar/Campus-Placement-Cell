
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
                    
                    <div style="border:1px solid #ddd; width: 100%; padding: 8px;  display: inline-block;" class="text-justify">
                        <div class="col-md-4" style="margin: auto; margin-bottom: 20px;">
                            <h3 style="margin: 0px; color:#fff; background-color: #e0472a; padding: 8px;">Student Login</h3>
                            <br>
                            <form action="" method="POST">
                                <div class="col-md-12">
                                <label>Enroll No.</label><br>
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
                        <div class="col-md-8" style="margin: auto; margin-bottom: 20px;">
                            <h3 style="margin: 0px; color:#fff; background-color: #e0472a; padding: 8px;">Student Registration</h3>
                            <form action="WebService.jsp" method="POST">
                                <div class="col-md-6"><br>
                                <label>Name</label><br>
                                <input type="text" class="form-control" name="name" maxlength="50" id="name" required/>
                                </div>
                                <div class="col-md-6"><br>
                                <label>Enrollment Number :</label><br>
                                <input type="text" class="form-control" name="enrolno" pattern="[0-9]{1}[0-9]{9}" 
       title="Please enter 10 digit enrollment number" maxlength="10" id="enrolno" required/>
                                </div>
                                <div class="col-md-6"><br>
                                <label>Mobile No.</label><br>
                                <input type="text" class="form-control" name="mobno" maxlength="10" pattern="[0-9]{1}[0-9]{9}" 
       title="Please enter 10 digit mobile number" id="mobno" required/>
                                </div>
                                <div class="col-md-6"><br>
                                <label>Email Id</label><br>
                                <input type="email" class="form-control" name="email" maxlength="50" id="email" required/>
                                </div>
                                <div class="col-md-6"><br>
                                <label>Address</label><br>
                                <input type="text" class="form-control" name="address" maxlength="50" id="address" required/>
                                </div>
                                <div class="col-md-6"><br>
                                <label>Branch</label><br>
                                <select class="form-control" name="branch" id="branch" required>
                                    <option value="">Select</option>
                                    <option value="Computer Engineering">Computer Engineering</option>
                                    <option value="Electrical Engineering">Electrical Engineering</option>
                                    <option value="Electronics Telecommunication & Engineering">Electronics Telecommunication & Engineering</option>
                                    <option value="Civil Engineering">Civil Engineering</option>
                                    <option value="Chemical Engineering">Chemical Engineering</option>
                                    <option value="Mechanical Engineering">Mechanical Engineering</option>
                                </select>
                                </div>
                                <div class="col-md-3"><br>
                                <label>Year/Sem</label><br>
                                <select class="form-control" name="year" id="year" required>
                                    <option value="">Select</option>
                                    <option value="1st Year- 1st Semester">1st Year- 1st Semester</option>
                                    <option value="1st Year- 2nd Semester">1st Year- 2nd Semester</option>
                                    <option value="2nd Year- 1st Semester">2nd Year- 3rd Semester</option>
                                    <option value="2nd Year- 2nd Semester">2nd Year- 4th Semester</option>
                                    <option value="3rd Year- 1st Semester">3rd Year- 5th Semester</option>
                                    <option value="3rd Year- 2st Semester">3rd Year- 6th Semester</option>
                                </select>
                                </div>
                                <div class="col-md-4"><br>
                                <label>Password</label><br>
                                <input type="password" class="form-control" name="npassword" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" id="npassword" required/>
                                </div>
                                <div class="col-md-4"><br>
                                <label>Confirm Password</label><br>
                                <input type="password" class="form-control" name="cpassword" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" id="cpassword" required/>
                                </div>
                                <div class="col-md-12"><br>
                                    <button type="button" class="btn btn-default register">Register</button>
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
    $(document).on("click",".register",function(){
       var name= document.getElementById("name").value;
       var enrolno= document.getElementById("enrolno").value;
       var mobno= document.getElementById("mobno").value;
       var email= document.getElementById("email").value;
       var address= document.getElementById("address").value;
       var branch= document.getElementById("branch").value;
       var year= document.getElementById("year").value;
       var password= document.getElementById("npassword").value;
       var cpassword= document.getElementById("cpassword").value;
       
       if(name==""){
           alert("Please enter name.");
           document.getElementById("name").focus();
       }else if(enrolno==""){
           alert("Please enter enrolment no.");
           document.getElementById("enrolno").focus();
       }else if(enrolno.length!=10){
           alert("Please enter valid enrolment no.");
           document.getElementById("enrolno").focus();
       }else if(!$.isNumeric(enrolno)){
           alert("Please enter valid enrolment no.");
           document.getElementById("enrolno").focus();
       }else if(mobno==""){
           alert("Please enter mobile no.");
           document.getElementById("mobno").focus();
       }else if(!$.isNumeric(mobno)){
           alert("Please enter valid mobile no.");
           document.getElementById("mobno").focus();
       }else if(mobno.length!=10){
           alert("Please enter valid mobile no.");
           document.getElementById("mobno").focus();
       }else if(email==""){
           alert("Please enter email id");
           document.getElementById("email").focus();
       }else if(address==""){
           alert("Please enter address");
           document.getElementById("address").focus();
       }else if(branch==""){
           alert("Please enter branch.");
           document.getElementById("branch").focus();
       }else if(year==""){
           alert("Please enter year/sem.");
           document.getElementById("year").focus();
       }else if(password==""){
           alert("Please enter password.");
           document.getElementById("password").focus();
       }else if(cpassword==""){
           alert("Please enter confirm password.");
           document.getElementById("cpassword").focus();
       }else if(password.length<8){
           alert("Please enter more that 8 digit password");
           document.getElementById("password").focus();
       }else if(cpassword.length<8){
           alert("Please enter more that 8 digit password");
           document.getElementById("cpassword").focus();
       }else if(password!=cpassword){
           alert("Password not matched.");
           document.getElementById("password").focus();
       }else{
          $.ajax({
              url:"WebService.jsp",
              method:"post",
              data:{"action":"studentreg","name":name,"enrolno":enrolno,"mobno":mobno,"email":email,"address":address,"branch":branch,"year":year,"password":password},
              success:function(res){
                  //alert(res);
                  if(res==1){
                      alert("Student Registered Successfully!");
                      window.location.reload();
                  }else{
                      alert("Something Wrong!");
                  }
              }
          });
       }
    });
    
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
              data:{"action":"studlogin","username":user,"password":pass},
              success:function(res){
                  //alert(res);
                  if(res==1){
                      window.location.href="student/home.jsp";
                  }else{
                      alert("Username/Password Invalid!");
                  }
              }
          });
       }
    });
    </script>