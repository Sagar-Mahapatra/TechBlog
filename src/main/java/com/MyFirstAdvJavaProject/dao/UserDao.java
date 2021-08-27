package com.MyFirstAdvJavaProject.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;

import com.MyFirstAdvJavaProject.entities.User;

public class UserDao {

	private Connection con;

	private PreparedStatement preparedStatement;

//creating a constructor using connection object
	public UserDao(Connection con) {
		super();
		this.con = con;
	}

//Create a method to insert user to database
	public boolean saveUser(User user) {

		boolean insert = false;

//create insert query

		String insertQuery = "insert into user(Name,Email,Password,City,State,Zip,Profile) values(?,?,?,?,?,?,?)";

		try {
			preparedStatement = con.prepareStatement(insertQuery);
			preparedStatement.setString(1, user.getName());
			preparedStatement.setString(2, user.getEmail());
			preparedStatement.setString(3, user.getPassword());
			preparedStatement.setString(4, user.getCity());
			preparedStatement.setString(5, user.getState());
			preparedStatement.setInt(6, user.getZip());
			preparedStatement.setString(7, user.getProfile());
			preparedStatement.executeUpdate();
			insert = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return insert;

	}

	// creating a getUser() to get User data from DB
	public User getUser(String email, String password) {

		User user = null;

		try {

			String Query = "select * from user where Email=? and Password=?";

			PreparedStatement preparedStatement = con.prepareStatement(Query);

			preparedStatement.setString(1, email);
			preparedStatement.setString(2, password);

			ResultSet resultSet = preparedStatement.executeQuery();

//We can get the metadata of ResultSet
			ResultSetMetaData metaData = resultSet.getMetaData();

			System.out.println("ResultSet MetaData:: " + metaData);

			int columnCount = metaData.getColumnCount();

			System.out.println("columnCount:: " + columnCount);

			if (resultSet.next()) {

				user = new User();

//fetching data from DB	
				String name = resultSet.getString("Name");
				String Email = resultSet.getString("Email");
				String Password = resultSet.getString("Password");
				String city = resultSet.getString("City");
				String state = resultSet.getString("State");
				int zip = resultSet.getInt("Zip");
				String profile = resultSet.getString("Profile");
				int id = resultSet.getInt("Id");

//putting the data into user
				user.setName(name);
				user.setEmail(Email);
				user.setPassword(Password);
				user.setCity(city);
				user.setState(state);
				user.setZip(zip);
				user.setProfile(profile);
				user.setId(id);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return user;

	}

	public boolean updateUser(User user) {

		boolean f = false;

		try {

			String Query = "update user set Email=?,Password=?,City=?,State=?,Zip=? where Id=?";

			PreparedStatement preparedStatement = con.prepareStatement(Query);

//we can execute preparedStatement by passing different parameters also.
//PreparedStatement preparedStatement = con.prepareStatement(Query, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);

			preparedStatement.setString(1, user.getEmail());
			preparedStatement.setString(2, user.getPassword());
			preparedStatement.setString(3, user.getCity());
			preparedStatement.setString(4, user.getState());
			preparedStatement.setInt(5, user.getZip());
			preparedStatement.setInt(6, user.getId());
			preparedStatement.executeUpdate();

			f = true;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public User getUserByUserId(int userId) {

		User user = new User();

		try {

			PreparedStatement p = con.prepareStatement("select * from user where Id=?");
			p.setInt(1, userId);

			ResultSet r = p.executeQuery();

			while (r.next()) {

				String name = r.getString("Name");
				int uid = r.getInt("Id");
				user.setName(name);
				user.setId(uid);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return user;

	}

}
