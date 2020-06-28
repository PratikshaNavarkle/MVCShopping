<%@page import="java.awt.peer.SystemTrayPeer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home Page</title>
<link rel="stylesheet" type="text/css" href="MiniP.css" />

</head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<body>

<%
HttpSession s=request.getSession();
	if(s.getAttribute("Username")==null && s.getAttribute("Password")==null)
	{
		response.sendRedirect("Login.jsp");
	}
%>

	<div id="first">
		<button name="user" onclick="redirectUser()" id="buttonB" type="button" class="btn btn-outline-success">MyProfile</button>
		<script type="text/javascript">
			function redirectUser() {
				location.href = "MyProfile.jsp";
			}
		</script>

		<button name="Purchase Products" id="buttonB" type="button" class="btn btn-outline-success"
			onclick="redirectProduct()">Purchase Products</button>
		<script type="text/javascript">
			function redirectProduct() {
				location.href = "Product.jsp";
			}
		</script>

		<button name="mycart" id="buttonB" onclick="redirectCart()" type="button" class="btn btn-outline-success">My Cart</button>
		<script type="text/javascript">
			function redirectCart() {
				location.href = "MyCart.jsp";
			}
		</script>

		
        <div id="lbut"> 
		<button name="logout" id="lbut" onclick="redirectLogout()"  type="button" class="btn btn-danger">Logout</button></div>
		<script type="text/javascript">
		
			function redirectLogout() {
				location.href = "Login.jsp";
			}
		</script>
	</div>
	<br>
	<hr>

	<%
		//HttpSession s = request.getSession();
		String name = (String) s.getAttribute("Name");
	//	System.out.println("Name from JSP is\t" + name);
		out.println("<h1 id='headO'  >" + name + "  Welcome to Stationery Store ! </h1>");
	%>
	<div>
		<p id="para">
		<br>
		</p>
	</div>
	
	<div id="buttonF">
		<button name="ContactUs" onclick="redirectContact()" type="button" class="btn btn-outline-success">Contact Us</button>
		<script type="text/javascript">
			function redirectContact() {
				var mail="E-mail Us On:"+"</br>"+"</br>";;
				var id="Stationerystore@gmail.com"+"</br>"+"</br>";;
				var contact="Contact Us On:"+"</br>"+"</br>";;
				var no=1234567894;
				
				document.getElementById("para").innerHTML = mail + id + contact + no;
				
			}
			</script>
			<div id="aus">
			<button name="AboutUs" onclick="redirectAbout()"  type="button" class="btn btn-outline-success">AboutUs</button></div>
			<script type="text/javascript">
				function redirectAbout() {
					var about = "We are a Stationery Shopping site providing with different day to day products that are required by students.This shopping site not only show products but also lets us know whether they are in the stock or not.";
					document.getElementById("para").innerHTML = about;
				}
				
		</script>
	</div>

</body>
</html>