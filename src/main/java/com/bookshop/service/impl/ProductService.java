package com.bookshop.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bookshop.converter.ProductConverter;
import com.bookshop.dto.ProductDTO;
import com.bookshop.entity.CategoryEntity;
import com.bookshop.entity.ProductEntity;
import com.bookshop.repository.CategoryRepository;
import com.bookshop.repository.ProductRepository;
import com.bookshop.service.IProductService;
@Service
public class ProductService implements IProductService {
	
	@Autowired
	private ProductRepository productRepository;
	
	@Autowired
	private CategoryRepository categoryRepository;
	
	@Autowired
	private ProductConverter productConverter;
	
	@Override
	public List<ProductDTO> findAll() {
		List<ProductDTO> models = new ArrayList<>();
		List<ProductEntity> entities = productRepository.findAll();
		for (ProductEntity item: entities) {
			ProductDTO ProductDTO = productConverter.toDto(item);
			models.add(ProductDTO);
		}
		return models;
	}

	@Override
	public int getTotalItem() {
		return (int) productRepository.count();
	}

	@Override
	public ProductDTO findById(long id) {
		ProductEntity entity = productRepository.findOne(id);
		return productConverter.toDto(entity);
	}
	
	@Override
	@Transactional
	public ProductDTO save(ProductDTO dto) {
		CategoryEntity category = categoryRepository.findOneByCode(dto.getCategoryCode());
		ProductEntity ProductEntity = new ProductEntity();
		if (dto.getId() != null) {
			ProductEntity oldNew = productRepository.findOne(dto.getId());
			oldNew.setCategory(category);
			ProductEntity = productConverter.toEntity(oldNew, dto);
		} else {
			ProductEntity = productConverter.toEntity(dto);
			ProductEntity.setCategory(category);
		}
		return productConverter.toDto(productRepository.save(ProductEntity));
	}

	@Override
	@Transactional
	public void delete(long[] ids) {
		for (long id: ids) {
			productRepository.delete(id);
		}
	}

	

	

	




	

	
}
