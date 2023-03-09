package com.example.shop.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.example.shop.entity.Category;
import com.example.shop.entity.Order;

public interface IOrderService extends IService<Order> {
    IPage<Order> getPage(int currentPage, int pageSize);
}
