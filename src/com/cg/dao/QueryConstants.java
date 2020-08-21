package com.cg.dao;

public interface QueryConstants {

	String VALIDATE = "select rolecode from userrole where username=? and password=?";
	String ADDMOVIES= "insert into movies values(?,?,?)";
	String VIEWCLAIMSADMIN = "select movie_id,movie_name,price from movies";
	String BOOKTICKETS ="insert into booking values(BOOKSEQ.NEXTVAL,?,?,?,?,?)";
	String VIEWBOOKINGS= "select booking_id,username,movie_id,tickets,dob,email from booking";
	String VIEWMOVIENAME="select movie_name from movies where movie_id=?";
	String VIEWUSERBOOKINGS="select booking_id,username,movie_id,tickets,dob,email from booking where username=?";
}
