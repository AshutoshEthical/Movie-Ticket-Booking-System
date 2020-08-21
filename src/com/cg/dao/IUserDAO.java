package com.cg.dao;

import java.sql.SQLException;

import com.cg.dto.Booking;
import com.cg.exceptions.MTBException;

public interface IUserDAO {
	
	public int bookTicket(Booking book) throws MTBException, SQLException;

}
