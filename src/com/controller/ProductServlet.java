package com.controller;
import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Dao.RegisterDao;
import com.model.Cart;
import com.model.Product;
import com.sun.org.apache.bcel.internal.generic.LSTORE;


@WebServlet("/ProductServlet")
public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	List<Product> lst;
	public void init()
	{
		lst=new ArrayList<Product>();
	}
	
	public ProductServlet() {
		super();
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		PrintWriter pw=response.getWriter();
		String id=request.getParameter("pid");
		String pname=request.getParameter("pname");
		String quantity=request.getParameter("qty");
		
		//convert into int
		int pid=Integer.parseInt(id);
		//System.out.println("PID IS\t"+pid);
		int pqty=Integer.parseInt(quantity);
		int prodprice=0;
		
		RegisterDao rd=new RegisterDao();
		try
		{
			prodprice=rd.getAllCustomers(pid);
			//System.out.println("Price is\t"+prodprice);
		}
		catch(Exception e)
		{
			System.out.println("In Product Servelt"+e);
		}
		Product p=new Product(pid, pname, prodprice, pqty);
		lst.add(p);
	/*	try
		{
			System.out.println("Inside try");
			int x=rd.insertCart(p);
			System.out.println("After try");
			if(x>0)
			{
				System.out.println("Inserted into Cart");
			}
		}
		catch(Exception ex)
		{
			System.out.println("In InsertCart\t"+ex);
		}
		*/
		
		HttpSession session=request.getSession(true);
		session.setAttribute("shop",lst);
		
		response.sendRedirect("Product.jsp");
		
		/*pw.print("DO you want to add more product<br>");
		pw.print("<a href='Product.jsp'>YES</a><br> ");
		pw.print("<a href='MyCart.jsp'>NO</a>"); 
		*/

	}
	
}
