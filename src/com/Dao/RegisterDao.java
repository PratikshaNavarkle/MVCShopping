
package com.Dao;

import java.util.Date;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.model.Cart;
import com.model.Product;
import com.model.Register;

import jdk.nashorn.internal.ir.RuntimeNode.Request;

public class RegisterDao 
{
	Connection con;
	PreparedStatement ps;
	Statement statement;
	ResultSet rs;
	public void myConnection() throws Exception
	{
		Class.forName("oracle.jdbc.OracleDriver");
		//step2 connection to DB
		con=DriverManager.getConnection("jdbc:oracle:thin:@Pratiksha:1521:XE","SYSTEM","Pr@tiksha");
	}

	public int insertData(Register r) throws Exception
	{
		myConnection();
		int nextId=0;
		
		String sql="select userID.nextval from Regidata";
		ps=con.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{
			nextId=rs.getInt(1);
		}
		
		ps=con.prepareStatement("insert into Regidata values(?,?,?,?,?,CURRENT_TIMESTAMP)");
		ps.setInt(1, nextId);
		ps.setString(2, r.getName());
		ps.setLong(3, r.getNo());
		ps.setString(4, r.getUname());
		ps.setString(5, r.getPass());
		

		int i=ps.executeUpdate();
		con.close();
		return i;
	}

	public boolean checkUnique(String uname, String pass) throws Exception
	{
		myConnection();
		String username="";
		String password="";
		statement=con.createStatement();
		//ps=con.prepareStatement("select set_uname,set_pass from Regidata");
		rs=statement.executeQuery("select set_uname,set_pass from Regidata");
		while(rs.next())
		{
			username=rs.getString("set_uname");
			password=rs.getString("set_pass");
			
			if(username.equals(uname) && password.equals(pass))
			{
				return true;
			}
		}
		
		return false;
	}
	
	
	public int getAllCustomers(int pid) 
	{
		int id=pid;
		int  pprice = 0;
		//ArrayList<Product> list = new ArrayList<Product>();
		PreparedStatement ps=null;
		try {
			myConnection();
			String q="select pprice from Productdata where pid=?";
			ps=con.prepareStatement(q);
			ps.setInt(1, id);
			rs=ps.executeQuery();
			while(rs.next())
			{
				pprice=rs.getInt("pprice");
			}
			rs.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		//System.out.println("Before return");
		return pprice;
	}
	
	public int insertCart(Product p) throws Exception
	{
		myConnection();
		int nextId=0;
		
		String sql="select userID.nextval from Regidata";
		ps=con.prepareStatement(sql);
		rs=ps.executeQuery();
		if(rs.next())
		{
			nextId=rs.getInt(1);
		}
		
		ps=con.prepareStatement("insert into Cart values(?,?,?,CURRENT_TIMESTAMP,?,?)");
		ps.setString(1, p.getPname());
		ps.setInt(2, p.getPprice());
		ps.setInt(3, p.getPqty());
		ps.setInt(5, nextId);
		ps.setInt(6, p.getPid());
		
		
		int i=ps.executeUpdate();
		con.close();
		return i;
	}
	
	public List<Cart> getCart(int uid) throws Exception 
	{
		myConnection();
		List<Cart> lst=null;
		try
		{
		//System.out.println("Inside try");
		
		
		PreparedStatement ps = con.prepareStatement("select * from Cart where user_id=?");
		ps.setInt(1, uid);
		ResultSet rs = ps.executeQuery();
		Cart c=null;
	//	System.out.println("After Crt");
		while (rs.next()) 
		{
			c=new Cart();
			//System.out.println("Inside RS");
			c.setProdName(rs.getString(1));
			c.setProdPrice(rs.getInt(2));
			c.setProdQty(rs.getInt(3));
			c.setDate(rs.getTimestamp(4));
			c.setUserId(rs.getInt(5));
			c.setProdid(rs.getInt(6));
			//System.out.println("In RS");
		}
		lst=new ArrayList<Cart>();
		lst.add(c);
		rs.close();
		
		//s.setAttribute("cart",lst);
		//response.sendRedirect("MyProfile.jsp");
			
	}
		catch(Exception e)
		{
			System.out.println("In Profile Servlet\t"+e);
		}

		return lst;
	}
	
}
