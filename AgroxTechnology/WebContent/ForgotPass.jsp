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
ResultSet rs;
PrintWriter pw ;
%>
<% pw=response.getWriter();
try{
	  Class.forName("oracle.jdbc.driver.OracleDriver");
		con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "AGROXTECHNOLOGY",  "Manish@123");
		
		pst=con.prepareStatement("update userdetails1  set password=? where mailid=?");
	  	  System.out.println("Database  connected");
	  	  
	  	String mailid =request.getParameter("mailid");
	  	String password =request.getParameter("password");
	  
	  	pst.setString(1,mailid);
	  	pst.setString(2,password);
	  	
	  	int res= pst.executeUpdate();
	  	 
	  	if(res>=1)
	  	{
	  		pw.println("<html><body>");
	  		pw.println("<h1>"+res+ "Password is updated succesfully");
	  		
	  		pw.println("</body></html>");
	  	}

	  	else
	  	{
	  		pw.println("<html><body>");
		    pw.println("<h1>Error in update");
		    
		    pw.println("</body></html>");
	  	}
	  		
	  	  
}catch(Exception e)
{
	    pw.println("<html><body>");
		pw.println("<h1>Error in update"+e);
		
		pw.println("</body></html>"); 
	  System.out.println("Error in connection");
	   e.printStackTrace();
}
 %>
</body>
</html>