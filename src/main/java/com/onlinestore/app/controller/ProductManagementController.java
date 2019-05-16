package com.onlinestore.app.controller;

import com.onlineStoreBackend.model.Category;
import com.onlineStoreBackend.model.Product;
import com.onlineStoreBackend.service.CategoryService;
import com.onlineStoreBackend.service.ProductService;
import com.onlinestore.app.multipartFile.FileUpload;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
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
    public String createProduct(@Valid @ModelAttribute("product") Product product , BindingResult bindingResult , Model model,
                                HttpServletRequest request){
        //Check if the form has errors
        if (bindingResult.hasErrors()){
            model.addAttribute("title","Manage Products");
            model.addAttribute("userClickManageProducts",true);
            return "/views/index";
        }
        LOGGER.info(product.toString());
        productService.createProduct(product);

        //Check if the user uploaded the image
        if(!product.getFile().getOriginalFilename().equals("")){
             FileUpload.uploadFile(request,product.getFile(),product.getCode());
        }

        return "redirect:/manage/products?operation=product";
    }
}
