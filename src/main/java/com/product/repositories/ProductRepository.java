/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.product.repositories;

import org.springframework.data.repository.CrudRepository;

import com.product.model.Product;

/**
 *
 * @author didin
 */
public interface ProductRepository extends CrudRepository<Product, String> {
    @Override
    Product findOne(String id);
    
    @Override
    void delete(Product deleted);
}