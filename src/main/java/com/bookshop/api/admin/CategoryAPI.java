package com.bookshop.api.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.bookshop.dto.CategoryDTO;
import com.bookshop.service.ICategoryService;
@RestController(value = "categoryAPIOfAdmin")
public class CategoryAPI {
	
	
		
		@Autowired
		private ICategoryService categoryService;
		@PostMapping("/api/category")
		public CategoryDTO createCategory(@RequestBody CategoryDTO CategoryDTO) {
			return categoryService.save(CategoryDTO);
		}
		
		@PutMapping("/api/category")
		public CategoryDTO updateCategory(@RequestBody CategoryDTO updateCategory) {
			return categoryService.save(updateCategory);
		}
		
		@DeleteMapping("/api/category")
		public void deleteCategory(@RequestBody long[] ids) {
			categoryService.delete(ids);
		}

	
}
