package com.niit.dao;

import java.util.List;

import javax.management.Query;

import org.hibernate.Session;

import com.niit.model.Category;
import com.niit.model.Customer;
import com.niit.model.Product;
import com.niit.model.User;

public interface ProductDao {
	void saveProduct(Product product);
	List<Product>getAllProducts();
	Product getProductById(int id);
	void deleteProduct (Product product);
	void editProduct(Product product);
	List<Category> getAllCategories();
	void updateProduct(Product product);
 }
