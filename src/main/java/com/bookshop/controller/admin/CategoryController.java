package com.bookshop.controller.admin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bookshop.dto.CategoryDTO;
import com.bookshop.service.ICategoryService;
import com.bookshop.util.MessageUtil;

@Controller(value = "CategoryControllerOfAdmin")
public class CategoryController {
	@Autowired
	private MessageUtil messageUtil;
	@Autowired
	private ICategoryService categoryService;
	@RequestMapping(value = "/quan-tri/danh-muc/danh-sach", method = RequestMethod.GET)
	public ModelAndView showList( HttpServletRequest request) {
		CategoryDTO model = new CategoryDTO();
//		model.setPage(page);
//		model.setLimit(limit);
		ModelAndView mav = new ModelAndView("admin/product/list-category");
//		Pageable pageable = new PageRequest(page - 1, limit);
		model.setListResult(categoryService.findAllCategory());
//		model.setTotalItem(productService.getTotalItem());
//		model.setTotalPage((int) Math.ceil((double) model.getTotalItem() / model.getLimit()));
		if (request.getParameter("message") != null) {
			Map<String, String> message = messageUtil.getMessage(request.getParameter("message"));
			mav.addObject("message", message.get("message"));
			mav.addObject("alert", message.get("alert"));
		}
		mav.addObject("dto", model);
		return mav;
	}
	@RequestMapping(value = "/quan-tri/danh-muc/chinh-sua", method = RequestMethod.GET)
	public ModelAndView editProduct(@RequestParam(value = "id", required = false) Long id, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("admin/product/edit-category");
		CategoryDTO model = new CategoryDTO();
		if (id != null) {
			model = categoryService.findById(id);
		}
		if (request.getParameter("message") != null) {
			Map<String, String> message = messageUtil.getMessage(request.getParameter("message"));
			mav.addObject("message", message.get("message"));
			mav.addObject("alert", message.get("alert"));
		}
		mav.addObject("categories", categoryService.findAll());
		mav.addObject("dto", model);
		return mav;
	}
}
