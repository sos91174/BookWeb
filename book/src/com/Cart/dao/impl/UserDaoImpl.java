package com.Cart.dao.impl;

import com.Cart.dao.UserDao;
import com.Cart.pojo.User;

public class UserDaoImpl extends BaseDao implements UserDao {
    //查詢是否有這個使用者
    @Override
    public User queryUserByUsername(String username) {
        String sql = "select `id`,`username`,`password`,`email` from t_user where username = ?";
        return queryForOne(User.class, sql, username);
    }
    //查詢使用者帳號和密碼
    @Override
    public User queryUserByUsernameAndPassword(String username, String password) {
        String sql = "select `id`,`username`,`password`,`email` from t_user where username = ? and password = ?";
        return queryForOne(User.class, sql, username,password);
    }
    //儲存插入使用者帳號和密碼
    @Override
    public int saveUser(User user) {
        String sql = "insert into t_user(`username`,`password`,`email`) values(?,?,?)";
        return update(sql, user.getUsername(),user.getPassword(),user.getEmail());
    }
}
