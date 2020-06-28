<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="MiniP.css">

<title>Product List</title>
<style>
body {
	background-image:
		url("https://thoughtsinstyle.files.wordpress.com/2017/02/foto-02-02-17-15-52-06.jpg?resize=1440%2C1078");
	background-repeat: no-repeat;
	background-size: cover;
}

table {
	border: 4px solid black;
	border-spacing: 5px;
}

input[type=submit] {
	border: 2px solid green;
	border-radius: 4px;
	background-color: green;
	color: white;
}
</style>

</head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<body>
	
	<div id="first">
		<button name="user" onclick="redirectUser()" id="buttonB"
			type="button" class="btn btn-outline-success">MyProfile</button>
		<script type="text/javascript">
			function redirectUser() {
				location.href = "MyProfile.jsp";
			}
		</script>

		<button name="Purchase Products" id="buttonB" type="button"
			class="btn btn-outline-success" onclick="redirectProduct()">Purchase
			Products</button>
		<script type="text/javascript">
			function redirectProduct() {
				location.href = "Product.jsp";
			}
		</script>

		<button name="mycart" id="buttonB" onclick="redirectCart()"
			type="button" class="btn btn-outline-success">My Cart</button>
		<script type="text/javascript">
			function redirectCart() {
				location.href = "MyCart.jsp";
			}
		</script>


		<div id="lbut">
			<button name="logout" id="lbut" onclick="redirectLogout()"
				type="button" class="btn btn-danger">Logout</button>
		</div>
		<script type="text/javascript">
			function redirectLogout() {
				location.href = "Login.jsp";
			}
		</script>
	</div>
	<br>
	<hr>

	<%
		HttpSession s = request.getSession();
		String name = (String) s.getAttribute("Name");
		//System.out.println("Name from JSP is\t" + name);
		out.println("<h1 id='Y'> Welcome to Stationery </h1>");
	%>

	<h3 id="avail">Available Products are:</h3>

	<div class="B">
		<form action="ProductServlet" method="post">
			<%
				try {
					response.setContentType("text/html");
					Class.forName("oracle.jdbc.OracleDriver");
					//Connection to database
					Connection con = DriverManager.getConnection("jdbc:oracle:thin:@Pratiksha:1521:XE", "SYSTEM",
							"Pr@tiksha");//thinn is a driver
					PreparedStatement ps = con.prepareStatement("select * from Productdata");
					ResultSet rs = ps.executeQuery();
					PrintWriter pw = response.getWriter();
					pw.println(
							"<html><body><table border='3' align='left' id='Tab'> <tr><td>Product ID</td><td>Product Name</td><td>Product Price</td></tr> ");
					while (rs.next()) {
						pw.println("<tr><td>" + rs.getInt(1) + "</td><td>" + rs.getString(2) + "</td><td>" + rs.getInt(3)
								+ "</td> </tr>");
					}
					pw.println(" </table></body></html>");
				} catch (Exception e) {
					e.printStackTrace();
				}
			%>

			<table align="center" style="width: 400px" id="tab">
				<tr>
					<td bgcolor="#94b998">Enter Product id</td>
					<td><input type="text" name="pid"></td>
				</tr>
			
				<tr>
					<td bgcolor="#94b998">Enter Product Name</td>
					<td><input type="text" name="pname"></td>
				</tr>


				<tr>
					<td bgcolor="#94b998">Enter Product Quantity</td>
					<td><input type="text" name="qty"></td>
				</tr>

				<tr>
					<td align="right"><input type="submit" value="Add to cart"></td>
			</table>
		</form>
	</div>

	<div>
		<p id="para">
			<br>
		</p>
	</div>

	<div id="buttonF">
		<button name="ContactUs" onclick="redirectContact()" type="button"
			class="btn btn-outline-success">Contact Us</button>
		<script type="text/javascript">
			function redirectContact() {
				var mail = "E-mail Us On:" + "</br>" + "</br>";
				;
				var id = "Stationerystore@gmail.com" + "</br>" + "</br>";
				;
				var contact = "Contact Us On:" + "</br>" + "</br>";
				;
				var no = 1234567894;

				document.getElementById("para").innerHTML = mail + id + contact
						+ no;

			}
		</script>
		<div id="aus">
			<button name="AboutUs" onclick="redirectAbout()" type="button"
				class="btn btn-outline-success">AboutUs</button>
		</div>
		<script type="text/javascript">
			function redirectAbout() {
				var about = "We are a Stationery Shopping site providing with different day to day products that are required by students.This shopping site not only show products but also lets us know whether they are in the stock or not.";
				document.getElementById("para").innerHTML = about;
			}
		</script>
	</div>

</body>
</html>