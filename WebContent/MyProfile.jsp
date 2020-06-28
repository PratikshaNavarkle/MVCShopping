<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="com.model.Cart"%>
<%@page import="java.io.PrintWriter"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Profile</title>
<link rel="stylesheet" type="text/css" href="Home.css" />
</head>
<body>

	<h1 id="B">My Profile</h1>
	<hr>
	<%
	
		try {
			HttpSession s=request.getSession();
			int u=(Integer)s.getAttribute("ID");
			
					//response.setContentType("text/html");
					Class.forName("oracle.jdbc.OracleDriver");
					//Connection to database
					Connection con = DriverManager.getConnection("jdbc:oracle:thin:@Pratiksha:1521:XE", "SYSTEM",
							"Pr@tiksha");//thinn is a driver
					PreparedStatement ps = con.prepareStatement("select * from Regidata where user_id=?");
					
					ps.setInt(1, u);
					ResultSet rs = ps.executeQuery();
					PrintWriter pw = response.getWriter();
					pw.println(
							"<html><body><table border='3' align='center' id='A'> <tr><td>User ID</td><td>Full Name</td><td>Contact Number</td><td>Username</td><td>Password</td></tr> ");
					while (rs.next()) {
						pw.println("<tr><td>" + rs.getInt(1) + "</td><td>" + rs.getString(2) + "</td><td>" + rs.getLong(3)
								+ "</td><td>"+rs.getString(4)+"</td><td>"+rs.getString(5)+"</td></tr>");
					}
					pw.println(" </table></body></html>");
				} catch (Exception e) {
					e.printStackTrace();
				}
			%>

	<h2>Enter your User ID to see your history</h2>
	<form method="post" action="ProfileServlet">
		<input type="text" name="uid"> <input type="submit" value="Check History">
	</form>

<%!
	Cart c;
%>

<%

	if(!session.isNew()){
		c=(Cart)session.getAttribute("cart");
		session.invalidate();
	}
%>

<h1 align="center">History</h1>

${Cart}<br>

<table border="2" cellpadding="5" scellspacing="5" align="center">

	<tr>
	<td>Product Name</td>
	<td>Product Price</td>
	<td>Product Quantity</td>
	<td>Product Id</td>
	<td>Purchase Date</td>
</tr>


	

</table>
	

</body>
</html>