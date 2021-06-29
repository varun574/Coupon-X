<%@ page language="java" contentType="text/html"%>
<%@ page import="java.text.*,java.util.*" %>
<%@ page import="java.sql.*"%>
<%
String name=request.getParameter("uname");
String email=request.getParameter("uemail");
String gender=request.getParameter("ugender");
String pass=request.getParameter("upass");
String cpass=request.getParameter("ucpass");
out.println(name+email+gender+pass+cpass);
if(pass.equals(cpass))
{

    try{
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","akash");
        PreparedStatement ps=con.prepareStatement("insert into registration values(?,?,?,?)");
        ps.setString(1,name);
        ps.setString(2,email);
        ps.setString(3,gender);
        ps.setString(4,pass);
        int x=ps.executeUpdate();
        if(x!=0)
        {
            out.println("Sign sucess");
            response.sendRedirect("login.html");
        }
        else
        out.println("Error occured!please try again");
    }
    catch(Exception e){
       out.println(e);
    }
}
else
{
    out.println("Pasword not matching");    
}
%>