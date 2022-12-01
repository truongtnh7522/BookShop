package com.bookshop.controller.admin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bookshop.dto.UserDTO;
import com.bookshop.service.IUserDetail;
import com.bookshop.util.MessageUtil;

@Controller(value = "userControllerOfAdmin")
public class UserController {
	@Autowired
	private IUserDetail userService;
	@Autowired
	private MessageUtil messageUtil;
	public UserController(IUserDetail userService) {
		super();
		this.userService = userService;
	}
	
	@ModelAttribute("users")
    public UserDTO userRegistrationDto() {
        return new UserDTO();
    }
	@RequestMapping(value = "/registration", method = RequestMethod.GET)
	public String showRegistrationForm() {
		
		return "registration";
	}
	
	@RequestMapping(value = "/registration", method = RequestMethod.POST)
	public ModelAndView registerUserAccount(@ModelAttribute("users") UserDTO registrationDto,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("redirect:/registration?success");
		mav.addObject("dto",userService.save(registrationDto));
		if (request.getParameter("message") != null) {
			Map<String, String> message = messageUtil.getMessage(request.getParameter("message"));
			mav.addObject("message", message.get("message"));
			mav.addObject("alert", message.get("alert"));
		}
		
		return mav;
	}
}
