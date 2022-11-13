package com.xadmin.hotelmanagement.bean;

public class Hotel {

	protected int id;
	protected String name;
	protected String email;
	protected String checkin;
	protected String checkout;
	protected String roomtype;
	protected int room_num;
	protected int rate;
	protected int cost;
	
	
	public Hotel(int id, String name, String email, String checkin, String checkout, String roomtype, int room_num,
			int rate, int cost) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.checkin = checkin;
		this.checkout = checkout;
		this.roomtype = roomtype;
		this.room_num = room_num;
		this.rate = rate;
		this.cost = cost;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCheckin() {
		return checkin;
	}
	public void setCheckin(String checkin) {
		this.checkin = checkin;
	}
	public String getCheckout() {
		return checkout;
	}
	public void setCheckout(String checkout) {
		this.checkout = checkout;
	}
	public String getRoomtype() {
		return roomtype;
	}
	public void setRoomtype(String roomtype) {
		this.roomtype = roomtype;
	}
	public int getRoom_num() {
		return room_num;
	}
	public void setRoom_num(int room_num) {
		this.room_num = room_num;
	}
	public int getRate() {
		return rate;
	}
	public void setRate(int rate) {
		this.rate = rate;
	}
	public int getCost() {
		return cost;
	}
	public void setCost(int cost) {
		this.cost = cost;
	}
    
	

}
