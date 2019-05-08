package com.onlinestore.app.controller;

import com.onlineStoreBackend.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
/**
 *
 * @author tekane
 */
@Controller
@EnableAutoConfiguration
@ComponentScan("com.onlineStoreBackend.service")
public class HomeController {

    private CategoryService categoryService;

    @Autowired
    public HomeController(CategoryService categoryService) {
        this.categoryService = categoryService;
    }

    @GetMapping({"/index","/"})
    public String hello(Model model) {
        model.addAttribute("title","Home");
        model.addAttribute("categories",this.categoryService.getCategories());
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
