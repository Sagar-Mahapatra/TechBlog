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

/**
 * Servlet implementation class EditServlet
 */
@WebServlet("/EditServlet")
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EditServlet() {
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

		String editEmail = request.getParameter("editEmail");
		String editpassword = request.getParameter("editpassword");
		String editCity = request.getParameter("editCity");
		String editState = request.getParameter("editState");
		String editZip = request.getParameter("editZip");
		int zip = Integer.parseInt(editZip);

		HttpSession h = request.getSession();

		User use = (User) h.getAttribute("currentUser");

		use.setEmail(editEmail);
		use.setPassword(editpassword);
		use.setCity(editCity);
		use.setState(editState);
		use.setZip(zip);

		UserDao userdao = new UserDao(ConnectionProvider.getConnection());
		if (userdao.updateUser(use)) {

			out.println("<h1>Updated</h1>");
		} else {

			out.print("<h1>Not Updated</h1>");
		}

	}

}
