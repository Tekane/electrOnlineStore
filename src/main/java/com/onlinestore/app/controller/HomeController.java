package com.onlinestore.app.controller;

import com.onlineStoreBackend.model.Category;
import com.onlineStoreBackend.model.Product;
import com.onlineStoreBackend.service.CategoryService;
import com.onlineStoreBackend.service.ProductService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author tekane
 */
@Controller
@EnableAutoConfiguration
@ComponentScan("com.onlineStoreBackend.service")
public class HomeController {

    @Autowired
    private CategoryService categoryService;
    @Autowired
    private ProductService productService;

    private static final Logger LOGGER = LoggerFactory.getLogger(HomeController.class);

    @GetMapping({"/index","/"})
    public String index(Model model) {
        model.addAttribute("title","Home");
        LOGGER.info("Inside HomeController index method - INFO ");
        LOGGER.debug("Inside HomeController index method- DEBUG");
        model.addAttribute("categories",this.categoryService.getCategories());
        model.addAttribute("userClickHome",true);
        return "/views/index";
    }

    @GetMapping(value = "/allProducts")
    public String allProducts(Model model) {
        model.addAttribute("title","All Products");

        //return all products

        //return all categories
        model.addAttribute("categories",this.categoryService.getCategories());

        model.addAttribute("userClickAllProducts",true);
        return "/views/index";
    }
    //Method to load all the products based on category
    @GetMapping(value = {"/show/category/{id}/products"})
    public ModelAndView showCategoryProductsById(@PathVariable("id") int id){
        ModelAndView model = new ModelAndView();
        //get a single category
        Category category =  this.categoryService.getCategoryById(id);
        model.addObject("title",category.getName());
        model.addObject("categories",this.categoryService.getCategories());
        model.addObject("category",category);
        model.addObject("userClickCategoryProducts",true);
        model.setViewName("/views/index");

        return model;
    }

    @GetMapping("/show/{id}/product")
    public ModelAndView getSingleProduct(@PathVariable(value = "id") int id){
        ModelAndView model = new ModelAndView();
        Product product =  productService.getProductById(id);
        product.setViews(product.getViews() + 1);

        //update view count
        productService.updateProduct(product.getId(),product);

        model.addObject("title",product.getName());
        model.addObject("product",product);
        model.addObject("userClickGetProduct",true);
        model.setViewName("/views/index");
        return  model;
    }
}
