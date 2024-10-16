/*
* To change this license header, choose License Headers in Project Properties.
* To change this template file, choose Tools | Templates
* and open the template in the editor.
*/
package database;
import java.io.File;
import java.sql.*;
import java.util.Vector;
import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;
public class Database
{
    Connection con;
    PreparedStatement pst;
    ResultSet rs;
    public Database() throws SQLException
    {
        try{
            
            //MAKE SURE YOU KEEP THE mysql_connector.jar file in java/lib folder
            //ALSO SET THE CLASSPATH
            
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/arvi22_tpc","root","root");
            System.out.println("connetion success.....");
            
        }
        catch (ClassNotFoundException e)
        {
            System.out.println("exception : "+e);
        }
    }
    
    public boolean fillExcelDataRows(String rollno, String title, String fname, String mname, String lname, String fullname, String no1, String no2, String no3, String category, String gender, String email, String branch, String dob, String ssc, String hsc, String diploma, int backlogs, String be_aggre, String ac_dc,String pwd) {
        try {
            int status=1;
            
            System.out.println(ParseDouble((be_aggre)));
            pst=con.prepareStatement("insert into student_record (roll_no,title,fname,mname,lname,full_name,contactno1,contactno2,contactno3,category,gender,email,branch,dob,ssc,hsc,diploma,be_aggre,curr_backlog,ac_dc,status,password) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            pst.setString(1, rollno);
            pst.setString(2, title);
            pst.setString(3, fname);
            pst.setString(4, mname);
            pst.setString(5, lname);
            pst.setString(6, fullname);
            pst.setString(7, no1);
            pst.setString(8, no2);
            pst.setString(9, no3);
            pst.setString(10, category);
            pst.setString(11, gender);
            pst.setString(12, email);
            pst.setString(13, branch);
            pst.setString(14, dob);
            pst.setDouble(15, ParseDouble((ssc)));
            pst.setDouble(16, ParseDouble((hsc)));
            pst.setDouble(17, ParseDouble((diploma)));
            pst.setDouble(18, ParseDouble((be_aggre)));
            pst.setInt(19,backlogs);
            pst.setString(20, ac_dc);
            pst.setInt(21, status);
            pst.setString(22, pwd);
            
            //executes the prepared statement
            int n=pst.executeUpdate();
            
            if(n==1)
            {
                //TRUE iff the query founds any corresponding data
                return true;
            }
            else
            {
                return false;
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while val"+e);
            return false;
        }
    }
    double ParseDouble(String strNumber) {
        if (strNumber != null && strNumber.length() > 0) {
            try {
                return Double.parseDouble(strNumber);
            } catch(Exception e) {
                return -1;   // or some value to mark this field is wrong. or make a function validates field first ...
            }
        }
        else return 0;
    }
    public Boolean changepassword(String pwd1)
    {
        try {
            pst=con.prepareStatement("update admin set password='"+pwd1+"'");
            //executes the prepared statement
            int n=pst.executeUpdate();
            if(n==1)
            {
                //TRUE iff the query founds any corresponding data
                return true;
            }
            else
            {
                return false;
            }
            
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while val"+e);
            return false;
        }
    }
    public Boolean checkCurrentPwdExist(String pwd)
    {
        try {
            pst=con.prepareStatement("select * from admin where password=?");
            pst.setString(1, pwd);
            rs=pst.executeQuery();
            if(rs.next())
            {
                return true;
            }
            else
            {
                return false;
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return false;
        }
    }
    
    public int checkLogin(String uname,String pwd)
    {
        try {
            pst=con.prepareStatement("select * from admin where username=? and password=?");
            pst.setString(1, uname); //this replaces the 1st  "?" in the query for username
            pst.setString(2, pwd);    //this replaces the 2st  "?" in the query for password
            //executes the prepared statement
            rs=pst.executeQuery();
            
            if(rs.next())
            {
                return rs.getInt("id");
            }
            else
            {
                return 0;
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return 0;
        }
    }
    public int checkStudentLogin(String uname,String pwd)
    {
        try {
            pst=con.prepareStatement("select * from students where enrolno=? and password=? and status = ?");
            pst.setString(1, uname); //this replaces the 1st  "?" in the query for username
            pst.setString(2, pwd);    //this replaces the 2st  "?" in the query for password
            pst.setInt(3, 1);
            //executes the prepared statement
            rs=pst.executeQuery();
            
            if(rs.next())
            {
                return rs.getInt("id");
            }
            else
            {
                return 0;
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return 0;
        }
    }
    
    public Boolean StudentReg(String name,String enrolno,String mobno,String email,String address,String branch,String year,String pwd){
        try {
            int status=1;
        pst=con.prepareStatement("insert into students (fullname,enrolno,mobileno,email,address,branch,year,password,status,placement) values(?,?,?,?,?,?,?,?,?,?)");
            pst.setString(1, name);
            pst.setString(2, enrolno);
            pst.setString(3, mobno);
            pst.setString(4, email);
            pst.setString(5, address);
            pst.setString(6, branch);
            pst.setString(7, year);
            pst.setString(8, pwd);
            pst.setInt(9, status);
            pst.setInt(10, 0);
            
            //executes the prepared statement
            int n=pst.executeUpdate();
            
            if(n==1)
            {
                //TRUE iff the query founds any corresponding data
                return true;
            }
            else
            {
                return false;
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return false;
        }
    }
    public ResultSet getStudents(){
        try {
            pst=con.prepareStatement("select * from students");
            //executes the prepared statement
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            return null;
        }
    }
    
    public ResultSet getEvents(String type){
        try {
            pst=con.prepareStatement("select * from event where type='"+type+"' order by id desc");
            //executes the prepared statement
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            return null;
        }
    }
    public Boolean submitCompany(String cname,String caddress,String position,String seats,String cdate,String cpackage,String website,String terms_conditions,String profile,String description,String session){
        try {
            int status=1;
        pst=con.prepareStatement("insert into event (`type`,`company_name`, `address`, `position`, `seats`, `date`, `package`, `website`, `terms`, `profile`, `description`, `session`) values(?,?,?,?,?,?,?,?,?,?,?,?)");
            pst.setString(1, "company");
            pst.setString(2, cname);
            pst.setString(3, caddress);
            pst.setString(4, position);
            pst.setString(5, seats);
            pst.setString(6, cdate);
            pst.setString(7, cpackage);
            pst.setString(8, website);
            pst.setString(9, terms_conditions);
            pst.setString(10, profile);
            pst.setString(11, description);
            pst.setString(12, session);
            
            //executes the prepared statement
            int n=pst.executeUpdate();
            
            if(n==1)
            {
                //TRUE iff the query founds any corresponding data
                return true;
            }
            else
            {
                return false;
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return false;
        }
    }
    
    public Boolean submitEvent(String info,String branche,String date,String time){
        try {
            int status=1;
        pst=con.prepareStatement("insert into event (`type`,`event_info`, `branch`, `date`, `time`) values(?,?,?,?,?)");
            pst.setString(1, "event");
            pst.setString(2, info);
            pst.setString(3, branche);
            pst.setString(4, date);
            pst.setString(5, time);
            
            //executes the prepared statement
            int n=pst.executeUpdate();
            
            if(n==1)
            {
                //TRUE iff the query founds any corresponding data
                return true;
            }
            else
            {
                return false;
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return false;
        }
    }
    public ResultSet getCriteriaStudents(String criteria,String option,String branch,String ssc,String hsc,String diploma,String degree){
        try {
            if(criteria.equals("withcri")){
                String que="select * from student_record where ";
                
                if(!ssc.equals("")){
                    que+="ssc>="+ssc;
                }
                
                if(!hsc.equals("")){
                    que+=" and hsc>="+hsc;
                }
                
                if(!diploma.equals("")){
                    que+=" and diploma>="+diploma;
                }
                
                if(!option.equals("ALL")){
                    que+=" and ac_dc='"+option+"'";
                }
                
                if(!degree.equals("")){
                    que+=" and be_aggre>="+degree;
                }
                
                if(branch.equals("ALL")){
                    que+="";
                }else{
                    que+=" and branch='"+branch+"'";
                }
                System.out.println(que);
                pst=con.prepareStatement(que);
            }else{
                String que="select * from student_record";
                if(branch.equals("ALL")){
                    que+="";
                    
                    if(option.equals("ALL")){
                        que+="";
                    }
                    if(!option.equals("ALL")){
                        que+=" where ac_dc='"+option+"'";
                    }
                }
                if(!branch.equals("ALL")){
                    que+=" where branch='"+branch+"'";
                    
                    if(option.equals("ALL")){
                        que+="";
                    }
                    if(!option.equals("ALL")){
                        que+=" and ac_dc='"+option+"'";
                    }
                }
                System.out.println(que);
                pst=con.prepareStatement(que);
            }
            //executes the prepared statement
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            return null;
        }
    }
    public ResultSet getStudentDetailsById(int id){
        try {
            pst=con.prepareStatement("select * from students where id="+id);
            //executes the prepared statement
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            return null;
        }
    }
    public ResultSet getCompanyDetails(int id){
        try {
            pst=con.prepareStatement("select * from event where id="+id);
            //executes the prepared statement
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            return null;
        }
    }
    
    public ResultSet getCompanyCriteria(int id){
        try {
            pst=con.prepareStatement("select * from criteria where event_id="+id);
            //executes the prepared statement
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            return null;
        }
    }
    
    public ResultSet getStudentEducation(int id){
        try {
            PreparedStatement ppst=con.prepareStatement("select * from student_education where students_id="+id);
            //executes the prepared statement
            rs=ppst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            return null;
        }
    }
    public Boolean submitCriteria(int cid,String ssc,String hsc,String sem1,String sem2,String sem3,String sem4,String sem5,String current_back) throws SQLException
    {
        ResultSet crs=this.getCompanyCriteria(cid);
        int i=0;
        while(crs.next()){
            i=i+1;
        }
                           if(i>0){
                               try {
            pst=con.prepareStatement("update criteria set `ssc`="+ssc+", `hsc`="+hsc+", `sem1`="+sem1+", `sem2`="+sem2+", `sem3`="+sem3+", `sem4`="+sem4+", `sem5`="+sem5+",`current_back`='"+current_back+"' where event_id="+cid);
            int n=pst.executeUpdate();
            if(n==1)
            {
                //TRUE iff the query founds any corresponding data
                return true;
            }
            else
            {
                return false;
            }
            
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return false;
        }
                           }else{
        try {
            pst=con.prepareStatement("insert into criteria(`ssc`, `hsc`, `sem1`, `sem2`, `sem3`, `sem4`, `sem5`, `event_id`, `current_back`) values('"+ssc+"','"+hsc+"','"+sem1+"','"+sem2+"','"+sem3+"','"+sem4+"','"+sem5+"',"+cid+",'"+current_back+"')");
            int n=pst.executeUpdate();
            if(n==1)
            {
                //TRUE iff the query founds any corresponding data
                return true;
            }
            else
            {
                return false;
            }
            
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return false;
        }}
    }
    public Boolean submitEducation(int cid,String ssc,String hsc,String sem1,String sem2,String sem3,String sem4,String sem5,String current_back) throws SQLException
    {
        ResultSet crs=this.getStudentEducation(cid);
        int i=0;
        while(crs.next()){
            i=i+1;
        }
        
                           if(i>0){
                               try {
            pst=con.prepareStatement("update student_education set `ssc`="+ssc+", `hsc`="+hsc+", `sem1`="+sem1+", `sem2`="+sem2+", `sem3`="+sem3+", `sem4`="+sem4+", `sem5`="+sem5+",`current_back`='"+current_back+"' where students_id="+cid);
            int n=pst.executeUpdate();
            if(n==1)
            {
                //TRUE iff the query founds any corresponding data
                return true;
            }
            else
            {
                return false;
            }
            
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return false;
        }
                           }else{
        try {
            pst=con.prepareStatement("insert into student_education(`ssc`, `hsc`, `sem1`, `sem2`, `sem3`, `sem4`, `sem5`, `students_id`, `current_back`) values('"+ssc+"','"+hsc+"','"+sem1+"','"+sem2+"','"+sem3+"','"+sem4+"','"+sem5+"',"+cid+",'"+current_back+"')");
            int n=pst.executeUpdate();
            if(n==1)
            {
                //TRUE iff the query founds any corresponding data
                return true;
            }
            else
            {
                return false;
            }
            
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return false;
        }}
    
    }
    public Boolean userPasswordAdminUpdate(String npwd,String pwd1)
    {
        try {
            pst=con.prepareStatement("update admin set password=? where password=?");
            pst.setString(1, npwd);
            pst.setString(2, pwd1);
            int n=pst.executeUpdate();
            if(n==1)
            {
                //TRUE iff the query founds any corresponding data
                return true;
            }
            else
            {
                return false;
            }
            
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return false;
        }
    }
    
    public Boolean userPasswordStudUpdate(String npwd,String pwd1)
    {
        try {
            pst=con.prepareStatement("update students set password=? where password=?");
            pst.setString(1, npwd);
            pst.setString(2, pwd1);
            int n=pst.executeUpdate();
            if(n==1)
            {
                //TRUE iff the query founds any corresponding data
                return true;
            }
            else
            {
                return false;
            }
            
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while validating"+e);
            return false;
        }
    }
    public ResultSet getTotalSMS(){
        try {
            pst=con.prepareStatement("select * from sms_msg");
            //executes the prepared statement
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            return null;
        }
    }
    public ResultSet getTotalSMSStudentsById(int id){
        try {
            pst=con.prepareStatement("select * from smsstudents where sms_msg_id="+id);
            //executes the prepared statement
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            return null;
        }
    }
    
    public boolean fillExcelDataRows(Cell rollno, Cell title, Cell fname, Cell mname, Cell lname, Cell fullname, Cell no1, Cell no2, Cell no3, Cell category, Cell gender, Cell email, Cell branch, Cell dob, Cell ssc, Cell hsc, Cell diploma, Cell backlogs, Cell be_aggre, Cell ac_dc,Cell pwd) {
        try {
            int status=1;
            
            System.out.println(ParseDouble((be_aggre.getContents())));
            pst=con.prepareStatement("insert into student_record (roll_no,title,fname,mname,lname,full_name,contactno1,contactno2,contactno3,category,gender,email,branch,dob,ssc,hsc,diploma,be_aggre,curr_backlog,ac_dc,status,password) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
            pst.setString(1, rollno.getContents());
            pst.setString(2, title.getContents());
            pst.setString(3, fname.getContents());
            pst.setString(4, mname.getContents());
            pst.setString(5, lname.getContents());
            pst.setString(6, fullname.getContents());
            pst.setString(7, no1.getContents());
            pst.setString(8, no2.getContents());
            pst.setString(9, no3.getContents());
            pst.setString(10, category.getContents());
            pst.setString(11, gender.getContents());
            pst.setString(12, email.getContents());
            pst.setString(13, branch.getContents());
            pst.setString(14, dob.getContents());
            pst.setDouble(15, ParseDouble((ssc.getContents())));
            pst.setDouble(16, ParseDouble((hsc.getContents())));
            pst.setDouble(17, ParseDouble((diploma.getContents())));
            pst.setDouble(18, ParseDouble((be_aggre.getContents())));
            pst.setInt(19, Integer.parseInt(backlogs.getContents()));
            pst.setString(20, ac_dc.getContents());
            pst.setInt(21, status);
            pst.setString(22, pwd.getContents());
            
            //executes the prepared statement
            int n=pst.executeUpdate();
            
            if(n==1)
            {
                //TRUE iff the query founds any corresponding data
                return true;
            }
            else
            {
                return false;
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while val"+e);
            return false;
        }
    }
    
    public boolean saveExcelToDatabase(File file){
        Workbook workbook = null;
        try {
            workbook = Workbook.getWorkbook(file);
            boolean res=false;
            Sheet sheet = workbook.getSheet(0);
            System.out.println("Total rows : "+sheet.getRows());
            for (int j = 1; j < sheet.getRows(); j++) {
                Vector d = new Vector();
                System.out.println("Total columns : "+sheet.getColumns());
                System.out.println("Total J value : "+j);
                
                Cell rollno = sheet.getCell(1, j);
                Cell title = sheet.getCell(2, j);
                Cell fname = sheet.getCell(3, j);
                Cell mname = sheet.getCell(4, j);
                Cell lname = sheet.getCell(5, j);
                Cell fullname = sheet.getCell(7, j);
                Cell no1 = sheet.getCell(8, j);
                Cell no2 = sheet.getCell(9, j);
                Cell no3 = sheet.getCell(10, j);
                Cell category = sheet.getCell(11, j);
                Cell gender = sheet.getCell(13, j);
                Cell email = sheet.getCell(14, j);
                Cell branch = sheet.getCell(19, j);
                Cell dob = sheet.getCell(20, j);
                Cell ssc = sheet.getCell(23, j);
                Cell hsc = sheet.getCell(26, j);
                Cell diploma = sheet.getCell(28, j);
                Cell backlogs = sheet.getCell(49, j);
                Cell be_aggre = sheet.getCell(65, j);
                Cell ac_dc = sheet.getCell(69, j);
                Cell pwd = sheet.getCell(70, j);
                System.out.println(be_aggre.getContents());
                res=this.fillExcelDataRows(rollno,title,fname,mname,lname,fullname,no1,no2,no3,category,gender,email,branch,dob,ssc,hsc,diploma,backlogs,be_aggre,ac_dc,pwd);
            }
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public ResultSet getStudentCompanies(int sid){
        try {
            pst=con.prepareStatement("select event_id from sentstudents where students_id="+sid+" order by id desc");
            //executes the prepared statement
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            return null;
        }
    }
    
    public ResultSet getStudentMSGDetails(String id){
        try {
            pst=con.prepareStatement("select * from sms_msg where id="+id);
            //executes the prepared statement
            rs=pst.executeQuery();
            return rs;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            return null;
        }
    }
    
    public Boolean sendNoti(int id) throws SQLException{
        ResultSet snrs=this.getCompanyCriteria(id);
        if(snrs.next()){
            Float ssc=snrs.getFloat("ssc");
            Float hsc=snrs.getFloat("hsc");
            Float sem1=snrs.getFloat("sem1");
            Float sem2=snrs.getFloat("sem2");
            Float sem3=snrs.getFloat("sem3");
            Float sem4=snrs.getFloat("sem4");
            Float sem5=snrs.getFloat("sem5");
            String cback=snrs.getString("current_back");
            this.removeSentNoti(id);
            String query="";
            query+="select * from student_education where ssc>="+ssc+" and sem1>="+sem1+" and sem2>="+sem2+" and sem3>="+sem3+" and sem4>="+sem4+" and sem5>="+sem5+" and current_back='"+cback+"'";
            if(!hsc.equals("")){
                query+="or hsc>="+hsc;
            }
            try {
                pst=con.prepareStatement(query);
                //executes the prepared statement
                rs=pst.executeQuery();
                if(rs!=null){
                    while(rs.next()){
                        int stidd=rs.getInt("students_id");
                        this.setStudent(id,stidd);
                    }
                }
            } catch (Exception e) {
                // TODO Auto-generated catch block
                System.out.println("exception : "+e.getMessage());
                return null;
            }
            return true;
        }
       return false; 
    }
    
    public boolean setStudent(int cid,int stid) {
        try {
            pst=con.prepareStatement("insert into sentstudents (students_id,event_id) values(?,?)");
            pst.setInt(1, stid);
            pst.setInt(2, cid);
            //executes the prepared statement
            int n=pst.executeUpdate();
            
            if(n==1)
            {
                //TRUE iff the query founds any corresponding data
                return true;
            }
            else
            {
                return false;
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while val"+e);
            return false;
        }
    }
    
    public boolean removeRecord(String rid,String table) {
        try {
            pst=con.prepareStatement("delete from "+table+" where id="+rid);
            int n=pst.executeUpdate();
            if(n==1)
            {
                return true;
            }
            else
            {
                return false;
            }
            
        } catch (Exception e) {
            System.out.println("error while val"+e);
            return false;
        }
    }
    
    public boolean removeSentNoti(int id) {
        try {
            pst=con.prepareStatement("delete from sentstudents where event_id="+id);
            int n=pst.executeUpdate();
            if(n==1)
            {
                return true;
            }
            else
            {
                return false;
            }
            
        } catch (Exception e) {
            System.out.println("error while val"+e);
            return false;
        }
    }
    
    public boolean removeStudentRecord() {
        try {
            pst=con.prepareStatement("delete from student_record");
            //executes the prepared statement
            int n=pst.executeUpdate();
            if(n>0)
            {
                //TRUE iff the query founds any corresponding data
                return true;
            }
            else
            {
                return false;
            }
            
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error while val"+e);
            return false;
        }
    }
   
    public boolean submitFeedback(String smsstudid,String feedback){
        try {
            pst=con.prepareStatement("update smsstudents set feedback='"+feedback+"' where id="+smsstudid);
            int n=pst.executeUpdate();
            if(n==1)
            {
                return true;
            }
            else
            {
                return false;
            }
        } catch (Exception e) {
            System.out.println("error while val"+e);
            return false;
        }
    }
}
