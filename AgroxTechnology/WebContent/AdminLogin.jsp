<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" import= "java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%! Connection con; 
PreparedStatement pst;	 
ResultSet rs;%>
<% try{
	  Class.forName("oracle.jdbc.driver.OracleDriver");
		con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "AGROXTECHNOLOGY", "Manish@123");
		pst=con.prepareStatement("Select * from userdetails1 where username=? and password=?");
	  	  System.out.println("Database  connected");
	  	 String username =request.getParameter("username");
	  	String password =request.getParameter("password");
	  	pst.setString(1,username);
	  	pst.setString(2,password);
	  	rs=pst.executeQuery();
	  	if(rs.next())
	  		response.sendRedirect("HomePage.html");
	  	else
	  		
	  		response.sendRedirect("AdminLogin.html");
	  	
	  	  
}catch(Exception e)
{
	   System.out.println("Error in connection");
	   e.printStackTrace();
}

%>
</body>
</html>