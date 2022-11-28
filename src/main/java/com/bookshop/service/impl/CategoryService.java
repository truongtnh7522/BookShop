package com.bookshop.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookshop.converter.CategoryConverter;
import com.bookshop.dto.CategoryDTO;
import com.bookshop.entity.CategoryEntity;
import com.bookshop.repository.CategoryRepository;
import com.bookshop.service.ICategoryService;

@Service
public class CategoryService implements ICategoryService {
	
	@Autowired
	private CategoryRepository categoryRepository;
	@Autowired
	private CategoryConverter categoryConverter;
	@Override
	public Map<String, String> findAll() {
		Map<String, String> result = new HashMap<>();
		List<CategoryEntity> entities = categoryRepository.findAll();
		for (CategoryEntity item: entities) {
			result.put(item.getCode(), item.getCategoryName());
		}
		return result;
	}
	@Override
	public List<CategoryDTO> findAllCategory() {
		List<CategoryDTO> models = new ArrayList<>();
		List<CategoryEntity> entities = categoryRepository.findAll();
		for (CategoryEntity item: entities) {
			CategoryDTO CategoryDTO = categoryConverter.toDto(item);
			models.add(CategoryDTO);
		}
		return models;
	}
	@Override
	public CategoryDTO findById(long id) {
		CategoryEntity entity = categoryRepository.findOne(id);
		return categoryConverter.toDto(entity);
	}
	@Override
	public CategoryDTO save(CategoryDTO dto) {
		CategoryEntity CategoryEntity = new CategoryEntity();
		if (dto.getId() != null) {
			CategoryEntity oldNew = categoryRepository.findOne(dto.getId());
			CategoryEntity = categoryConverter.toEntity(oldNew, dto);
		} else {
			CategoryEntity = categoryConverter.toEntity(dto);
		}
		return categoryConverter.toDto(categoryRepository.save(CategoryEntity));
	}
	
	@Override
	public void delete(long[] ids) {
		for (long id: ids) {
			categoryRepository.delete(id);
		}
		
	}
}
