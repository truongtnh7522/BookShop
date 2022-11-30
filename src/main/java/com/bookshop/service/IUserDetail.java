package com.bookshop.service;

import org.springframework.security.core.userdetails.UserDetailsService;

import com.bookshop.dto.UserDTO;
import com.bookshop.entity.UsersEntity;

public interface IUserDetail extends UserDetailsService{
	UsersEntity save(UserDTO registrationDto);

}
