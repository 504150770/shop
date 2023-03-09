package com.example.shop.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.example.shop.entity.Car;
import com.example.shop.entity.Category;

public interface ICategoryService extends IService<Category> {
    IPage<Category> getPage(int currentPage, int pageSize);
}
