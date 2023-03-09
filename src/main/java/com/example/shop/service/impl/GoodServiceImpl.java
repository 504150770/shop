package com.example.shop.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.shop.dao.CarDao;
import com.example.shop.dao.GoodDao;
import com.example.shop.entity.Car;
import com.example.shop.entity.Good;
import com.example.shop.service.ICarService;
import com.example.shop.service.IGoodService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GoodServiceImpl extends ServiceImpl<GoodDao, Good> implements IGoodService {
    @Autowired
    private GoodDao goodDao;

    @Override
    public IPage<Good> getPage(int currentPage, int pageSize) {
        IPage page = new Page();
        goodDao.selectPage(page,null);
        return page;
    }
}
