package com.web.connections;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	//Change 'localhost:3306' to your mysql server:port
	static final String URL="jdbc:mysql://localhost:3306/";
	//Change 'Airport' to the name of your database schema
	static final String DATABASE_NAME="airport";
	//Change the username and passwords for the account you want to use to access the mysql server
	static final String USERNAME="root";
	static final String PASSWORD="1127Aswan!";
	
	public static Connection getConnection() {
		Connection conn=null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(URL+DATABASE_NAME,USERNAME,PASSWORD);
					
		}catch (Exception e) {
			e.printStackTrace();
		}
		System.out.print("connected!");
		return conn;
	}
}
