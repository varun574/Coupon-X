<%@ page language="java" contentType="text/html"%>
<%@ page import="java.text.*,java.util.*" %>
<%@ page import="java.sql.*"%>
<%

String name=request.getParameter("pname");
String phone=request.getParameter("pnumber");
String email=request.getParameter("pemail");
String couponcompany=request.getParameter("pcompany");
String offer=request.getParameter("poffer");
String expiry=request.getParameter("pdate");
String coponcode=request.getParameter("pcode");
String platname=request.getParameter("pplat");

out.println(name+"  "+phone+"  "+email+"  "+couponcompany+"  "+offer+"  "+expiry+"  "+coponcode+"  "+platname+"  ");

try{
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","akash");
    PreparedStatement ps=con.prepareStatement("insert into Uploadtable values(?,?,?,?,?,?,?,?)");
    ps.setString(1,phone);
    ps.setString(2,name);
    ps.setString(3,email);
    ps.setString(4,couponcompany);
    ps.setString(5,offer);
    ps.setString(6,expiry);
    ps.setString(7,coponcode);
    ps.setString(8,platname);
    
    int x=ps.executeUpdate();
    if(x!=0)
        {
            out.println("Data entered");
            response.sendRedirect("coupons.html");
        }
        else
        out.println("Error occured!please try again");

}
catch(Exception e)
{
out.println(e);
}
%>