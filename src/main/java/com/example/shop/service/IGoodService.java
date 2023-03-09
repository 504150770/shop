package com.example.shop.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.example.shop.entity.Category;
import com.example.shop.entity.Good;

public interface IGoodService extends IService<Good> {
    IPage<Good> getPage(int currentPage, int pageSize);
}
