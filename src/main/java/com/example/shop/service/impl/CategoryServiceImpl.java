package com.example.shop.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.shop.dao.CarDao;
import com.example.shop.dao.CategoryDao;
import com.example.shop.entity.Car;
import com.example.shop.entity.Category;
import com.example.shop.service.ICarService;
import com.example.shop.service.ICategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CategoryServiceImpl extends ServiceImpl<CategoryDao, Category> implements ICategoryService {
    @Autowired
    private CategoryDao categoryDao;

    @Override
    public IPage<Category> getPage(int currentPage, int pageSize) {
        IPage page = new Page();
        categoryDao.selectPage(page,null);
        return page;
    }
}
