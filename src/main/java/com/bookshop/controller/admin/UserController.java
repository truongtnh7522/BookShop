package com.bookshop.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bookshop.dto.UserDTO;
import com.bookshop.service.IUserDetail;

@Controller(value = "userControllerOfAdmin")
@RequestMapping("/registration")
public class UserController {

	private IUserDetail userService;

	public UserController(IUserDetail userService) {
		super();
		this.userService = userService;
	}
	
	@ModelAttribute("users")
    public UserDTO userRegistrationDto() {
        return new UserDTO();
    }
	
	@GetMapping
	public String showRegistrationForm() {
		return "registration";
	}
	
	@PostMapping
	public String registerUserAccount(@ModelAttribute("users") UserDTO registrationDto) {
		userService.save(registrationDto);
		return "redirect:/registration?success";
	}
}
