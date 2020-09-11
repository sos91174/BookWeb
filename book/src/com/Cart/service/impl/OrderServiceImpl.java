package com.Cart.service.impl;

import com.Cart.dao.BookDao;
import com.Cart.dao.OrderDao;
import com.Cart.dao.OrderItemDao;
import com.Cart.dao.impl.BookDaoImpl;
import com.Cart.dao.impl.OrderDaoImpl;
import com.Cart.dao.impl.OrderItemDaoImpl;
import com.Cart.pojo.*;
import com.Cart.service.OrderService;

import java.util.Date;
import java.util.Map;

public class OrderServiceImpl implements OrderService {

    private OrderDao orderDao = new OrderDaoImpl();
    private OrderItemDao orderItemDao = new OrderItemDaoImpl();
    private BookDao bookDao = new BookDaoImpl();

    @Override
    public String createOrder(Cart cart, Integer userId) {
        // 訂單號==唯一性 因為有取當下時間+用戶ID
        String orderId = System.currentTimeMillis()+""+userId;
        // 創建一個訂單對象
        Order order = new Order(orderId,new Date(),cart.getTotalPrice(), 0,userId);
        // 保存訂單
        orderDao.saveOrder(order);

        //  取購物車中每一個商品項轉換成為訂單項目保存到數據庫
        for (Map.Entry<Integer, CartItem>entry : cart.getItems().entrySet()){
            // 獲取每一個購物車中的商品項
            CartItem cartItem = entry.getValue();
            // 轉換為每一個訂單項目
            OrderItem orderItem = new OrderItem(null,cartItem.getName(),cartItem.getCount(),cartItem.getPrice(),cartItem.getTotalPrice(), orderId);
            // 保存訂單到數據庫
            orderItemDao.saveOrderItem(orderItem);

            // 更新庫存和銷量
            Book book = bookDao.queryBookById(cartItem.getId());
            book.setSales( book.getSales() + cartItem.getCount() );
            book.setStock( book.getStock() - cartItem.getCount() );
            bookDao.updateBook(book);

        }
        // 清空購物車
        cart.clear();

        return orderId;
    }
}
