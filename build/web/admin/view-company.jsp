
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
                    <h3 style="margin: 0px; color:#fff; background-color: #f3974e; border-top-left-radius: 4px; border-top-right-radius: 4px; padding: 8px;">Events </h3>
                    <div style="border:1px solid #ddd; width: 100%; padding: 8px; display: inline-block;" class="text-justify">
                        <table class="table table-bordered table-striped table-hover table-responsive">
                            <thead>
                                <tr><th>Sr.No.</th><th>Company name</th><th>Position</th><th>Seats</th><th>Package</th><th>Action</th></tr>
                            </thead>
                            <tbody>
                                <%
                                Database db=new Database();
                                ResultSet rs=db.getEvents("company");
                                if(rs!=null){
                                    int i=1;
                                    while(rs.next()){
                                %>
                                <tr><th><%=i++%></th><th><%=rs.getString("company_name")%></th><th><%=rs.getString("position")%></th><th><%=rs.getString("seats")%></th><th><%=rs.getString("package")%></th>
                                    <th>
                                        <a href="javascript:remove(<%=rs.getInt("id")%>,'event');" class="btn btn-danger">Delete</a>
                                        <a href="company-details.jsp?id=<%=rs.getInt("id")%>" class="btn btn-primary">View Details</a>
                                    </th>
                                </tr>
                                <%
                                    }
                                }
                                %>
                            </tbody>
                        </table>
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