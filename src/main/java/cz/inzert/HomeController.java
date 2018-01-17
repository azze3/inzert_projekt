package cz.inzert;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {
    @RequestMapping(value = "/home")
    public ModelAndView home(){
        ModelAndView modelAndView = new ModelAndView( "home");
        modelAndView.addObject( "pageTitle",  "Home Page");
        modelAndView.addObject("message", "Hi, welcome in homePage");
        return modelAndView;
    }
    }