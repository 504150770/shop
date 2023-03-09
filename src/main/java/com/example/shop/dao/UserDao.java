package com.example.shop.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.shop.entity.User;
import com.example.shop.entity.UserQuery;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * 用户mapper接口
 */
@Mapper
public interface UserDao extends BaseMapper<User> {
    //查询用户是否存在（邮箱、密码）
    User login(User user);
    //插入用户
    void save(User user);
    //查询校验用户邮箱是否注册
    int check(User user);
    //更新用户信息
    void update(User user);
    //用户信息查询
    User getById(@Param(value = "userId")int userId);
    //分页查询
    List<User> query(UserQuery userQuery);
    //数据总数查询
    int queryCount(UserQuery userQuery);
    //后台（批量|单个）删除
    void del(List<Integer> list);
    //后台更新
    void userUpdate(User user);
}
