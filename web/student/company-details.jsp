<%-- 
    Document   : index
    Created on : Mar 30, 2018, 12:32:49 AM
    Author     : Brothers
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="database.Database"%>
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
                    <h3 style="margin: 0px; color:#fff; background-color: #f3974e; border-top-left-radius: 4px; border-top-right-radius: 4px; padding: 8px;">Company Details </h3>
                    <div style="border:1px solid #ddd; width: 100%; padding: 8px; display: inline-block;" class="text-justify">
                        <table class="table table-bordered table-striped table-hover table-responsive">
                            <tbody>
                                <%
                                Database db=new Database();
                                int id=Integer.parseInt(request.getParameter("id"));
                                ResultSet rs=db.getCompanyDetails(id);
                                if(rs!=null){
                                    while(rs.next()){
                                %>
                                <tr><th>Company Name</th><th><%=rs.getString("company_name")%></th><th>Company Address</th><th><%=rs.getString("address")%></th></tr>
                                <tr><th>Position</th><th><%=rs.getString("position")%></th><th>Seats</th><th><%=rs.getString("seats")%></th></tr>
                                <tr><th>Package</th><th><%=rs.getString("package")%></th><th>Website</th><th><%=rs.getString("website")%></th></tr>
                                <tr><th>Terms & Condition</th><th><%=rs.getString("terms")%></th><th>Profile</th><th><%=rs.getString("profile")%></th></tr>
                                <tr><th>Session</th><th><%=rs.getString("session")%></th><th>Description</th><th><%=rs.getString("description")%></th></tr>
                                <%
                                    }
                                }
                                %>
                            </tbody>
                        </table>
                        <h4>Company Criteria</h4>
                        <div class="col-md-6">
                            <table class="table table-bordered">
                           <%
                               String ssc="";
                               String hsc="";
                               String sem1=""; String sem2=""; String sem3=""; String sem4=""; String sem5="";
                               String curr="";
                           ResultSet crs=db.getCompanyCriteria(id);
                           if(crs!=null){
                                    while(crs.next()){
                                %>
                                <tr><th>SSC</th><th><%=ssc=crs.getString("ssc")%></th></tr>
                                <tr><th>HSC</th><th><%=hsc=crs.getString("hsc")%></th></tr>
                                <tr><th>Sem1</th><th><%=sem1=crs.getString("sem1")%></th></tr>
                                <tr><th>Sem2</th><th><%=sem2=crs.getString("sem2")%></th></tr>
                                <tr><th>Sem3</th><th><%=sem3=crs.getString("sem3")%></th></tr>
                                <tr><th>Sem4</th><th><%=sem4=crs.getString("sem4")%></th></tr>
                                <tr><th>Sem5</th><th><%=sem5=crs.getString("sem5")%></th></tr>
                                <tr><th>Current Back</th><th><%=curr=crs.getString("current_back")%></th></tr>
                                <%
                                    }
                                }
                                %>
                            </table>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
<script>
    function remove(rid,table){
        if(confirm("Are you sure want to delete all record?")){
            $.ajax({
                method:"POST",
                url:"../WebService.jsp",
                data:{"action":"removerecord","table":table,"rid":rid},
                success:function(res){
                    //alert(res);
                    if(res==1){
                        alert("Record Removed successfully!");
                        window.location.reload();
                    }
                }
            });
        }
    }
    </script>