package com.MyFirstAdvJavaProject.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LikeDao {

	Connection con;

	public LikeDao(Connection con) {
		super();
		this.con = con;
	}

	public boolean insertLike(int uid, int pid) {

		boolean i = false;

		try {

			PreparedStatement P = con.prepareStatement("INSERT INTO POSTLIKES(UID,PID) VALUES(?,?);");

			P.setInt(1, uid);
			P.setInt(2, pid);

			P.executeUpdate();
			i = true;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return i;
	}

	public int countLikeOnPost(int pid) {

		int count = 0;

		try {

			PreparedStatement P = con.prepareStatement("select count(*) from POSTLIKES where PID=?;");
			P.setInt(1, pid);
			ResultSet r = P.executeQuery();

			while (r.next()) {

				count = r.getInt(1);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return count;

	}

}
