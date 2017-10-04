package com.niit.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.niit.model.Category;
import com.niit.model.Customer;
import com.niit.model.Product;
import com.niit.model.User;
@Repository
public class ProductDaoImpl implements ProductDao{

	public ProductDaoImpl()
	{
		System.out.println("ProductDaoImpt object is created");
		
	}
	@Autowired
	private SessionFactory sessionFactory;
	public void saveProduct(Product product){
		Session session=sessionFactory.getCurrentSession();
		session.save(product);
		
	}
	public List<Product> getAllProducts() {
		Session session=sessionFactory.getCurrentSession();
		Query query=session.createQuery("from Product");
		List<Product> products=query.list();
		
		return products;
	}
	public Product getProductById(int id) {
		Session session=sessionFactory.getCurrentSession();
		Product product=(Product)session.get(Product.class,id);
		return product;
	}
	public void deleteProduct(Product product) {
		Session session=sessionFactory.getCurrentSession();
		session.delete(product);
	}
	public void updateProduct(Product product) {
		Session session=sessionFactory.getCurrentSession();
		session.update(product);
	}
	public List<Category> getAllCategories(){
		Session session=sessionFactory.getCurrentSession();
		Query query=session.createQuery("from Category");
		List<Category> categories=query.list();
		return categories;
	}
	
	public void editProduct(Product product) {
		Session session=sessionFactory.getCurrentSession();
		session.update(product);
	}
}