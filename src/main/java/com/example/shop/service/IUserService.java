package com.example.shop.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.example.shop.entity.User;

public interface IUserService  extends IService<User> {
    IPage<User> getPage(int currentPage,int pageSize);
}
