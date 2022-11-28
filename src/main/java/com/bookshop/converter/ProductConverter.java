package com.bookshop.converter;

import org.springframework.stereotype.Component;

import com.bookshop.dto.ProductDTO;
import com.bookshop.entity.ProductEntity;

@Component
public class ProductConverter {

	public ProductDTO toDto(ProductEntity entity) {
		ProductDTO result = new ProductDTO();
		result.setId(entity.getId());
		result.setProductName(entity.getProductName());
		result.setDescription(entity.getDescription());
		result.setPrice(entity.getPrice());
		result.setImages(entity.getImages());
		result.setStatus(entity.getStatus());
		result.setCategoryCode(entity.getCategory().getCode());
		return result;
	}
	
	public ProductEntity toEntity(ProductDTO dto) {
		ProductEntity result = new ProductEntity();
		result.setProductName(dto.getProductName());
		result.setDescription(dto.getDescription());
		result.setPrice(dto.getPrice());
		result.setImages(dto.getImages());
		result.setStatus(dto.getStatus());
		return result;
	}
	
	public ProductEntity toEntity(ProductEntity result, ProductDTO dto) {
		result.setProductName(dto.getProductName());
		result.setDescription(dto.getDescription());
		result.setPrice(dto.getPrice());
		result.setImages(dto.getImages());
		result.setStatus(dto.getStatus());
		return result;
	}
}
