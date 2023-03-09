package com.example.shop.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.shop.dao.CarDao;
import com.example.shop.entity.Car;
import com.example.shop.service.ICarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CarServiceImpl extends ServiceImpl<CarDao, Car> implements ICarService {
    @Autowired
    private CarDao carDao;

    @Override
    public IPage<Car> getPage(int currentPage, int pageSize) {
        IPage page = new Page();
        carDao.selectPage(page,null);
        return page;
    }
}
