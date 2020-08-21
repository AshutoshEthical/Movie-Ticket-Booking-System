package com.cg.dto;

import java.util.Date;

public class Booking {

	private int bookingId;
	private String username;
	private String movieId;
	private int tickets;
	private Date dateOfBooking;
	private String email;
	public int getBookingId() {
		return bookingId;
	}
	public void setBookingId(int bookingId) {
		this.bookingId = bookingId;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getMovieId() {
		return movieId;
	}
	public void setMovieId(String movieId) {
		this.movieId = movieId;
	}
	public int getTickets() {
		return tickets;
	}
	public void setTickets(int tickets) {
		this.tickets = tickets;
	}
	public Date getDateOfBooking() {
		return dateOfBooking;
	}
	public void setDateOfBooking(Date dateOfBooking) {
		this.dateOfBooking = dateOfBooking;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Booking(int bookingId, String username, String movieId, int tickets, Date dateOfBooking, String email) {
		super();
		this.bookingId = bookingId;
		this.username = username;
		this.movieId = movieId;
		this.tickets = tickets;
		this.dateOfBooking = dateOfBooking;
		this.email = email;
	}
	public Booking(String username, String movieId, int tickets, Date dateOfBooking, String email) {
		super();
		this.username = username;
		this.movieId = movieId;
		this.tickets = tickets;
		this.dateOfBooking = dateOfBooking;
		this.email = email;
	}
	public Booking() {
		super();
	}
	
	
	
}
