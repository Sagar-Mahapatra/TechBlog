package com.MyFirstAdvJavaProject.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.MyFirstAdvJavaProject.dao.UserDao;
import com.MyFirstAdvJavaProject.entities.User;
import com.MyFirstAdvJavaProject.helper.ConnectionProvider;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	
	public void init() {
		System.out.println("init executed...");
	}
	public RegisterServlet() {
		super();
		// TODO Auto-generated constructor stub
		
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

//fetching the UserData
		String inputName = request.getParameter("inputName");
		String inputEmail = request.getParameter("inputEmail");
		String inputPassword = request.getParameter("inputPassword");
		String inputCity = request.getParameter("inputCity");
		String inputState = request.getParameter("inputState");
		String inputZip = request.getParameter("inputZip");
		int zip = Integer.parseInt(inputZip);
		String profile = request.getParameter("photo");

//call the saveUser() from UserDao to insert the data to dataBase 

//first we have to create UserDao object

		UserDao userDao = new UserDao(ConnectionProvider.getConnection());

//create a User object to call the saveUser()

		User user = new User(inputName, inputEmail, inputPassword, inputCity, inputState, zip, profile);
		if (userDao.saveUser(user)) {

			out.println("<h1>Welcome Mr. " + inputName + "</h1>");
			out.println("<h1>Data Stored Successfully...</h1>");
			out.println("<h1>You have successfully registered...</h1>");
			out.println("<h1>For Login <a href=\"login.jsp\" class=\"btn btn-primary\">Click Here</a></h1>");
		}

		else {
			out.println("<h1>Error!!!</h1>");
			out.println("<h1>Registration failed...</h1>");

		}

	}

}
