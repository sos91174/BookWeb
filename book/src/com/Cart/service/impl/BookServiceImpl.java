package com.Cart.service.impl;

import com.Cart.dao.BookDao;
import com.Cart.dao.impl.BookDaoImpl;
import com.Cart.pojo.Book;
import com.Cart.pojo.Page;
import com.Cart.service.BookService;

import java.util.List;

public class BookServiceImpl implements BookService {

    private BookDao bookDao = new BookDaoImpl();

    @Override
    public void addBook(Book book) {
        bookDao.addBook(book);
    }

    @Override
    public void deleteBookById(Integer id) {
        bookDao.deleteBookById(id);
    }

    @Override
    public void updateBook(Book book) {
        bookDao.updateBook(book);
    }

    @Override
    public Book queryBookById(Integer id) {
        return bookDao.queryBookById(id);
    }

    @Override
    public List<Book> queryBooks() {
        return bookDao.queryBooks();
    }

    @Override
    public Page<Book> page(int pageNo, int pageSize) {
        Page<Book> page = new Page<Book>();

        // 設置每頁顯示的數量
        page.setPageSize(pageSize);
        // 求全部的紀錄數
        Integer pageTotalCount = bookDao.queryForPageTotalCount();
        // 設置總紀錄數
        page.setPageTotalCount(pageTotalCount);
        // 求全部的頁碼
        Integer pageTotal = pageTotalCount / pageSize;
        if (pageTotalCount % pageSize > 0) {
            pageTotal+=1;
        }
        // 設置總頁碼
        page.setPageTotal(pageTotal);

        // 設置當前頁碼
        page.setPageNo(pageNo);

        // 求當前頁碼數據的開始索引
        int begin = (page.getPageNo() - 1) * pageSize;
        // 求當前頁的數據
        List<Book> items = bookDao.queryForPageItems(begin,pageSize);
        // 設置當前頁數據
        page.setItems(items);

        return page;
    }

    @Override
    public Page<Book> pageByPrice(int pageNo, int pageSize, int min, int max) {
        Page<Book> page = new Page<Book>();

        // 設置每頁顯示的數量
        page.setPageSize(pageSize);
        // 求全部的紀錄數
        Integer pageTotalCount = bookDao.queryForPageTotalCountByPrice(min,max);
        // 設置全部的紀錄數
        page.setPageTotalCount(pageTotalCount);
        // 求總頁碼
        Integer pageTotal = pageTotalCount / pageSize;
        if (pageTotalCount % pageSize > 0) {
            pageTotal+=1;
        }
        // 設置總頁碼
        page.setPageTotal(pageTotal);

        // 設置當前頁碼
        page.setPageNo(pageNo);

        // 求當前頁數據的開始索引
        int begin = (page.getPageNo() - 1) * pageSize;
        // 求當前頁的數據
        List<Book> items = bookDao.queryForPageItemsByPrice(begin,pageSize,min,max);
        // 設置當前頁數據
        page.setItems(items);

        return page;
    }
}
