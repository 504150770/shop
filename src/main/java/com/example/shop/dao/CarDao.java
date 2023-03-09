package com.example.shop.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.shop.entity.Car;
import com.example.shop.entity.Good;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * 购物车mapper接口
 */
@Mapper
public interface CarDao extends BaseMapper<Car> {
    //查询
    List<Good> getByUserId(@Param(value = "userId")int userId,@Param(value = "categoryId") int categoryId,@Param(value = "search") String search);
    //查询商品是否在购物车 1：在  0：不在
    int isInCar(@Param(value = "goodId")int goodId,@Param(value = "userId") int userId);
    //删除
    void del(@Param(value = "goodId")int goodId,@Param(value = "userId") int userId);
}
