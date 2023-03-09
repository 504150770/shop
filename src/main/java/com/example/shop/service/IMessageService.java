package com.example.shop.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.example.shop.entity.Category;
import com.example.shop.entity.Message;

public interface IMessageService extends IService<Message> {
    IPage<Message> getPage(int currentPage, int pageSize);
}
