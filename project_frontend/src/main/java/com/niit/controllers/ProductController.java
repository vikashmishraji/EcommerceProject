package com.niit.controllers;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.niit.model.Category;
import com.niit.model.Product;
import com.niit.service.ProductService;

@Controller
public class ProductController {

	public ProductController() {
		System.out.println("This is home controller");
	}

	@Autowired
	private ProductService productService;
	

	@RequestMapping("/getproductForm")
	public String getProductForm(Model model) 
	{
		List<Category> categories=productService.getAllCategories();
		model.addAttribute("categories",categories);
		model.addAttribute("product", new Product());
		return "productform";
	}

	@RequestMapping("/saveproduct")
	public String saveProduct(@Valid @ModelAttribute(name = "product") Product product,BindingResult result,Model model)
	{
		if(result.hasErrors())	
		{
			System.out.println("hhello"+result.toString());
			List<Category> categories=productService.getAllCategories();
			model.addAttribute("categories",categories);
			return "productform";
		}
		
		
		productService.saveProduct(product);
		MultipartFile image=product.getImage();
		Path path=
		Paths.get("C:\\Users\\Admin\\workspace\\project_frontend\\src\\main\\webapp\\WEB-INF\\resources\\images\\"+ product.getId()+".png");	
		
		try{
			image.transferTo(new File(path.toString()));
		}
		
		catch(IllegalStateException e){
			
			e.printStackTrace();	
			} catch (IOException e){
				
				e.printStackTrace();
		}
		
		return "redirect:/getallproducts";
	}

	@RequestMapping("/getallproducts")
	public String getAllProduct(Model model) {
		List<Product> products = productService.getAllProducts();
		
		System.out.println("go to product");
		System.out.println("products"+products.size());
		model.addAttribute("products", products);
		return "productlist";
	}

	@RequestMapping ("/all_product_viewproduct{id}")
	public String getProductById(@PathVariable int id,Model model){
		Product product=productService.getProductById(id);
	model.addAttribute("product",product);
	return"viewproduct";

}
	
	@RequestMapping("/admin_product_deleteproduct{id}")
	public String deleteProdutById(@PathVariable int id){
		productService.deleteProduct(id);
		return "redirect:/getallproducts";
	}
	@RequestMapping("/admin_product_geteditform{id}")
	public String getEditForm(@PathVariable int id,Model model){
		Product product=productService.getProductById(id);
		model.addAttribute("projectObj",product);
		return "editform";
	}
	@RequestMapping("/admin_product_editproduct")
	public String editProduct(@Valid @ModelAttribute(name="productObj")Product product,BindingResult result,Model model){
		if(result.hasErrors()){
			List<Category> categories=productService.getAllCategories();
			model.addAttribute("categories",categories);
			return "editform";
		}
		
		productService.updateProduct(product);
		MultipartFile image=product.getImage();
		Path path=
		Paths.get("C:\\Users\\Admin\\workspace\\project_frontend\\src\\main\\webapp\\WEB-INF\\resources\\images\\"+product.getId()+".png");
		try{
			image.transferTo(new File(path.toString()));
			
		}catch (IllegalStateException e){
			e.printStackTrace();
		
		}catch(IOException e){
			
			e.printStackTrace();
		}
		
		//productService.editProduct(product);
		return "redirect:/getallproducts";
	
	}
	@RequestMapping("/all_product_searchbycategory")
	
	public String selectByCategory(@RequestParam String searchCondition,Model model){
		
		model.addAttribute("products",productService.getAllProducts());
		if(searchCondition.equals("All"))
			model.addAttribute("searchCondition","");
		else
			model.addAttribute("searchCondition",searchCondition);
		return "productlist";
		
	}
	
	}
