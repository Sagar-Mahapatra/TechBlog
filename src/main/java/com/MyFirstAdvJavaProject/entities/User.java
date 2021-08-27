package com.MyFirstAdvJavaProject.entities;

import java.sql.Timestamp;

public class User {

//fields
	private int id;
	private String name;
	private String email;
	private String password;
	private String city;
	private String state;
	private int zip;
	private Timestamp regdate;
	private String profile;

	// constructors
	public User(int id,String inputName, String email, String password, String city, String state, int zip, String profile2) {
		super();
		this.id = id;
		this.name = inputName;
		this.email = email;
		this.password = password;
		this.city = city;
		this.state = state;
		this.zip = zip;
		this.profile = profile2;
	}

	public User() {

	}

	public User(String name, String email, String password, String city, String state, int zip2,String profile) {
		super();
		this.name = name;
		this.email = email;
		this.password = password;
		this.city = city;
		this.state = state;
		this.zip = zip2;
		this.profile=profile;

	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	// getter & setters
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public int getZip() {
		return zip;
	}

	public void setZip(int zip) {
		this.zip = zip;
	}

	public Timestamp getDate() {
		return regdate;
	}

	public void setDate(Timestamp date) {
		this.regdate = date;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

}
