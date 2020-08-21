package com.cg.dao;

import com.cg.dto.Movies;
import com.cg.dto.UserRole;
import com.cg.exceptions.MTBException;

public interface IAdminDAO {
	String validate(UserRole userDTO) throws MTBException;
	int addMovies(Movies movieDTO) throws MTBException;
	
		
}

