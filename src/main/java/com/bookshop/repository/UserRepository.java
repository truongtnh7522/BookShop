package com.bookshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bookshop.entity.UsersEntity;

public interface UserRepository extends JpaRepository<UsersEntity, Long> {
	UsersEntity findOneByUserNameAndStatus(String name, int status);
}
