package com.bookshop.dto;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class UserDTO extends AbstractDTO<UserDTO> {
	private String userName;

	private String password;

	private String fullName;

	private Integer status;

	public String getImages() {
		return images;
	}

	public UserDTO(String userName, String password, String fullName, Integer status, String images, String phone) {
		super();
		this.fullName = fullName;
		this.images = images;
		this.password = password;
		this.phone = phone;
		this.status = status;

	
		this.userName = userName;

	}

	public UserDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public void setImages(String images) {
		this.images = images;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	private String images;
	private String phone;

	private Set<String> code = new HashSet<String>();

	public Set<String> getCode() {
		return code;
	}

	public void setCode(Set<String> code) {
		this.code = code;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

}
