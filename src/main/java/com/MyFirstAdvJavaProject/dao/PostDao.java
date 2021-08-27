package com.MyFirstAdvJavaProject.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.MyFirstAdvJavaProject.entities.Category;
import com.MyFirstAdvJavaProject.entities.Posts;

public class PostDao {

	Connection con;

	public PostDao(Connection con) {
		super();
		this.con = con;
	}

	public ArrayList<Category> getCategories() {

		ArrayList<Category> list = new ArrayList<Category>();

		try {

			PreparedStatement pre = con.prepareStatement("SELECT * FROM category");
			ResultSet resultSet = pre.executeQuery();

			while (resultSet.next()) {

				int id = resultSet.getInt("id");
				String name = resultSet.getString("name");
				String desc = resultSet.getString("description");

				Category c = new Category(id, name, desc);
				list.add(c);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

	}

	public boolean savePost(Posts post) {

		boolean postRes = false;

		try {

			String Query = "insert into posts(title,catid,context,CODE,PIC,USERID) values(?,?,?,?,?,?);";

			PreparedStatement p = con.prepareStatement(Query);
			p.setString(1, post.getTitle());
			p.setInt(2, post.getCatid());
			p.setString(3, post.getContext());
			p.setString(4, post.getCODE());
			p.setString(5, post.getPIC());
			p.setInt(6, post.getUserId());
			p.executeUpdate();
			postRes = true;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return postRes;

	}

	public List<Posts> getAllPost() {

		List<Posts> list = new ArrayList<Posts>();

		try {

			PreparedStatement pre = con.prepareStatement("select * from posts");

			ResultSet r = pre.executeQuery();

			while (r.next()) {

				int pid = r.getInt("id");
				String title = r.getString("title");
				int catid = r.getInt("catid");
				String context = r.getString("context");
				String CODE = r.getString("CODE");
				String PIC = r.getString("PIC");

				int USERID = r.getInt("USERID");

				Posts po = new Posts(pid, title, catid, context, CODE, PIC, USERID);

				list.add(po);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;

	}

	public List<Posts> getPostbyCategoryId(int catId) {

		List<Posts> list = new ArrayList<Posts>();

		try {

			PreparedStatement pre = con.prepareStatement("select * from posts where catid=?");
			pre.setInt(1, catId);

			ResultSet r = pre.executeQuery();

			while (r.next()) {

				int pid = r.getInt("id");
				String title = r.getString("title");
				int catid = r.getInt("catid");
				String context = r.getString("context");
				String CODE = r.getString("CODE");
				String PIC = r.getString("PIC");
				Timestamp time = r.getTimestamp("DATE");
				int USERID = r.getInt("USERID");

				Posts po = new Posts(pid, title, catid, context, CODE, PIC, time, USERID);

				list.add(po);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

	}

	public Posts getPostDetailByPostId(int postId) {

		Posts post = new Posts();
		try {
			PreparedStatement p = con.prepareStatement("select * from Posts where id=?");
			p.setInt(1, postId);
			ResultSet r = p.executeQuery();

			while (r.next()) {

				String context = r.getString("context");
				String CODE = r.getString("CODE");

				post.setContext(context);
				post.setCODE(CODE);

			}

		}

		catch (Exception e) {
			e.printStackTrace();
		}
		return post;

	}
}