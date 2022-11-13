package com.xadmin.hotelmanagement.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.xadmin.hotelmanagement.bean.Hotel;

public class HotelDAO {
	
	private String jdbcURL = "jdbc:mysql://localhost:3306/paradize";
    private String jdbcUsername= "root";
    private String jdbcPassword = "Aravind@2001";
    private String jdbcDriver = "com.mysql.jdbc.Driver";
    
    public HotelDAO() {
    	
    }
    
    protected Connection getConnection()
    {
    	Connection con = null;
    	try {
    		Class.forName(jdbcDriver);
    		con = DriverManager.getConnection(jdbcURL,jdbcUsername,jdbcPassword);
    		
    	} catch (SQLException e)
    	{
    		e.printStackTrace();
    	} 
    	catch(ClassNotFoundException e)
    	{
    		e.printStackTrace();
    	}
    	return con;
    }
    
    //list user
    public List<Hotel> select() {
    	
    	List<Hotel> hotels = new ArrayList<>();
    	
    	try {
    		String m = "arvichukli@gmail.com";
    		Connection con = getConnection();
    		PreparedStatement ps = con.prepareStatement("select * from customer_bookings where email=?");
    		ps.setString(1,m);
    		System.out.println("Prepared statement");
    		
    		ResultSet rs = ps.executeQuery();
    		while(rs.next())
    		{
    			int id = rs.getInt("id");
    			String name = rs.getString("name");
    			String email = rs.getString("email");
    			String checkin = rs.getString("checkin");
    			String checkout = rs.getString("checkout");
    			String roomtype = rs.getString("room_type");
    			int room_num = rs.getInt("room_num");
    			int rate = rs.getInt("rate");
    			int cost = rs.getInt("cost");
    			
    			hotels.add(new Hotel(id,name,email,checkin,checkout,roomtype,room_num,rate,cost)); 
    			
    		}
    		
    	}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
    	
    	return hotels;
    	
    }
     
 
}
