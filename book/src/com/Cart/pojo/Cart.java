package com.Cart.pojo;

import java.math.BigDecimal;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * 購物車對象
 */
public class Cart {
//    private Integer totalCount;
//    private BigDecimal totalPrice;

    /**
     * key是商品編號，
     * value，是商品訊息
     */
    private Map<Integer,CartItem> items = new LinkedHashMap<Integer,CartItem>();

    /**
     * 添加商品項目
     *
     * @param cartItem
     */
    public void addItem(CartItem cartItem) {

        // 先看購物車中是否已經添加過此商品，如果已經添加則數量累加，總金額更新，如果沒添加過則新增到List
        CartItem item = items.get(cartItem.getId());
        //如果之前沒添加過此商品
        if (item == null) {
            //就把商品添加進去
            items.put(cartItem.getId(), cartItem);
        } else {
            // 如果已經添加過
            item.setCount( item.getCount() + 1 ); //累加商品數量
            item.setTotalPrice( item.getPrice().multiply(new BigDecimal( item.getCount() )) ); //更新總金額
        }

    }

    /**
     * 删除商品項目
     */
    public void deleteItem(Integer id) {
        items.remove(id);
    }


    /**
     * 清空購物車的東西
     */
    public void clear() {
        items.clear();
    }

    /**
     * 修改商品數量
     */
    public void updateCount(Integer id,Integer count) {

        //先看購物車中是否已經添加過此商品，如果已經添加則修改商品數量，總金額更新
        CartItem cartItem = items.get(id);
        if (cartItem != null) {
            cartItem.setCount(count);// 修改商品數量
            cartItem.setTotalPrice( cartItem.getPrice().multiply(new BigDecimal( cartItem.getCount() )) ); //更新總金額
        }
    }

    //取得全部數量
    public Integer getTotalCount() {
        Integer totalCount = 0;

        for (Map.Entry<Integer,CartItem>entry : items.entrySet()) {
            totalCount += entry.getValue().getCount();
        }

        return totalCount;
    }

    //取得全部價錢
    public BigDecimal getTotalPrice() {
        BigDecimal totalPrice = new BigDecimal(0);

        for (Map.Entry<Integer,CartItem>entry : items.entrySet()) {
            totalPrice = totalPrice.add(entry.getValue().getTotalPrice());
        }

        return totalPrice;
    }


    public Map<Integer, CartItem> getItems() {
        return items;
    }

    public void setItems(Map<Integer, CartItem> items) {
        this.items = items;
    }

    @Override
    public String toString() {
        return "Cart{" +
                "totalCount=" + getTotalCount() +
                ", totalPrice=" + getTotalPrice() +
                ", items=" + items +
                '}';
    }
}
