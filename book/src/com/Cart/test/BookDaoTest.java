package com.Cart.test;

import com.Cart.dao.BookDao;
import com.Cart.dao.impl.BookDaoImpl;
import com.Cart.pojo.Book;
import com.Cart.pojo.Page;
import org.junit.Test;

import java.math.BigDecimal;

public class BookDaoTest {

    private BookDao bookDao = new BookDaoImpl();
    //測試新增商品
    @Test
    public void addBook() {
        bookDao.addBook(new Book(null,"三國志！", "關羽", new BigDecimal(9999),1100000,0,null
                ));
    }
    //測試刪除單筆商品ID
    @Test
    public void deleteBookById() {
        bookDao.deleteBookById(21);
    }
    //測試更新商品
    @Test
    public void updateBook() {
        bookDao.updateBook(new Book(21,"紅樓夢", "張飛", new BigDecimal(9999),1100000,0,null
        ));
    }
    //測試查詢商品
    @Test
    public void queryBookById() {
        System.out.println( bookDao.queryBookById(21) );
    }
    //測試查詢全部商品的所有訊息
    @Test
    public void queryBooks() {
        for (Book queryBook : bookDao.queryBooks()) {
            System.out.println(queryBook);
        }
    }
    //測試查詢全部商品數量
    @Test
    public void queryForPageTotalCount() {
        System.out.println( bookDao.queryForPageTotalCount() );
    }

    @Test
    public void queryForPageTotalCountByPrice() {
        System.out.println( bookDao.queryForPageTotalCountByPrice(10, 50) );
    }

    @Test
    public void queryForPageItems() {
        for (Book book : bookDao.queryForPageItems(8, Page.PAGE_SIZE)) {
            System.out.println(book);
        }
    }
    @Test
    public void queryForPageItemsByPrice() {
        for (Book book : bookDao.queryForPageItemsByPrice(0, Page.PAGE_SIZE,10,50)) {
            System.out.println(book);
        }
    }

}