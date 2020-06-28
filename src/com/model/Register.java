package com.model;

import java.util.Date;

public class Register 
{
	//private int uid;
	private String name;
	private long no;
//	private Date date;
	private String uname;
	private String  pass;

	public Register(String name, long no, String uname, String pass) {
		super();
		this.name = name;
		this.no = no;
		this.uname = uname;
		this.pass = pass;
	}
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public long getNo() {
		return no;
	}

	public void setNo(long no) {
		this.no = no;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}


}
