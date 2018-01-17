package cz.inzert.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SettingController {
    @RequestMapping(value = "/setting")
    public ModelAndView home(){
        ModelAndView modelAndView = new ModelAndView( "setting");
        modelAndView.addObject("message", "Hi, welcome in setting");
        return modelAndView;
    }
}
