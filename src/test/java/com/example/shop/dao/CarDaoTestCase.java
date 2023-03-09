package com.example.shop.dao;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class CarDaoTestCase {
    @Autowired
    private UserDao userdao;


    @Test
    void testGetPage(){
        IPage page = new Page(1,5);
        userdao.selectPage(page,null);
    }
}
