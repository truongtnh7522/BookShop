package com.bookshop.service;

import java.util.List;
import java.util.Map;

import com.bookshop.dto.CategoryDTO;

public interface ICategoryService {
	Map<String, String> findAll();

	List<CategoryDTO> findAllCategory();
	CategoryDTO findById(long id);
	CategoryDTO save(CategoryDTO dto);
	void delete(long[] ids);
}
