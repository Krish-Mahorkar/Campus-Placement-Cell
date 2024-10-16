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
                    <h3 style="margin: 0px; color:#fff; background-color: #f3974e; border-top-left-radius: 4px; border-top-right-radius: 4px; padding: 8px;">New Event <a href="view-event.jsp" class="h4 pull-right">Events</a></h3>
                    <div style="border:1px solid #ddd; width: 100%; padding: 8px; display: inline-block;" class="text-justify">
                        
                        <div class="col-md-12" style="margin:auto; float: none;">
                          <%
                            if(request.getParameter("status")!=null){
                                if(request.getParameter("status").equals("1")){
                                    %>
                                    <div class="alert alert-success">
                                        Event Created successfully!
                                    </div>
                                    <%
                                }else{
                                    %>
                                    <div class="alert alert-danger">
                                        Something wrong!
                                    </div>
                                    <%
                                }
                            }
                            %>
                            <div class="col-md-12">
                                <div class="form-group">
                                    <input type="radio" name="eventtype" value="College Event" id="collegeevent" /> <label for="collegeevent">College Event</label>
                                    <input type="radio" name="eventtype" value="Company Event" id="companyevent" /> <label for="companyevent">Company Event</label>
                                </div>
                            </div>
                            <div id="company" style="display: none;">
                                <form action="../WebService.jsp" method="post">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Name *" name="name" required />
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Address *" name="address" required />
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <input type="text" name="position" class="form-control" placeholder="Your Position. *" required />
                                </div>
                            </div>
                            <div class="col-md-2">
                              <div class="form-group">
                                    <input type="number" class="form-control" required placeholder="Seats *" name="seats" />
                                </div>
                            </div>
                            <div class="col-md-3">
                              <div class="form-group">
                                    <input type="date" class="form-control" required placeholder="Select Date *" name="date" />
                                </div>
                            </div>
                            <div class="col-md-3">
                              <div class="form-group">
                                    <input type="text" class="form-control" required placeholder="Package *" name="package" />
                                </div>
                            </div>
                            <div class="col-md-4">
                              <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Website" name="website" />
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <textarea class="form-control" rows="3" required placeholder="Terms & Conditions *" name="terms_conditions"></textarea>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <textarea class="form-control" rows="3" placeholder="profile" name="profile"></textarea>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <textarea class="form-control" rows="3" placeholder="Description" name="description"></textarea>
                                </div>
                            </div>
                            <div class="col-md-4">
                              <div class="form-group">
                                    <input type="text" class="form-control" placeholder="session" name="session" />
                                </div>
                            </div>
                            <div class="col-md-12">
                                <input type="hidden" value="new-company" name="action"/>
                              <input type="submit" class="btn btn-success" value="Submit"/>
                            </div>
                                </form>
                            </div>
                            <div id="college" style="display: none;">
                            <form action="../WebService.jsp" method="post">
                                <div class="col-md-6">
                                <div class="form-group">
                                    <textarea class="form-control" rows="3" required="true" placeholder="Event Info" name="info"></textarea>
                                </div>
                            </div>
                            <div class="col-md-4">
                              <div class="form-group">
                                  <select class="form-control" required="true" name="branch">
                                      <option value="">Select</option>
                                      <option>Computer Engineering</option>
                                      <option>Electrical Engineering</option>
                                      <option>Electronics Telecommunication & Engineering</option>
                                      <option>Civil Engineering</option>
                                  </select>
                                </div>
                            </div>
                            <div class="col-md-4">
                              <div class="form-group">
                                    <input type="date" class="form-control" required="true" placeholder="Date" name="date" />
                                </div>
                            </div>
                                <div class="col-md-4">
                              <div class="form-group">
                                    <input type="time" class="form-control" required="true" placeholder="Time" name="time" />
                                </div>
                            </div>
                            <div class="col-md-12">
                                <input type="hidden" value="new-event" name="action"/>
                                <input type="submit" class="btn btn-success" value="Submit"/>
                              
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
    
    $("input[name='eventtype']").click(function(){
        if(this.value=="College Event"){
            $("#company").hide();
            $("#college").show();
        }else{
            $("#company").show();
            $("#college").hide();
        }
    });
    </script>