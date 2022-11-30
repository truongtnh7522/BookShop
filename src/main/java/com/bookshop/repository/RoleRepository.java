package com.bookshop.repository;

import java.util.Set;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bookshop.entity.RolesEntity;

public interface RoleRepository extends JpaRepository<RolesEntity, Long>{
	public RolesEntity findByCode(String set);

}
