package com.controller;
import java.util.Iterator;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.Bill;
import com.model.Product;

@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet 
{
	private static final long serialVersionUID = 1L;

	public CartServlet() 
	{
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HttpSession session=request.getSession();

		double total=0,gst,finalTotal;
		//List<Product> lst = (List<Product>) session.getAttribute("shop");
		List<Product> lst=null;
		lst= (List<Product>) session.getAttribute("shop");
		
		//System.out.println("Shop List");

			try
			{
				//System.out.println("bill section2");
				/*Iterator<Product> iterator= lst.iterator();//iterator interface
				while(iterator.hasNext())//iterate through all data till last record
				{
					System.out.println("bill section2");
					Product p=iterator.next();
					total=total+(p.getPprice()*p.getPqty());
					System.out.println("bill section3");
					*/
		
					for(Product p:lst)
					{
					//	System.out.println("In for loop");
						total=total+(p.getPprice()*p.getPqty());
						//System.out.println("bill section");
					}
					
					gst=total*0.12;
					finalTotal=gst+total;

					Bill b=new Bill(101, total, gst, finalTotal);
					session.setAttribute("bill",b);
					
					response.sendRedirect("Bill.jsp");
				

			}
			catch(Exception e)
			{
				System.out.println("In Cart Servlet"+e);
			}
			
		
	}
}
