package com.Cart.web;

import com.Cart.pojo.User;
import com.Cart.service.UserService;
import com.Cart.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class LoginServlet extends HttpServlet {

    private UserService userService = new UserServiceImpl();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //  1、獲取請求參數
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        // 調用 userService.login()登入處理業務
        User loginUser = userService.login(new User(null, username, password, null));
        // 如果等於null,說明登入失敗!
        if (loginUser == null) {
            // 把錯誤信息，和顯示的表單項目訊息，保存到Request域中
            req.setAttribute("msg","用戶或密碼錯誤！");
            req.setAttribute("username", username);
            //   跳回登入頁面
            req.getRequestDispatcher("/pages/user/login.jsp").forward(req, resp);
        } else {
            // 登入 成功
            //跳到成功頁面login_success.html
            req.getRequestDispatcher("/pages/user/login_success.jsp").forward(req, resp);
        }
    }
}
