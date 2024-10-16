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
                    <h3 style="margin: 0px; color:#fff; background-color: #f3974e; border-top-left-radius: 4px; border-top-right-radius: 4px; padding: 8px;">My Profile</h3>
                    <div style="border:1px solid #ddd; width: 100%; padding: 8px; display: inline-block;" class="text-justify">
                        <%
                        Database db=new Database();
                        String sid=session.getAttribute("studentuser").toString();
                        ResultSet rs=db.getStudentDetailsById(Integer.parseInt(sid));
                        if(rs.next()){
                            %>
                            <table class="table table-bordered">
                                <tr>
                                    <th>Full Name</th><td>  <%=rs.getString("fullname")%></td></tr>
                                    <tr><th>Enrollment no.</th><td>  <%=rs.getString("enrolno")%></td></tr>
                                    <tr><th>Email id</th><td>  <%=rs.getString("email")%></td></tr>
                                    <tr><th>Mobile NO</th><td>  <%=rs.getString("mobileno")%></td></tr>
                                    <tr><th>Address</th><td>  <%=rs.getString("address")%></td></tr>
                                    <tr><th>Branch</th><td>  <%=rs.getString("branch")%></td></tr>
                                    <tr><th>Year/Sem</th><td>  <%=rs.getString("year")%></td>
                                </tr>
                            </table>
                           
                            <%
                        }
                        %>
                    </div>
                
                    <h4>My Educational Details</h4>
                        <div class="col-md-6">
                            <table class="table table-bordered">
                           <%
                               String ssc="";
                               String hsc="";
                               String sem1=""; String sem2=""; String sem3=""; String sem4=""; String sem5="";
                               String curr="";
                           ResultSet crs=db.getStudentEducation(Integer.parseInt(sid));
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
                        <div class="col-md-6">
                            <form action="../WebService.jsp" method="POST">
                                <input type="hidden" value="<%=Integer.parseInt(sid)%>" name="id"/>
                                <table class="table table-bordered">
                                    <tr><th>SSC</th><th><input type="number" name="ssc" step="0.01" value="<%=ssc%>" required /> </th></tr>
                                    <tr><th>HSC</th><th><input type="number" name="hsc" step="0.01" value="<%=hsc%>" /></th></tr>
                                    <tr><th>Sem1</th><th><input type="number" name="sem1" step="0.01" value="<%=sem1%>" required /></th></tr>
                                    <tr><th>Sem2</th><th><input type="number" name="sem2" step="0.01" value="<%=sem2%>" required /></th></tr>
                                    <tr><th>Sem3</th><th><input type="number" name="sem3" step="0.01" value="<%=sem3%>" required /></th></tr>
                                    <tr><th>Sem4</th><th><input type="number" name="sem4" step="0.01" value="<%=sem4%>" required /></th></tr>
                                    <tr><th>Sem5</th><th><input type="number" name="sem5" step="0.01" value="<%=sem5%>" required /></th></tr>
                                    <tr><th>Current Back</th><th><input type="radio" <% if(curr.equals("No")){ %> checked <% }else{ %> unchecked <% } %> checked value="No" style="width:20px; height: 20px;" name="current_back"/> No
                                        <input type="radio" <% if(curr.equals("Yes")){ %> checked <% }else{ %> unchecked <% } %> value="Yes" style="width:20px; height: 20px;" name="current_back"/>Yes</th></tr>
                                    <tr><td colspan="2">
                                            <input type="hidden" name="action" value="education"/>
                                            <input type="submit" value="Update" name="submit" class="btn btn-primary" /> </td></tr>
                                </table>
                            </form>
                        </div>
                                    </div>
            </div>
        </div>
    </body>
</html>