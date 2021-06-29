<html>
    <head></head>
    <body>
        
<%@ page language="java" contentType="text/html"%>
<%@ page import="java.text.,java.util." %>
<%@ page import="java.sql.*"%>
<% 
    try{
        String url="jdbc:oracle:thin:@localhost:1521:XE";
		String uname="system";
		String pass="varun";

		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection(url,uname,pass);
		

		Statement st=con.createStatement();
		String query="select * from emp1";
		ResultSet rs=st.executeQuery(query);
		
		while(rs.next()){
			String name=rs.getString(1);
			String job=rs.getString(2);
			double sal=rs.getDouble(3);
%>
        <script>
            $(function(){
                $(this).append('<div class="card" style="width:400px"><a href="upload_coupons.html"><img class="card-img-top" src="https://lh3.googleusercontent.com/proxy/V_JY_8klckqaJqS3Sr-UI26U1vNxcFaoPCH8NnsGQue9a-kyMCxDGdJtlSKwdxv47Dj-Znr_4e6Csx8ziWMTQVjb3r3dFwAFZhCu-BmoLq5l2kGTv4xVJoY" alt="Card image" style="width:300px"></a><div class="card-body"><h4 class="card-title">Upload Coupons</h4><p class="card-text">Click load to card and get started.Coupons can be loaded on Coupon-X.com </p></div></div>')
            })
        </script>          
<%
		}

		

    }
    catch(Exception E){
        out.print(E);
    }
%>
</body>
</html>