package com.Cart.service;

import com.Cart.pojo.Cart;

public interface OrderService {
    public String createOrder(Cart cart,Integer userId);
}
