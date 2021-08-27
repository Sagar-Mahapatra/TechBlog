package com.MyFirstAdvJavaProject.entities;

import java.sql.Timestamp;

public class Posts {

	private int id;
	private String title;
	private int catid;
	private String context;
	private String CODE;
	private String PIC;
	private Timestamp DATE;
	private int UserId;

	public Posts(int id, String title, int catid, String context, String cODE, String pIC, Timestamp dATE, int UserId) {
		super();
		this.id = id;
		this.title = title;
		this.catid = catid;
		this.context = context;
		this.CODE = cODE;
		this.PIC = pIC;
		this.DATE = dATE;
		this.UserId = UserId;
	}

	public int getUserId() {
		return UserId;
	}

	public void setUserId(int userId) {
		UserId = userId;
	}

	public Posts(String title, int catid, String context, String cODE, String pIC, Timestamp dATE, int UserId) {
		super();
		this.title = title;
		this.catid = catid;
		this.context = context;
		this.CODE = cODE;
		this.PIC = pIC;
		this.DATE = dATE;
		this.UserId = UserId;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getCatid() {
		return catid;
	}

	public void setCatid(int catid) {
		this.catid = catid;
	}

	public String getContext() {
		return context;
	}

	public void setContext(String context) {
		this.context = context;
	}

	public String getCODE() {
		return CODE;
	}

	public void setCODE(String cODE) {
		CODE = cODE;
	}

	public String getPIC() {
		return PIC;
	}

	public void setPIC(String pIC) {
		PIC = pIC;
	}

	public Timestamp getDATE() {
		return DATE;
	}

	public void setDATE(Timestamp dATE) {
		DATE = dATE;
	}

	public Posts() {
		super();
	}

	public Posts(int id, String title, int catid, String context, String cODE, String pIC, int userId) {
		super();
		this.id = id;
		this.title = title;
		this.catid = catid;
		this.context = context;
		CODE = cODE;
		PIC = pIC;
		UserId = userId;
	}

}
