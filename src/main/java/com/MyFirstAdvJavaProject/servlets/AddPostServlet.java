package com.MyFirstAdvJavaProject.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.MyFirstAdvJavaProject.dao.PostDao;
import com.MyFirstAdvJavaProject.entities.Posts;
import com.MyFirstAdvJavaProject.entities.User;
import com.MyFirstAdvJavaProject.helper.ConnectionProvider;

/**
 * Servlet implementation class AddPostServlet
 */
@WebServlet("/AddPostServlet")
@MultipartConfig
public class AddPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddPostServlet() {
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

		PrintWriter p;

		try {
			response.setContentType("text/html");
			p = response.getWriter();

			// fetching the form data
			int cid = Integer.parseInt(request.getParameter("postSelect"));
			String postTitle = request.getParameter("postTitle");
			String postcontext = request.getParameter("postcontext");
			String postCode = request.getParameter("postCode");
			String postPhoto = request.getParameter("postPhoto");

			// getting current id

			User u = (User) request.getSession().getAttribute("currentUser");
			int user_id = u.getId();

			// Creating a Post Object

			Posts posts = new Posts(postTitle, cid, postcontext, postCode, postPhoto, null, user_id);

			// putting the data into DB

			PostDao postDao = new PostDao(ConnectionProvider.getConnection());

			boolean z = postDao.savePost(posts);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
