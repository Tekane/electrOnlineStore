package com.onlinestore.app.controller;

import com.onlineStoreBackend.model.Category;
import com.onlineStoreBackend.model.Product;
import com.onlineStoreBackend.service.CategoryService;
import com.onlineStoreBackend.service.ProductService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping(value = "/manage")
public class ProductManagementController {

    @Autowired
    private ProductService productService;
    @Autowired
    private CategoryService  categoryService;

    private static final Logger LOGGER = LoggerFactory.getLogger(ProductManagementController.class);

    @GetMapping("/products")
    public ModelAndView manageProduct(@RequestParam(value = "operation" , required = false) String operation){
        ModelAndView model = new ModelAndView();
        model.setViewName("/views/index");
        model.addObject("userClickManageProducts",true);
        model.addObject("title","Manage Products");

        Product nProduct = new Product();
        nProduct.setSupplierId(1);
        nProduct.setIsActive(true);

        model.addObject("product",nProduct);
        if (operation != null){
            if (operation.equals("product")){
                model.addObject("message","Product submitted successfully");
            }
        }

        return model;
    }

    //Returning categories for all the request
    @ModelAttribute("categories")
    public List<Category> getCategories(){
        return categoryService.getCategories();
    }

    @PostMapping("/products")
    public String createProduct(@ModelAttribute("product") Product product){
        LOGGER.info(product.toString());
        productService.createProduct(product);
        return "redirect:/manage/products?operation=product";
    }
}
