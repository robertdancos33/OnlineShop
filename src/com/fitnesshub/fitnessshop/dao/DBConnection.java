package com.patrickhub.fitnessshop.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Logger;

import sun.security.action.GetLongAction;


public class DBConnection {
	
	private static final Logger LOG = Logger.getLogger("DBConnection.class");

	public static Connection getConncetionToDatabase() {
		Connection connection = null;
		try {
			// Încarcă driverul MySQL
			Class.forName("com.mysql.cj.jdbc.Driver");

			// Creează conexiunea
			connection = DriverManager.getConnection(
					"jdbc:mysql://fitness-shop-mysql.dev:3306/fitnessshopdb", // corectăm numele bazei de date
					"admin", // utilizatorul creat
					"admin"  // parola utilizatorului
			);
			System.out.println("Conexiune la baza de date reușită!");
		} catch (Exception e) {
			e.printStackTrace();
			System.err.println("Eroare la conectarea la baza de date.");
		}
		return connection;
	}







}
