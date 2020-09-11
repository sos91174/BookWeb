package com.Cart.web;

import com.Cart.pojo.User;
import com.Cart.service.UserService;
import com.Cart.service.impl.UserServiceImpl;
import com.Cart.utils.WebUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY;

public class UserServlet extends BaseServlet {

    private UserService userService = new UserServiceImpl();

    /**
     * 註銷
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void logout(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        1、銷毀Session中用戶登入的信息（或者銷毀Session）
        req.getSession().invalidate();
//        2、重定向到首頁（或登入頁面）。
        resp.sendRedirect(req.getContextPath());
    }
    /**
     * 處理登入的功能
     *
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void login(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        //  1、獲取請求參數
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        // 調用 userService.login()登入處理業務
        User loginUser = userService.login(new User(null, username, password, null));
        // 如果等於null,說明登入失敗!
        if (loginUser == null) {
            // 把錯誤信息，和顯示的表單項目訊息，保存到Request域中
            req.setAttribute("msg", "用戶或密碼錯誤！");
            req.setAttribute("username", username);
            //   跳回登入頁面
            req.getRequestDispatcher("/pages/user/login.jsp").forward(req, resp);
        } else {
            // 登入 成功
            // 保存用戶登入的訊息到Session域中
            req.getSession().setAttribute("user", loginUser);
            //跳到成功頁面login_success.html
            req.getRequestDispatcher("/pages/user/login_success.jsp").forward(req, resp);
        }

    }

    /**
     * 處理註冊的功能
     *
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void regist(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 獲取Session中的驗證碼
        String token = (String) req.getSession().getAttribute(KAPTCHA_SESSION_KEY);
        // 删除 Session中的驗證碼
        req.getSession().removeAttribute(KAPTCHA_SESSION_KEY);

        //  1、獲取請求參數
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String email = req.getParameter("email");
        String code = req.getParameter("code");

        User user = WebUtils.copyParamToBean(req.getParameterMap(), new User());

//        2、檢查 驗證碼是否正確  === 把它寫死,要求驗證碼為:abcde
        if (token!=null && token.equalsIgnoreCase(code)) {
//        3、檢查 用戶名是否可用
            if (userService.existsUsername(username)) {
                System.out.println("用戶名[" + username + "]已存在!");

                // 把顯示的訊息，保存到Request域中
                req.setAttribute("msg", "用戶名已存在！！");
                req.setAttribute("username", username);
                req.setAttribute("email", email);

//        跳回註冊頁面
                req.getRequestDispatcher("/pages/user/login.jsp").forward(req, resp);
            } else {
                //      可用
//                調用Sservice保存到數據庫
                userService.registUser(new User(null, username, password, email));
//
//        跳到註冊成功頁面 regist_success.jsp
                req.getRequestDispatcher("/pages/user/regist_success.jsp").forward(req, resp);
            }
        } else {
            // 把顯示的信息，保存到Request域中
            req.setAttribute("msg", "驗證碼錯誤！！");
            req.setAttribute("username", username);
            req.setAttribute("email", email);

            System.out.println("驗證碼[" + code + "]錯誤");
            req.getRequestDispatcher("/pages/user/regist.jsp").forward(req, resp);
        }

    }


}
