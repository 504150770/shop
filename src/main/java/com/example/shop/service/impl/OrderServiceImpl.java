package com.example.shop.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.shop.dao.CarDao;
import com.example.shop.dao.OrderDao;
import com.example.shop.entity.Car;
import com.example.shop.entity.Order;
import com.example.shop.service.ICarService;
import com.example.shop.service.IOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderServiceImpl extends ServiceImpl<OrderDao, Order> implements IOrderService {
    @Autowired
    private OrderDao orderDao;

    @Override
    public IPage<Order> getPage(int currentPage, int pageSize) {
        IPage page = new Page();
        orderDao.selectPage(page,null);
        return page;
    }
}
