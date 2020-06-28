<%@page import="java.sql.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="MiniProject.css"/>
<title>LoginValidate</title>
</head>
<body>

	<%

	String uname=request.getParameter("uname");
	String pass=request.getParameter("pass");
	String name=null;
	int userId=0;
	HttpSession s=request.getSession();
	s.setAttribute("Username", uname);
	s.setAttribute("Password", pass);
	try
	{
		Class.forName("oracle.jdbc.OracleDriver");
		//step2 connection to DB
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@Pratiksha:1521:XE","SYSTEM","Pr@tiksha");
		Statement st=con.createStatement();
		String sql="select * from Regidata";
		ResultSet rs=st.executeQuery(sql);
		boolean flag= false;
		//System.out.println("Before While");
		while(rs.next())
		{
			if(uname.equals(rs.getString(4)) && pass.equals(rs.getString(5)))
			{
				
				PreparedStatement ps=con.prepareStatement("select name from Regidata");
				name=rs.getString("full_name");
				//System.out.println("Name is\t"+name);
				ps=con.prepareStatement("select user_id from Regidata");
				userId=rs.getInt("user_id");
				//System.out.println("UserID is\t"+userId);
				
				s.setAttribute("Name", name);
				s.setAttribute("ID", userId);
				flag=true;
			}
		}
		if(flag)
		{
			
			response.sendRedirect("Home.jsp");
		}
				
		else
		{
			out.println("<h1 id='validate'>Bad username or password</h1></br>");
			out.println("<a id='go' href='Login.jsp'>Go back</a>");
		}	
	} 
	catch(Exception e)
	{
		out.println("<h1>Database Error!! Login Validation Failed</h1>");
	}
	
	%>

</body>
</html>