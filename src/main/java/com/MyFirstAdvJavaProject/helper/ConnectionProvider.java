package com.MyFirstAdvJavaProject.helper;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionProvider {

	private static Connection con;

	public static Connection getConnection() {

		try {

			if (con == null) {
				// driver load
				Class.forName(DataBaseDetail.Driver_Name);

				// create connection
				con = DriverManager.getConnection(DataBaseDetail.url, DataBaseDetail.username, DataBaseDetail.password);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return con;

	}

}