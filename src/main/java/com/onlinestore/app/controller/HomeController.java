package com.onlinestore.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
    @GetMapping({"/index","/"})
    public String hello(Model model) {
        return "/views/index";
    }
}
