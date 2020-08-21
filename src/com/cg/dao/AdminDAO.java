package com.cg.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.cg.Utility.JDBCUtility;
import com.cg.dto.Movies;
import com.cg.dto.UserRole;
import com.cg.exceptions.MTBException;

public class AdminDAO implements IAdminDAO {

	static Connection connection = null;

	@Override
	public String validate(UserRole userDTO) throws MTBException {
		boolean status = false;
		String rolecode = "";
		try {
			connection = JDBCUtility.getConnection();
			PreparedStatement ps = connection.prepareStatement(QueryConstants.VALIDATE);
			ps.setString(1, userDTO.getUsername());
			ps.setString(2, userDTO.getPassword());
			ResultSet rs = ps.executeQuery();
			if (rs.next())
				rolecode = rs.getString(1);
		} catch (MTBException | SQLException e) {
			throw new MTBException(e.getMessage() + "Problem Occured in AdminDAO during login");
		}
		return rolecode;
	}

	@Override
	public int addMovies(Movies movieDTO) throws MTBException {
		int rows=0;
		int error=-1;
		try {
			connection=JDBCUtility.getConnection();
			PreparedStatement ps = connection.prepareStatement(QueryConstants.ADDMOVIES);
			ps.setString(1, movieDTO.getId());
			ps.setString(2, movieDTO.getMovieName());
			ps.setInt(3, movieDTO.getPrice());
			
			rows=ps.executeUpdate();
		}catch(MTBException | SQLException e)
		{
			return error;
		}
		return rows;
	}
}
