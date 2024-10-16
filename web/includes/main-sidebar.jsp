<%@page import="java.sql.ResultSet"%>
<%@page import="database.Database"%>
<div class="col-md-3">
                    <div class="list-group">
                        <a href="index.jsp" class="list-group-item">Home</a>
                        <a href="admin-login.jsp" class="list-group-item">Admin</a>
                        <a href="stud-login.jsp" class="list-group-item list-group-item-action">Student</a>
                        <a href="about.jsp" class="list-group-item list-group-item-action">About us</a>
                      </div>
                    <h4>Events</h4>
                    <ul style="list-style-type: none; padding-left: 10px; height: 250px; border: 1px solid #ddd;">
                        <marquee direction="up" onmouseover="this.stop();" onmouseout="this.start();" style="height: 250px;">
                            <%
                                Database db=new Database();
                                ResultSet rs=db.getEvents("event");
                                if(rs!=null){
                                    int i=1;
                                    while(rs.next()){
                                %>    
                            <li>
                                    <h5><%=rs.getString("date")%>, <%=rs.getString("time")%></h5>
                                    <h6><%=rs.getString("event_info")%></h6>
                                </li>
                             <%
                                    }
                                }
                                %>
                    </marquee>
                    </ul>
                </div>