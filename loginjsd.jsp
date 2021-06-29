<%@ page language="java" contentType="text/html"%>
<%@ page import="java.text.*,java.util.*" %>
<%@ page import="java.sql.*"%>
<%

String email=request.getParameter("lemail");
String pass=request.getParameter("lpass");
try{
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","akash");
    Statement st=con.createStatement();
	String query="select * from registration";
	ResultSet rs=st.executeQuery(query);
	while(rs.next()){
        String name=rs.getString(1);
        String email12=rs.getString(2);
        String gender=rs.getString(3);
        String pass12=rs.getString(4);
        if(pass.length()==0 ){
        out.println("shishfi");
        response.sendRedirect("login.html");}
        else{
        if(email.equals(email12))
        {
          if(pass.equals(pass12)){
          out.println("sucessful sign in");
          PreparedStatement ps=con.prepareStatement("insert into registered values(?,?)");
          ps.setString(1,email);
          ps.setString(2,name);
          int x=ps.executeUpdate();
          if(x!=0)
          {
              out.println("Sign sucess");
              response.sendRedirect("index.html");
          }
          else
          out.println("Error occured!please try again");
         
          break;}
          else
          {
           
              out.println("Error in mail or password");
              out.println("Please go for Login page");
              %>
              <%
          }
        }
        else{
        }}
    }

}
catch(Exception e){
out.println(e);
}
%>