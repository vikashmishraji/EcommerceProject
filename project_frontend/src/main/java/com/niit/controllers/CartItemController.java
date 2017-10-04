package com.niit.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.niit.model.Cart;
import com.niit.model.CartItem;
import com.niit.model.Customer;
import com.niit.model.Product;
import com.niit.service.CartItemService;
import com.niit.service.CustomerService;
import com.niit.service.ProductService;

@Controller
public class CartItemController {
	@Autowired
	private ProductService productService;

	@Autowired
	private CustomerService customerService;

	@Autowired
	private CartItemService cartItemService;

	@RequestMapping("/cart_addtocart{id}")
	public String addCartItem(@PathVariable int id, @RequestParam int units, Model model) {
		Product product = productService.getProductById(id);

		if (product.getQuantity() < units) {
			model.addAttribute("product", product);
			model.addAttribute("errorQuantity", "the quantity you entered is more than Stock Quantity");
			return "viewproduct";
		}
		String username = SecurityContextHolder.getContext().getAuthentication().getName();
		// String username = user.getUsername();
		Customer customer = customerService.getCustomerByUsername(username);
		System.out.println("hii" + username + " " + customer.toString());
		Cart cart = customer.getCart();
		List<CartItem> cartItems = cart.getCartItems();
		System.out.println(cartItems.size());

		for (CartItem cartItem : cartItems) {
			// product id in table (productid in database)==id(input)
			System.out.println(cartItem.getProduct().getId());
			System.out.println(id);
			if (cartItem.getProduct().getId() == id) {
				cartItem.setQuantity(units);
				cartItem.setTotalPrice(product.getPrice() * units);
				cartItemService.addCartItem(cartItem);// update cartitem units &
														// totalprice
				model.addAttribute("cart", cart);
				return "cart";
			}
		}

		System.out.println("ADDCART====");
		CartItem cartItem = new CartItem();
		cartItem.setQuantity(units);
		cartItem.setTotalPrice(product.getPrice() * units);
		cartItem.setProduct(product);// product_id column in cartItem table
		cartItem.setCart(cart);// cart_id column in cartitem table
		cartItemService.addCartItem(cartItem);// insert
		
		//int quantity=product.getQuantity()-units;
		product.setQuantity(product.getQuantity() - units);
		
		productService.updateProduct(product);
		System.out.println("ADDCART====1");
		return "redirect:/cart_getcart";
	}

	@RequestMapping("/cart_getcart")
	public String getCart(Model model) {
		
		String username = SecurityContextHolder.getContext().getAuthentication().getName();
		Customer customer = customerService.getCustomerByUsername(username);
		Cart cart = customer.getCart();
		model.addAttribute("cart", cart);
		if(cart.getCartItems().isEmpty())
		{
			System.out.println("hello");
			model.addAttribute("noproduct", "nahi hai");
		}
		return "cart";
	}

	@RequestMapping("/cart_removecartitem{cartItemId}")
	public String removeCartItem(@PathVariable int cartItemId) {
		CartItem item = cartItemService.getCartItem(cartItemId);
		Product product = productService.getProductById(item.getProduct().getId());
		int quantity = product.getQuantity() + item.getQuantity();
		product.setQuantity(quantity);
		productService.updateProduct(product);
		cartItemService.removeCartItem(cartItemId);
		return "redirect:/cart_getcart";
	}

	@RequestMapping("/cart_clearcart{cartId}")
	public String removeAllCartItems(@PathVariable("cartId") int cartId) {
		Cart cart = cartItemService.getCart(cartId);
		List<CartItem> cartItems = cart.getCartItems();
		for (CartItem cartItem : cartItems) {
			CartItem item = cartItemService.getCartItem(cartItem.getCartItemId());
			Product product = productService.getProductById(item.getProduct().getId());
			int quantity = product.getQuantity() + item.getQuantity();
			product.setQuantity(quantity);
			productService.updateProduct(product);
		}
		cartItemService.removeAllCartItems(cartId);
		return "redirect:/cart_getcart";
	}
}
