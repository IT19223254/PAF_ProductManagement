package com;

import java.sql.*;

public class Product
{
	//A common method to connect to the DB
	private Connection connect()
	{
		Connection con = null;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			
			//Provide the correct details: DBServer/DBName, username, password
			con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/gadgetbadget_db", "root", "");
			
		}
		catch (Exception e)
		{e.printStackTrace();}
		
		return con;
	}
	
	public String insertProduct(String name, String price, String warrenty, String desc)
	{
		String output = "";
		try
		{
			Connection con = connect();
			if (con == null)
			{return "Error while connecting to the database for inserting."; }
			
			// create a prepared statement
			String query = " insert into product(`productID`,`productName`,`productPrice`,`warrenty`,`productDesc`)"
					+ " values (?, ?, ?, ?, ?)";
			
			PreparedStatement preparedStmt = con.prepareStatement(query);
			
			// binding values
			preparedStmt.setInt(1, 0);
			preparedStmt.setString(2, name);
			preparedStmt.setDouble(3, Double.parseDouble(price));
			preparedStmt.setString(4, warrenty);
			preparedStmt.setString(5, desc);
			
			// execute the statement3
			preparedStmt.execute();
			con.close();
			
			String newProducts = readProduct();
			output = "{\"status\":\"success\", \"data\": \"" +
					newProducts + "\"}";
			
		}
		catch (Exception e)
		{
			output = "{\"status\":\"error\", \"data\":\"Error while inserting the product.\"}";
			System.err.println(e.getMessage());
		}
		return output;
	}
	
	public String readProduct()
	{
		String output = "";
		try
		{
			Connection con = connect();
			if (con == null)
			{return "Error while connecting to the database for reading."; }
			
			// Prepare the html table to be displayed
			output = "<table class='table table-success table-striped'><tr><th>Product Name</th>" +
					"<th>Product Price</th>" +
					"<th>Product Warrenty</th>" +
					"<th>Product Description</th>" +
					"<th>Update</th><th>Remove</th></tr>";
			
			String query = "select * from product";
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			
			// iterate through the rows in the result set
			while (rs.next())
			{
				String productID = Integer.toString(rs.getInt("productID"));
				String productName = rs.getString("productName");
				String productPrice = Double.toString(rs.getDouble("productPrice"));
				String warrenty = rs.getString("warrenty");
				String productDesc = rs.getString("productDesc");
				
				// Add into the html table
				output += "<tr><td><input id='hidProductIDUpdate' name='hidProductIDUpdate' type='hidden' value='" + productID + "'>"
						+ productName + "</td>";
				output += "<td>" + productPrice + "</td>";
				output += "<td>" + warrenty + "</td>";
				output += "<td>" + productDesc + "</td>";
				
				// buttons
				output += "<td><input name='btnUpdate' type='button' value='Update' "
						+ "class='btnUpdate btn btn-secondary' data-productid='" + productID + "'></td>"
						+ "<td><input name='btnRemove' type='button' value='Remove' class='btnRemove btn btn-danger' data-productid='" + productID + "'>" +"</td></tr>";
			}
			
			con.close();
			// Complete the html table
			output += "</table>";
		}
		catch (Exception e)
		{
			
			output = "Error while reading the product.";
			System.err.println(e.getMessage());
			
		}
		
		return output;
	}
	

	public String updateProduct(String id, String name, String price, String warrenty, String desc)
		{
		String output = "";
		try
		{
			Connection con = connect();
			if (con == null)
			{return "Error while connecting to the database for updating."; }
			
			// create a prepared statement
			String query = "UPDATE product SET productName=?,productPrice=?,warrenty=?,productDesc=? WHERE productID=?";
							PreparedStatement preparedStmt = con.prepareStatement(query);
			
			// binding values
			
			preparedStmt.setString(1, name);
			preparedStmt.setDouble(2, Double.parseDouble(price));
			preparedStmt.setString(3, warrenty);
			preparedStmt.setString(4, desc);
			preparedStmt.setInt(5, Integer.parseInt(id));
			
			// execute the statement
			preparedStmt.execute();
			con.close();
			
			String newProducts = readProduct();
			output = "{\"status\":\"success\", \"data\": \"" +
					newProducts + "\"}";
			
		}
		catch (Exception e)
		{
			
			output = "{\"status\":\"error\", \"data\":\"Error while updating the product.\"}";
			System.err.println(e.getMessage());
			
		}
		
		return output;
	}
	
	public String deleteProduct(String productID)
	{
		String output = "";
		try
		{
			Connection con = connect();
			if (con == null)
			{return "Error while connecting to the database for deleting."; }
			
			// create a prepared statement
			String query = "delete from product where productID=?";
			PreparedStatement preparedStmt = con.prepareStatement(query);
			
			// binding values
			preparedStmt.setInt(1, Integer.parseInt(productID));
			
			// execute the statement
			preparedStmt.execute();
			con.close();
			
			String newProducts = readProduct();
			output = "{\"status\":\"success\", \"data\": \"" +
					newProducts + "\"}";
			
		}
		catch (Exception e)
		{
			
			output = "{\"status\":\"error\", \"data\":\"Error while deleting the product.\"}";
			System.err.println(e.getMessage());
			
		}
		
		return output;
	}
}
