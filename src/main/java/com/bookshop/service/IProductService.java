package com.bookshop.service;

import java.util.List;

import com.bookshop.dto.ProductDTO;

public interface IProductService {
	List<ProductDTO> findAll();
	int getTotalItem();
	ProductDTO findById(long id);
	ProductDTO save(ProductDTO dto);
	void delete(long[] ids);
}
