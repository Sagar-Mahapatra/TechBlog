package com.MyFirstAdvJavaProject.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.MyFirstAdvJavaProject.dao.UserDao;
import com.MyFirstAdvJavaProject.entities.User;
import com.MyFirstAdvJavaProject.helper.ConnectionProvider;
import com.MyFirstAdvJavaProject.helper.Message;

/**
 * Servlet implementation class LogInServlet
 */
@WebServlet("/LogInServlet")
public class LogInServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LogInServlet() {
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
		PrintWriter out = response.getWriter();

//getting user data
		String email = request.getParameter("email");
		String password = request.getParameter("password");

//calling the getUser() to get data from DB

		UserDao u = new UserDao(ConnectionProvider.getConnection());

		User user = u.getUser(email, password);

		if (user == null) {

			Message loginError = new Message("Something went wrong!!! please try again...", "alert-danger");

			HttpSession s = request.getSession();
			s.setAttribute("msg", loginError);

			response.sendRedirect("login.jsp");

		} else {

//storing user object by session	
			HttpSession s = request.getSession();
			s.setAttribute("currentUser", user);
//redirecting to Profile page
			response.sendRedirect("Profile.jsp");

		}

	}

}
