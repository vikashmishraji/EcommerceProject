package com.niit.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.niit.dao.CustomerOrderDao;
import com.niit.model.Cart;
import com.niit.model.CustomerOrder;

@Service
@Transactional
public class CustomerOrderServiceImpl implements CustomerOrderService{
	@Autowired
	private CustomerOrderDao customerOrderDao;
	public CustomerOrder createOrder(Cart cart) {
		System.out.println("hel2");
		return customerOrderDao.createOrder(cart);
	}
}
