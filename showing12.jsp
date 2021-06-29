<%@ page language="java" contentType="text/html"%>
<%@ page import="java.text.*,java.util.*" %>
<%@ page import="java.sql.*"%>
<html><head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   
</head>
<body>
    <div class="container" id="#poiu">
        <div class="row">
        
<%
try{
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","akash");
    Statement st=con.createStatement();
	String query="select * from Uploadtable";
	ResultSet rs=st.executeQuery(query);
    int i=0;
	while(rs.next()){
        i++;
        String phone=rs.getString(1);
        String name=rs.getString(2);
        String email=rs.getString(3);
        String coponcompany=rs.getString(4);
        String offer=rs.getString(5);
        String  expiry=rs.getString(6);
        String coponcode=rs.getString(7);
        String platname=rs.getString(8);
        double price=0;
        int flag=0;
        if(offer.charAt(offer.length()-1)!='%'){
            price=(.15)*(Integer.parseInt(offer));flag=1;}
        %>

    
        <div class="col-sm-4">
        <div class= "card">
            
            <div class="card-body" style="background-color: black;">
            

                    <img class="card-img-top"  src="https://ps.w.org/wp-coupons-and-deals/assets/icon-256x256.png?rev=1974447" alt="Card image" style="width:300px; height:250px">
                     </div>
                <div class="card-footer" style="background-color:cornsilk;">
                    <p>Company : <%= coponcompany %></p>
                    <p >Offer : <%= offer %></p>
                    <p >Expiry : <%= expiry %></p>
                    <p >Price : <% if(flag==0){ %><%=offer%> <%}else{%><%=price%><%}%></p>
                    <a href="payment.html"><button class="btn btn-success" style="float:right; ">Buy now</button></a>
                </div>
        </div>
</div>

        <%
    }%>



    <%
    
}
catch(Exception e)
{
    out.println(e);
}
%>
</div></div>
</body>
</html>