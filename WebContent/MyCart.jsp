<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.model.Product"%>
<%@page import="java.util.List"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Cart</title>
</head>
<body>
<%-- 

<div id="first">
		<button name="user" onclick="redirectUser()" id="buttonB">MyProfile</button>
		<script type="text/javascript">
			function redirectUser() {
				location.href = "MyProfile.jsp";
			}
		</script>

		<button name="AboutUs" onclick="redirectAbout()" id="buttonB">AboutUs</button>
		<script type="text/javascript">
			function redirectAbout() {
				var about = "We are a Stationery Shopping site providing with different day to day products that are required by students.This shopping site not only show products but also lets us know whether they are in the stock or not.";
				document.getElementById("para").innerHTML = about;
			}
		</script>

		<button name="logout" onclick="redirectLogout()" id="buttonB">Logout</button>
		<script type="text/javascript">
			function redirectLogout() {
				location.href = "Login.jsp";
			}
		</script>
	</div>
	<br>
	<hr>
	<%!List<Product> lst;%>

	<%
		if (!session.isNew())
		{
			lst= (List<Product>) session.getAttribute("shop");
			//session.invalidate();
			//System.out.println("In if statement");
	%>

	<%
			//iterate
			if(lst!=null)
			{
				Iterator<Product> iterator= lst.iterator();//iterator interface
				while(iterator.hasNext())//iterate through all data till last record
				{
				Product p=iterator.next();
		%>
	<h2 align="center">Your Product List</h2>
	<table align="center">

		<tr>
			<td>Product ID</td>
			<td>Product Name</td>
			<td>Product Price</td>
			<td>Product Quantity</td>
		</tr>

		<tr>
			<td><%=p.getPid()%></td>
			<td><%=p.getPname()%></td>
			<td><%=p.getPprice()%></td>
			<td><%=p.getPqty()%></td>
		</tr>

	</table>

	<form action="CartServlet" method="post">
		<input type="submit" value="Generate Bill" align="middle" margine-right="50px">
	</form>

	<%	}
			}
			else
			{
				out.println("<h1>Your cart is empty</h1>");
				out.println("<h1>Do you want to buy Products? Click <a href='Product.jsp'>here</a></h1>");
				
			}
		%>

	<%
		}
	%>


	<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
%>
</body>
</html>

--%> 
	
	
	<%!List<Product> lst;%>
	
	<%
		if (!session.isNew())
		{
			lst= (List<Product>) session.getAttribute("shop");
			//session.invalidate();
		//	System.out.println("In if statement");
	%>
	
	<%
			//iterate
			if(lst!=null)
			{
				Iterator<Product> iterator= lst.iterator();//iterator interface
				while(iterator.hasNext())//iterate through all data till last record
				{
				Product p=iterator.next();
		%>
		
	<h2 align="center">Your Product List</h2>
	<table border="2" align="center">
		
		<tr>
			<td>Product ID</td>
			<td>Product Name</td>
			<td>Product Price</td>
			<td>Product Quantity</td>
		</tr>
		
		<tr>
			<td><%=p.getPid()%></td>
			<td><%=p.getPname()%></td>
			<td><%=p.getPprice()%></td>
			<td><%=p.getPqty()%></td>
		</tr>
		<%
			}
			}
			else
			{
				out.println("<h1>Your cart is empty</h1>");
				out.println("<h1>Do you want to buy Products? Click <a href='Product.jsp'>here</a></h1>");
				
			}
		%>
		
	</table>
	<%
		}
	%>
	
	<form action="CartServlet" method="post">
		<input type="submit" value="Generate Bill" align="right">
	</form>

</body>
</html>