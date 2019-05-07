package com.onlinestore.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    @GetMapping({"/index","/"})
    public String hello(Model model) {
        model.addAttribute("title","Home");
        model.addAttribute("userClickHome",true);
        return "/views/index";
    }

    @GetMapping(value = "/allProducts")
    public String allProducts(Model model) {
        model.addAttribute("title","allProducts");
        model.addAttribute("userClickAllProducts",true);
        return "/views/index";
    }
}
