package com.model;

import java.io.Serializable;
import java.sql.Timestamp;

public class Product implements Serializable
{
	private int pid;
	private String pname;
	private int pprice;
	private int pqty;
	
	
	public Product(int pid, String pname, int pprice, int pqty) 
	{
		super();
		this.pid = pid;
		this.pname = pname;
		this.pprice = pprice;
		this.pqty = pqty;
	}


	public int getPid() {
		return pid;
	}


	public void setPid(int pid) {
		this.pid = pid;
	}


	public String getPname() {
		return pname;
	}


	public void setPname(String pname) {
		this.pname = pname;
	}


	public int getPprice() {
		return pprice;
	}


	public void setPprice(int pprice) {
		this.pprice = pprice;
	}


	public int getPqty() {
		return pqty;
	}


	public void setPqty(int pqty) {
		this.pqty = pqty;
	}
}
