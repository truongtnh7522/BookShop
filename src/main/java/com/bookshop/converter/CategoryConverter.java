package com.bookshop.converter;

import org.springframework.stereotype.Component;

import com.bookshop.dto.CategoryDTO;
import com.bookshop.entity.CategoryEntity;

@Component
public class CategoryConverter {
	
	public CategoryDTO toDto(CategoryEntity entity) {
		CategoryDTO result = new CategoryDTO();
		result.setId(entity.getId());
		
		result.setCategoryName(entity.getCategoryName());
		result.setCode(entity.getCode());
		result.setImages(entity.getImages());
		result.setStatus(entity.getStatus());
		return result;
	}
	
	public CategoryEntity toEntity(CategoryDTO dto) {
		CategoryEntity result = new CategoryEntity();
		result.setCategoryName(dto.getCategoryName());
		result.setCode(dto.getCode());
		result.setImages(dto.getImages());
		result.setStatus(dto.getStatus());
		return result;
	}
	public CategoryEntity toEntity(CategoryEntity result, CategoryDTO dto) {
		result.setCategoryName(dto.getCategoryName());
		result.setCode(dto.getCode());
		result.setImages(dto.getImages());
		result.setStatus(dto.getStatus());
		return result;
	}
}
