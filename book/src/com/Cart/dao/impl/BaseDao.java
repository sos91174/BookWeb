package com.Cart.dao.impl;

import com.Cart.utils.JdbcUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public abstract class BaseDao {

    //使用DbUtils操作數據庫
    private QueryRunner queryRunner = new QueryRunner();

    /**
     * update() 方法用來執行：Insert\Update\Delete語法
     *
     * @return 如果返回-1,說明執行失敗<br/>返回其他表示影響的行數
     */
    public int update(String sql, Object... args) {
        Connection connection = JdbcUtils.getConnection();
        try {
            return queryRunner.update(connection, sql, args);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcUtils.close(connection);
        }
        return -1;
    }

    /**
     * 查詢返回單一個javaBean的sql語法
     *
     * @param type 返回的對象類型
     * @param sql  執行的sql語法
     * @param args sql對應的參數值
     * @param <T>  返回類型的的泛型
     * @return
     */
    public <T> T queryForOne(Class<T> type, String sql, Object... args) {
        Connection con = JdbcUtils.getConnection();
        try {
            return queryRunner.query(con, sql, new BeanHandler<T>(type), args);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcUtils.close(con);
        }
        return null;
    }

    /**
     * 查詢返回多個javaBean的sql語法
     *
     * @param type 返回的對象類型
     * @param sql  執行的sql語法
     * @param args sql對應的參數值
     * @param <T>  返回的類型的泛型
     * @return
     */
    public <T> List<T> queryForList(Class<T> type, String sql, Object... args) {
        Connection con = JdbcUtils.getConnection();
        try {
            return queryRunner.query(con, sql, new BeanListHandler<T>(type), args);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcUtils.close(con);
        }
        return null;
    }

    /**
     * 執行返回一行一列的sql語法
     * @param sql   執行的sql語法
     * @param args  sql對應的參數值
     * @return
     */
    public Object queryForSingleValue(String sql, Object... args){

        Connection conn = JdbcUtils.getConnection();

        try {
            return queryRunner.query(conn, sql, new ScalarHandler(), args);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JdbcUtils.close(conn);
        }
        return null;

    }

}
