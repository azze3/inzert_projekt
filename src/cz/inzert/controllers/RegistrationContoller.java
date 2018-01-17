package cz.inzert.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class RegistrationContoller {
    @RequestMapping(value = "/registration")
    public ModelAndView home(){
        ModelAndView modelAndView = new ModelAndView( "registration");
        modelAndView.addObject("message", "Hi, welcome in registration");
        return modelAndView;
    }
}
