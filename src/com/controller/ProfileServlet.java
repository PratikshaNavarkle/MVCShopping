package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Arrays;
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

/**
 * Servlet implementation class ProfileServlet
 */
@WebServlet("/ProfileServlet")
public class ProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	List lst;
	public void init()
	{
		lst=new ArrayList();
	}
	
    public ProfileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HttpSession s=request.getSession();
		String uid=request.getParameter("uid");
		
		int userId=Integer.valueOf(uid);
		//System.out.println("User id in Profile is\t"+userId);
		List<Cart> alist=null;
		alist=new ArrayList<Cart>();
		RegisterDao rd=new RegisterDao();
		try
		{
			alist=rd.getCart(userId);
			
		/*System.out.println("Inside try");
		Class.forName("oracle.jdbc.OracleDriver");
		//Connection to database
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@Pratiksha:1521:XE", "SYSTEM","Pr@tiksha");//thin is a driver
		
		PreparedStatement ps = con.prepareStatement("select * from Cart where user_id=?");
		ps.setInt(1, userId);
		ResultSet rs = ps.executeQuery();
		Cart c=null;
		System.out.println("After Crt");
		while (rs.next()) 
		{
			c=new Cart();
			System.out.println("Inside RS");
			c.setProdName(rs.getString(1));
			c.setProdPrice(rs.getInt(2));
			c.setProdQty(rs.getInt(3));
			c.setDate(rs.getTimestamp(4));
			c.setUserId(rs.getInt(5));
			c.setProdid(rs.getInt(6));
			System.out.println("In RS");
		}
		lst.add(c);
		*/
		
		s.setAttribute("cart",alist);
		response.sendRedirect("MyProfile.jsp");
			
	}
		catch(Exception e)
		{
			System.out.println("In Profile Servlet\t"+e);
		}
	}
}
