<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
body {
	background-image:
		url("https://banner2.cleanpng.com/20180326/ytq/kisspng-school-picture-frames-becon-enterprise-sdn-bhd-c-ppt-5ab914e4763764.5223561015220789484842.jpg");
	background-repeat: no-repeat;
	background-position: center;
	background-size: cover;
}

p.one {
	border-style: solid;
	background-color: green;
	margin-left: 470px;
	width: 40%;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="Home.css" />

<title>Login Page</title>

</head>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<body>


	<h1 align="center" id="heading">
		<p class="one">Welcome to Direct Stationery Pratiksha
	</h1>
	<hr>
	<form action="LoginValidate.jsp" method="post" name="myform">
		<table align="center" id="table1" class="table table-hover table-sm ">

			<tr class="table-primary">
				<td align="right"><h3>Enter User Name:</h3></td>
				<td><input type="text" name="uname" required></td>
				<br>


			</tr>

			<tr class="table-primary">
				<td align="right"><h3>Enter Password:</h3></td>
				<td><input type="password" name="pass" required></td>
				<br>

			</tr>
			<tr>
				<td id="login" align="right"><input type="submit" button
					type="button" class="btn btn-outline-success" value="Login"
					onclick="return validate()">
					</button>
			</tr>
		</table>

	</form>

	<h3 align="center">
		New here?<a href="Register.jsp">Register</a>
	</h3>

</body>
</html>