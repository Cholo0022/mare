package com.mare.api.service.impl;

import com.mare.api.entity.Product;
import com.mare.api.record.DataRegisterProduct;
import com.mare.api.repository.IProductRepository;
import com.mare.api.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.List;

@Service
public class ProductServiceImpl implements IProductService {

    @Autowired
    private IProductRepository iProductRepository;


    @Override
    public List<Product> getAll() {
        return (List<Product>) iProductRepository.findAll();
    }

    @Override
    public List<Product> getFeatured() {
        return (List<Product>) iProductRepository.findByFeatured(true);
    }

    @Override
    public Product getById(Long id) {
        return (Product) iProductRepository.findById(id).get();
    }

    @Override
    public void remove(Long id) {
        iProductRepository.deleteById(id);
    }

    @Override
    public void save(Product product) {

    }

    private boolean canCreateFeaturedProduct() {
        int featuredProductCount = iProductRepository.findByFeatured(true).size();
        return featuredProductCount < 3;
    }

    @Override
    public ResponseEntity<String> saveProduct(DataRegisterProduct dataRegisterProduct) throws URISyntaxException {
        if (dataRegisterProduct.featured() && !canCreateFeaturedProduct()) {
            return ResponseEntity.badRequest().body("No se pueden crear más de tres productos DESTACADOS");
        } else {
            Product product = new Product(dataRegisterProduct);
            iProductRepository.save(product);
            return ResponseEntity.created(new URI("/" + product.getId())).body(String.valueOf(dataRegisterProduct));
        }
    }


    @Override
    public List<Product> getProductsByCategory(Long categoryId) {
        return iProductRepository.findByCategory_Id(categoryId);
    }

    @Override
    public List<Product> getProductsByName(String name) {
        return iProductRepository.findByName(name);
    }

    @Override
    public List<Product> searchProductsByName(String name) {
        // Utiliza una consulta personalizada que busca productos que contengan el nombre proporcionado.
        return iProductRepository.findByNameContaining(name);
    }
}
