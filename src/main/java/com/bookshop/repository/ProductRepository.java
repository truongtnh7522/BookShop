package com.bookshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bookshop.entity.ProductEntity;

public interface ProductRepository extends JpaRepository<ProductEntity, Long> {
}
