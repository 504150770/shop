package com.example.shop.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.shop.dao.CarDao;
import com.example.shop.dao.MessageDao;
import com.example.shop.entity.Car;
import com.example.shop.entity.Message;
import com.example.shop.service.ICarService;
import com.example.shop.service.IMessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MessageServiceImpl extends ServiceImpl<MessageDao, Message> implements IMessageService {
    @Autowired
    private MessageDao messageDao;

    @Override
    public IPage<Message> getPage(int currentPage, int pageSize) {
        IPage page = new Page();
        messageDao.selectPage(page,null);
        return page;
    }
}
