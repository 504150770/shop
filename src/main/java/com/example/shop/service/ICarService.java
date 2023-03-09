package com.example.shop.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.example.shop.entity.Car;

public interface ICarService extends IService<Car> {
    IPage<Car> getPage(int currentPage, int pageSize);
}
