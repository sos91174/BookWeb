package com.Cart.web;

import com.Cart.pojo.Book;
import com.Cart.pojo.Cart;
import com.Cart.pojo.CartItem;
import com.Cart.service.BookService;
import com.Cart.service.impl.BookServiceImpl;
import com.Cart.utils.WebUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class CartServlet extends BaseServlet {

    private BookService bookService = new BookServiceImpl();

    /**
     * 修改商品數量
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void updateCount(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        // 獲取請求的參數 商品編號 商品數量
        int id = WebUtils.parseInt(req.getParameter("id"),0);
        int count = WebUtils.parseInt(req.getParameter("count"), 1);
        // 獲取CART購物車對象
        Cart cart = (Cart) req.getSession().getAttribute("cart");

        if (cart != null) {
            // 修改商品數量
            cart.updateCount(id,count);
            // 重定向回原来購物車展示頁面
            resp.sendRedirect(req.getHeader("Referer"));
        }
    }

    /**
     * 清空購物車
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void clear(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        // 1 獲取購物車對象
        Cart cart = (Cart) req.getSession().getAttribute("cart");
        if (cart != null) {
            // 清空購物車
            cart.clear();
            // 重定向回原来購物車展示頁面
            resp.sendRedirect(req.getHeader("Referer"));
        }
    }
    /**
     * 删除商品項目
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void deleteItem(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        // 獲取商品編號
        int id = WebUtils.parseInt(req.getParameter("id"), 0);
        // 獲取購物車對象
        Cart cart = (Cart) req.getSession().getAttribute("cart");

        if (cart != null) {
            // 删除了購物車商品項目
            cart.deleteItem(id);
            // 重定向回原来購物車展示頁面
            resp.sendRedirect(req.getHeader("Referer"));
        }

    }



    /**
     * 加入購物車
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void addItem(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 獲取請求的參數 商品編號
        int id = WebUtils.parseInt(req.getParameter("id"), 0);
        // 調用bookService.queryBookById(id):Book得到商品的訊息
        Book book = bookService.queryBookById(id);
        // 把商品訊息，轉換成為CartItem商品項目
        CartItem cartItem = new CartItem(book.getId(),book.getName(),1,book.getPrice(),book.getPrice());
        // 調用Cart.addItem(CartItem);添加商品項目
        Cart cart = (Cart) req.getSession().getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            req.getSession().setAttribute("cart",cart);
        }
        cart.addItem(cartItem);

        System.out.println(cart);
        System.out.println("請求Referer的值：" + req.getHeader("Referer"));
        // 最後一个添加的商品名稱
        req.getSession().setAttribute("lastName", cartItem.getName());

        // 重定向回原來商品所在的地址頁面
        resp.sendRedirect(req.getHeader("Referer"));
    }
}
