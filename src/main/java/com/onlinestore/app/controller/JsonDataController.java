package com.onlinestore.app.controller;

import com.onlineStoreBackend.model.Product;
import com.onlineStoreBackend.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api")
public class JsonDataController {

    @Autowired
    private ProductService productService;

    @GetMapping("/products")
    public List<Product> getProducts(){
        return productService.getAllProducts();
    }

    @GetMapping("/category/{id}/products")
    public List<Product> getProductsByCategoryId(@PathVariable(value = "id") int id){
        return productService.getActiveProductsByCategory(id);
    }

    @GetMapping("/products/{id}")
    public ResponseEntity<Product> getProductById(@PathVariable(value = "id") int id){
        Product product = productService.getProductById(id);
        return ResponseEntity.ok().body(product);
    }
}
