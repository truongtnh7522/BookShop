package com.bookshop.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name = "users")
public class UsersEntity extends BaseEntity {

	@Column(name = "username")
	private String userName;

	@Column(name = "password")
	private String password;

	@Column(name = "fullname")
	private String fullName;

	@Column(name="status")
	private Integer status;
	public String getImages() {
		return images;
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

	@Column(name="images")
	private String images;
	@Column(name="phone")
	private String phone;

	@ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@JoinTable(name = "user_role", joinColumns = @JoinColumn(name = "userid"), 
								  inverseJoinColumns = @JoinColumn(name = "roleid"))
	private List<RolesEntity> roles ;

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

	public UsersEntity(String userName, String password, String fullName, Integer status, String images, String phone,
			List<RolesEntity> roles) {
		super();
		this.fullName = fullName;
		this.images = images;
		this.password = password;
		this.phone = phone;
		this.status = status;

	
		this.userName = userName;
		this.roles = roles;
	}

	public UsersEntity() {
		super();
		// TODO Auto-generated constructor stub
	}

	public List<RolesEntity> getRoles() {
		return roles;
	}

	public void setRoles(List<RolesEntity> roles) {
		this.roles = roles;
	}
	/*
	 * public void addCourse(RolesEntity course) { this.roles.add(course);
	 * course.getUsers().add(this); } public void removeCourse(RolesEntity course) {
	 * this.getRoles().remove(course); course.getUsers().remove(this); } public void
	 * removeCourses() { for (RolesEntity course : new ArrayList<>(roles)) {
	 * removeCourse(course); } }
	 */
}
