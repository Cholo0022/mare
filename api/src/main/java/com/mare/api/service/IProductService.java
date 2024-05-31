package com.mare.api.service;

import com.mare.api.entity.Product;
import com.mare.api.record.DataRegisterProduct;
import org.springframework.http.ResponseEntity;

import java.net.URISyntaxException;
import java.util.List;

public interface IProductService {
    List<Product> getAll();

    List<Product> getFeatured();

    Product getById(Long id);

    void remove(Long id);

    void save(Product product);

    List<Product> getProductsByCategory(Long categoryId);

    List<Product> getProductsByName(String name);

    List<Product> searchProductsByName(String name);

    ResponseEntity<String> saveProduct(DataRegisterProduct dataRegisterProduct) throws URISyntaxException;
}

