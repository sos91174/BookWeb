package com.Cart.service.impl;

import com.Cart.dao.UserDao;
import com.Cart.dao.impl.UserDaoImpl;
import com.Cart.pojo.User;
import com.Cart.service.UserService;

public class UserServiceImpl implements UserService {

    private UserDao userDao = new UserDaoImpl();

    @Override
    public void registUser(User user) {
        userDao.saveUser(user);
    }

    @Override
    public User login(User user) {

        return userDao.queryUserByUsernameAndPassword(user.getUsername(), user.getPassword());
    }

    @Override
    public boolean existsUsername(String username) {

        if (userDao.queryUserByUsername(username) == null) {
           // 等於null,說明沒查到，沒查到表示可用
           return false;
        }

        return true;

    }
}
