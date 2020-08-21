package com.cg.dto;

public class Movies {
	private String id;
	private String movieName;
	private Integer price;
	
	public Movies() {
		super();
	}
	public Movies(String id, String movieName, Integer price) {
		super();
		this.id = id;
		this.movieName = movieName;
		this.price = price;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getMovieName() {
		return movieName;
	}
	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	

}
