package com.cg.Utility;

import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.SQLException;

import com.cg.exceptions.MTBException;

import oracle.jdbc.driver.OracleDriver;

public class JDBCUtility {

	static Connection connection = null;
	public static Connection getConnection() throws MTBException {
		Driver driver = new OracleDriver();
		try {
			DriverManager.registerDriver(driver);
			connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1531:XE", "system", "oracle");
		} catch (SQLException e) {
			throw new MTBException("DB error");

		}
		return connection;

	}
}
