<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
p.onef {
	border-style: solid;
	background-color: DarkBlue;
	margin-left: 130px;
	margin-right: 100px;
	width: 30%;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="Home.css" />
<title>Registration Page</title>

<script type="text/javascript">

function validation()
{
	{
		
		var name=document.regform.name.value;
		if(name=="")
			{
			alert("Please enter your name");
			
			document.regform.name.focus();
			return false;
			
			}
		   
		 var uname=document.regform.username.value;
		 if(uname=="")
			 {
			 alert("Please enter the username");
			 document.regform.username.focus();
			 return false;
			 
			 }
		 
		 var pass=document.regform.password.value; 
		 if(pass=="")
			 {
			 
			 alert("Please enter the password");
			 document.regform.password.focus();
			 return false;
			 }
		 
		 else if((pass.length<7) || (pass.length>15))
		 {
			 
			 alert("Password should be 7 and 15 characters");
			 document.regform.password.focus();
		 }
		 
		 long no=document.regform.phoneno.value;
		 if((no.length<10) || (no.length>10))
			 {
			 alert("Phone number should be of 10 numbers only");
			 document.regform.phoneno.focus();
			 return false;
			 }
		    }
	
	}


</script>

</head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<body>


	<h1 align="center" id="reg">
		<p class="onef">Registration
	</h1>

	<div class="register1">
		<form action="RegisterServlet" method="post" name="regform">

			<table align="center" id="table3" class="table table-hov">

				<tr class="table-info">
					<td align="right">Name</td>
					<td><input type="text" name="name" required></td>
				</tr>

				<tr class="table-info">
					<td align="right">Contact Number(format:10 digit)</td>
					<td><input type="text" name="no" pattern="^\d{10}$" required></td>
				</tr>

				<tr class="table-info">
					<td align="right">Set UserName</td>
					<td><input type="text" name="uname" required></td>
				</tr>

				<tr class="table-info">
					<td align="right">Set Password</td>
					<td><input type="password" name="pass" required></td>
				</tr>

				<tr>
					<td align="center"><input type="submit" button type="button"
						class="btn btn-outline-success" value="Register" onclick="validation()">
						</button></td>
				</tr>

			</table>


		</form>


		<h3 align="center">
			Have an Account?<a href="Login.jsp">Login</a>
		</h3>

	</div>
</body>
</html>