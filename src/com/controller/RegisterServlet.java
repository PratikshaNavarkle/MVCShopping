package com.controller;

import javax.script.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.Dao.RegisterDao;
import com.model.Register;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet 
{
	private static final long serialVersionUID = 1L;

	public RegisterServlet() 
	{
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		//System.out.println("In Registter servlet");
		PrintWriter pw=response.getWriter();
		response.setContentType("text/html");
				
		//read the data from user
		String name=request.getParameter("name");
		String no=request.getParameter("no");
		String uname=request.getParameter("uname");
		String pass=request.getParameter("pass");

		//convert required data into int
		Long contact=Long.parseLong(no);
		
		//System.out.println("uname"+uname);
		//System.out.println("Pass"+pass);
				
		try
		{
		if(uname.equals(null) && pass.equals(null))
		{
			pw.println("<a href='Register.jsp'>GoBack</a>");
			pw.println("<h3>User Name and password is mandatory</h3>");
			System.out.println("Username and password is required");

		}
		}
		catch(Exception e)
		{
			System.out.println("Register Servlet\t"+e);
		}

		//object of Register model is created and user input is assigned to variables 
		Register r=new Register(name, contact, uname, pass);
		//System.out.println("Date to\t"+r.getDate());
		//System.out.println("Name is\t"+r.getName());
		
		//System.out.println(d);
		RegisterDao rd=new RegisterDao();
		try
		{
			//System.out.println("Inside try");
			Boolean result=rd.checkUnique(uname,pass);
			//System.out.println(result);
			//System.out.println("Before If");
			if(result==false)
			{
			//System.out.println("Inside if");
			int i=rd.insertData(r);
			//System.out.println("After insert");
			if(i>0)
			{
				
				System.out.println("Regisration is Successful....!!");
				response.sendRedirect("Login.jsp");
			}
			}
			else
			{
			/*pw.println("<script type=\"text/javascript\">");
			pw.println("alert('dead');");
			pw.println("</script");
			*/
			System.out.println("User name Password already used");
			response.sendRedirect("Register.jsp");
			}
		}
		catch(Exception e)
		{
			System.out.println("In Register servlet"+e);
		}

	}

}

