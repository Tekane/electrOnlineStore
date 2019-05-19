package com.onlinestore.app.controller;

import com.onlineStoreBackend.model.Category;
import com.onlineStoreBackend.model.Product;
import com.onlineStoreBackend.service.CategoryService;
import com.onlineStoreBackend.service.ProductService;
import com.onlinestore.app.multipartFile.FileUpload;
import com.onlinestore.app.validator.ProductValidator;
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
        //validating uploaded images
        if (product.getId() == 0) {
            new ProductValidator().validate(product, bindingResult);
        }else {
            if (!product.getFile().getOriginalFilename().equals("")){
                new ProductValidator().validate(product, bindingResult);
            }
        }

        //Check if the form has errors
        if (bindingResult.hasErrors()){
            model.addAttribute("title","Manage Products");
            model.addAttribute("userClickManageProducts",true);
            return "/views/index";
        }

        LOGGER.info(product.toString());
        if (product.getId() == 0){
            //Create a new product is the id is 0
            productService.createProduct(product);
        }else {
            //Update the product if the id is not 0
            productService.updateProduct(product.getId(),product);
        }

        //Check if the user uploaded the image
        if(!product.getFile().getOriginalFilename().equals("")){
             FileUpload.uploadFile(request,product.getFile(),product.getCode());
        }

        return "redirect:/manage/products?operation=product";
    }
    @PostMapping("/product/{id}/activation")
    public String handleProductActivation(@PathVariable("id") int id) {
        Product product = productService.getProductById(id);
        String isActive = product.getActive();
        if (isActive.equals("TRUE")) {
            product.setActive("FALSE");
        }else {
            product.setActive("TRUE");
        }
        productService.updateProduct(product.getId(), product);

        return product.getActive().equals("TRUE") ? "You have successfully activated the product "+product.getId() : "You have successfully activated the product "+product.getId();
    }

    @GetMapping("/{id}/product")
    public ModelAndView editProduct(@PathVariable("id") int id){
        ModelAndView model = new ModelAndView();
        model.setViewName("/views/index");
        model.addObject("userClickManageProducts",true);
        model.addObject("title","Manage Products");

        Product product = productService.getProductById(id);
        //Set the products fetched from the Database

        model.addObject("product",product);

        return model;
    }
}
