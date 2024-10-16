
<%@page import="java.io.File"%>
<%@page import="org.apache.tomcat.util.codec.binary.Base64"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.InputStream"%>
<%@page import="database.Database"%>
<%
    Database db=new Database();
    String action=request.getParameter("action");
    System.out.println(action);
    switch(action){
        case "adminlogin":
            String username2=request.getParameter("username");
            String password2=request.getParameter("password");
            int res2=db.checkLogin(username2, password2);
            if(res2>0){
                session.setAttribute("adminuser","adminuser");
                out.print(1);
            }else{
                out.print(0);
            }
            break;
        case "studlogin":
            String username=request.getParameter("username");
            String password=request.getParameter("password");
            int res=db.checkStudentLogin(username, password);
            if(res>0){
                session.setAttribute("studentuser",res);
                out.print(1);
            }else{
                out.print(0);
            }
            break;
        case "studentreg":
            String name=request.getParameter("name");
            String enrolno=request.getParameter("enrolno");
            String mobno=request.getParameter("mobno");
            String email=request.getParameter("email");
            String address=request.getParameter("address");
            String branch=request.getParameter("branch");
            String year=request.getParameter("year");
            String pwd=request.getParameter("password");
            boolean ress=db.StudentReg(name,enrolno,mobno,email,address,branch,year,pwd);
            if(ress){
                out.print(1);
            }else{
                out.print(0);
            }
            break;
            case "updateuserpassword":
                String pwd1u=request.getParameter("pwd");
                String cpwd1u=request.getParameter("cpwd");
                boolean ress1u=db.userPasswordAdminUpdate(cpwd1u,pwd1u);
                    if(ress1u){
                     response.sendRedirect("admin/change-pwd.jsp?status=1");
                    }else{
                     response.sendRedirect("admin/change-pwd.jsp?status=0");
                    }
            break;
            case "updatestudpassword":
                String pd1u=request.getParameter("pwd");
                String cwd1u=request.getParameter("cpwd");
                boolean res1u=db.userPasswordStudUpdate(cwd1u,pd1u);
                    if(res1u){
                     response.sendRedirect("student/change-pwd.jsp?status=1");
                    }else{
                     response.sendRedirect("student/change-pwd.jsp?status=0");
                    }
            break;
            case "removestudrecord":
                boolean r=db.removeStudentRecord();
                if(r){
                    out.println(1);
                }else{
                    out.println(0);
                }
                break;
            case "removerecord":
                String rid=request.getParameter("rid");
                String table=request.getParameter("table");
                boolean rr=db.removeRecord(rid,table);
                if(rr){
                    out.println(1);
                }else{
                    out.println(0);
                }
                break;
            case "sendnoti":
                String comid=request.getParameter("id");
                boolean srr=db.sendNoti(Integer.parseInt(comid));
                if(srr){
                    out.println(1);
                }else{
                    out.println(0);
                }
                break;
            case "new-company":
                String cname=request.getParameter("name");
                String caddress=request.getParameter("address");
                String position=request.getParameter("position");
                String seats=request.getParameter("seats");
                String cdate=request.getParameter("date");
                String cpackage=request.getParameter("package");
                String website=request.getParameter("website");
                String terms_conditions=request.getParameter("terms_conditions");
                String profile=request.getParameter("profile");
                String description=request.getParameter("description");
                String csession=request.getParameter("session");                
                boolean com=db.submitCompany(cname,caddress,position,seats,cdate,cpackage,website,terms_conditions,profile,description,csession);
                if(com){
                     response.sendRedirect("admin/create-event.jsp?status=1");
                    }else{
                     response.sendRedirect("admin/create-event.jsp?status=0");
                    }
                break;
            case "new-event":
                String info=request.getParameter("info");
                String branche=request.getParameter("branch");
                String date=request.getParameter("date");
                String time=request.getParameter("time");
                boolean ev=db.submitEvent(info,branche,date,time);
                if(ev){
                    response.sendRedirect("admin/create-event.jsp?status=1");
                    }else{
                     response.sendRedirect("admin/create-event.jsp?status=0");
                    }
                
                break;
            case "criteria":
                String cid=request.getParameter("id");
                String ssc=request.getParameter("ssc");
                String hsc=request.getParameter("hsc");
                String sem1=request.getParameter("sem1");
                String sem2=request.getParameter("sem2");
                String sem3=request.getParameter("sem3");
                String sem4=request.getParameter("sem4");
                String sem5=request.getParameter("sem5");
                String current_back=request.getParameter("current_back");
                System.out.println(current_back);
                boolean ecv=db.submitCriteria(Integer.parseInt(cid),ssc,hsc,sem1,sem2,sem3,sem4,sem5,current_back);
                if(ecv){
                    response.sendRedirect("admin/company-details.jsp?status=1&id="+cid);
                    }else{
                     response.sendRedirect("admin/company-details.jsp?status=0&id="+cid);
                    }
                
                break;
            case "education":
                String sid=request.getParameter("id");
                String sssc=request.getParameter("ssc");
                String shsc=request.getParameter("hsc");
                String ssem1=request.getParameter("sem1");
                String ssem2=request.getParameter("sem2");
                String ssem3=request.getParameter("sem3");
                String ssem4=request.getParameter("sem4");
                String ssem5=request.getParameter("sem5");
                String scurrent_back=request.getParameter("current_back");
                System.out.println(scurrent_back);
                boolean secv=db.submitEducation(Integer.parseInt(sid),sssc,shsc,ssem1,ssem2,ssem3,ssem4,ssem5,scurrent_back);
                if(secv){
                    response.sendRedirect("student/my-profile.jsp?status=1&id="+sid);
                    }else{
                     response.sendRedirect("student/my-profile.jsp?status=0&id="+sid);
                    }
                
                break;
    }
    %>
