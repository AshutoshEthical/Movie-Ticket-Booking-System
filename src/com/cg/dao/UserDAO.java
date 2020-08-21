package com.cg.dao;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.cg.Utility.JDBCUtility;
import com.cg.dto.Booking;
import com.cg.exceptions.MTBException;

public class UserDAO implements IUserDAO {

	@Override
	public int bookTicket(Booking book) throws MTBException, SQLException {
		
		Connection connection = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int rows= 0;
		int Error = -1;
		try {
			connection = JDBCUtility.getConnection();
			ps = connection.prepareStatement(QueryConstants.BOOKTICKETS);
			ps.setString(1,book.getUsername());
			ps.setString(2,book.getMovieId());
			ps.setInt(3, book.getTickets());
			ps.setDate(4,  new java.sql.Date(book.getDateOfBooking().getTime()));

			ps.setString(5, book.getEmail());
			rows= ps.executeUpdate();
			System.out.println("rows"+rows);
			if (rows > 0) {
				System.out.println("Booking Successful");
			}
			}catch (MTBException e) {
				System.out.println("Problem occurred in UserDAO, booking ticket");
			
		}
		return rows;
		}
	

}
