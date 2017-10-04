package com.niit.service;

import java.util.List;

import com.niit.model.Category;
import com.niit.model.Product;

public interface ProductService {
void saveProduct(Product product);
List<Product>getAllProducts();
Product getProductById(int id);
void deleteProduct (int id);
List<Category> getAllCategories();
void updateProduct(Product product);
}
