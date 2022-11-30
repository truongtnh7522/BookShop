package com.bookshop.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.management.relation.Role;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.bookshop.constant.SystemConstant;
import com.bookshop.dto.MyUser;
import com.bookshop.dto.UserDTO;
import com.bookshop.entity.RolesEntity;
import com.bookshop.entity.UsersEntity;
import com.bookshop.repository.UserRepository;
import com.bookshop.service.IUserDetail;


@Service
public class CustomUserDetailsService implements UserDetailsService,IUserDetail {
	
	@Autowired
	private UserRepository userRepository;
	@Override
	public UsersEntity save(UserDTO registrationDto) {
		/*
		 * UsersEntity user = new UsersEntity(registrationDto.getUserName(),
		 * registrationDto.getPassword()), Arrays.asList(new RolesEntity("ROLE_USER"));
		 */
		
		  UsersEntity user = new
		  UsersEntity(registrationDto.getUserName(),registrationDto.getPassword(),
		  registrationDto.getFullName(),registrationDto.getStatus(),registrationDto.
		  getImages(),registrationDto.getPhone(),Arrays.asList(new RolesEntity("USER","NguoiDung"))
		);
		 
		/*
		 * UsersEntity userEntity = userRepository.findOneByUserNameAndStatus(username,
		 * SystemConstant.ACTIVE_STATUS); List<GrantedAuthority> authorities = new
		 * ArrayList<>(); for (RolesEntity role: userEntity.getRoles()) {
		 * authorities.add(new SimpleGrantedAuthority(role.getCode())); } MyUser myUser
		 * = new MyUser(userEntity.getUserName(), userEntity.getPassword(), true, true,
		 * true, true, authorities);
		 */
		return userRepository.save(user);
	}
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		UsersEntity userEntity = userRepository.findOneByUserNameAndStatus(username, SystemConstant.ACTIVE_STATUS);
		
		if (userEntity == null) {
			throw new UsernameNotFoundException("User not found");
		}
		List<GrantedAuthority> authorities = new ArrayList<>();
		for (RolesEntity role: userEntity.getRoles()) {
			authorities.add(new SimpleGrantedAuthority(role.getCode()));
		}
		MyUser myUser = new MyUser(userEntity.getUserName(), userEntity.getPassword(), 
							true, true, true, true, authorities);
		myUser.setFullName(userEntity.getFullName());
		myUser.setImages(userEntity.getImages());
		myUser.setPhone(userEntity.getPhone());
		return myUser;
	}

}
