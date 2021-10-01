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
PrintWriter pw; %>
<% pw=response.getWriter();
try{
	  Class.forName("oracle.jdbc.driver.OracleDriver");
		con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "AGROXTECHNOLOGY",  "Manish@123");
		pst=con.prepareStatement("Insert into userdetails1 values(?,?,?)");
	  	  System.out.println("Database  connected");
	  	String mailid =request.getParameter("mailid");
	  	String username =request.getParameter("username");
	  	String password =request.getParameter("password");
	  	pst.setString(1,mailid);
	  	pst.setString(2,username);
	  	pst.setString(3,password);
	  	int res= pst.executeUpdate();
	  	 
	  	if(res>=1)
	  	{
	  		pw.println("<html><body>");
	  		pw.println("<h1>Registered succesfully");
	  		response.sendRedirect("HomePage.html");
	  		//pw.println("<br><a href='Insert.html'>Insert more</a></br>");
	  		pw.println("</body></html>");
	  	}

	  	else
	  	{
	  		pw.println("<html><body>");
		    pw.println("<h1>Error in insert");
		    pw.println("<a href='Home.html'>Go to home</a>");
	  		//pw.println("<br><a href='Insert.html'>Insert more</a></br>");
		    pw.println("</body></html>");
	  	}
	  		
	  	  
}catch(Exception e)
{
	    pw.println("<html><body>");
		pw.println("<h1>Error in insert"+e);
		pw.println("<a href='Home.html'>Go to home</a>");
		//pw.println("<br><a href='Insert.html'>Insert more</a></br>");
		pw.println("</body></html>"); 
	   System.out.println("Error in connection");
	   e.printStackTrace();
}




%>

</body>
</html>