<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="jdk.nashorn.internal.runtime.RewriteException"%>
<%@page import="com.model.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.model.Bill"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="MyCart.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Bill</title>
</head>
<body>

	
<h1>
Bill No :
${bill.billNo}<br>

Bill Total:
${bill.total}<br>

Bill GST :
${bill.gst}<br>

Bill Final Amount :
${bill.finalTotal}<br>

</h1>	
	
	<form action="Login.jsp">

		<input type="submit" value="Logout">

	</form>
	
	<%
	try
	{
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); 
	//response.sendRedirect("Login.jsp");
	}
	catch(Exception e)
	{
		System.out.println("In Bill"+e);
	}
	
	%>

	<%
		lst.removeAll(lst);
		
	%>

</body>
</html>