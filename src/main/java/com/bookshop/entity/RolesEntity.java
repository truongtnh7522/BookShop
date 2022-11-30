package com.bookshop.entity;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name = "role")
public class RolesEntity extends BaseEntity {
	
	public RolesEntity() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Column(name = "name")
	private String name;
	
	@Column(name = "code")
	private String code;
	
	public RolesEntity( String code) {
		super();
		this.code = code;
	}

	public RolesEntity(String code, String name) {
		super();
		
		this.code = code;
		this.name = name;
	}

	@ManyToMany(mappedBy = "roles",cascade = {CascadeType.ALL})
    private List<UsersEntity> users ;
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public List<UsersEntity> getUsers() {
		return users;
	}

	public void setUsers(List<UsersEntity> users) {
		this.users = users;
	}
}
