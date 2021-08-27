package com.MyFirstAdvJavaProject.helper;

public class Message {

	private String msg;
	private String cssClass;

	public Message(String msg, String cssClass) {
		super();
		this.msg = msg;
		this.cssClass = cssClass;
	}

	public String getCssClass() {
		return cssClass;
	}

	public void setCssClass(String cssClass) {
		this.cssClass = cssClass;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

}
