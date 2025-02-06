package com.patrickhub.fitnessshop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import com.patrickhub.fitnessshop.bean.Product;


public class ProductDao {
	
	private final Logger LOG =  Logger.getLogger("Product.class");


	public List<Product> findAll(Connection connection) {
		List<Product> result = new ArrayList<>();
		LOG.info("Request to get all Products");

		if (connection == null) {
			LOG.severe("Conexiunea la baza de date este null!");
			throw new IllegalStateException("Conexiunea la baza de date este null.");
		}

		try {
			String sql = "SELECT * FROM products;";
			PreparedStatement statement = connection.prepareStatement(sql);
			ResultSet set = statement.executeQuery();
			while (set.next()) {
				Product product = new Product();
				product.setId(set.getInt("productID"));
				product.setName(set.getString("productName"));
				float priceInRON = set.getFloat("productPrice") * 5;
				product.setPrice(priceInRON);
				product.setDescription(set.getString("productDescription"));
				product.setImgPath(set.getString("productImgPath"));
				result.add(product);
			}
		} catch (SQLException e) {
			LOG.severe("Eroare la interogarea tabelei products: " + e.getMessage());
			e.printStackTrace();
		}
		return result;
	}





	/**
	 * find an "id" Product.
	 * 
	 * @param connection connection to the database
	 * @param id id of the product
	 * @return the product
	 */
	public Product findById(Connection connection, int id){
		
		Product product = null;
		LOG.info("Request to get Product: " + id);
		try {
			
			// write the select sql
			String sql = "SELECT * FROM products WHERE productID=?";
			
			// get the prepareStatement
			PreparedStatement statement = connection.prepareStatement(sql);
			
			// set parameters
			statement.setInt(1, id);
			
			// execute the sql request
			ResultSet set = statement.executeQuery();
			while(set.next()) {
				product = new Product();
				product.setId(set.getInt("productID"));
				product.setName(set.getString("productName"));
				product.setPrice(set.getFloat("productPrice"));
				product.setDescription(set.getString("productDescription"));
				product.setImgPath(set.getString("productImgPath"));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return product;
	}
}
