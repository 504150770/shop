package com.example.shop.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.shop.entity.Good;
import com.example.shop.entity.GoodQuery;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * 商品mapper接口
 */
@Mapper
public interface GoodDao extends BaseMapper<Good> {
    //插入
    void save(Good good);
//    模糊查询
    List<Good> getListByUserId(@Param(value = "userId")int userId,@Param(value = "categoryId") int categoryId,@Param(value = "search") String search);
    //模糊查询（未出售的商品:1）
    List<Good> getList(@Param(value = "categoryId") int categoryId,@Param(value = "search") String search);
//    //更新商品状态为0：已售出x
    void buy(@Param(value = "goodId")int goodId);
    //更新商品状态为1：未售出
    void del(@Param(value = "goodId")int goodId);
    //更新商品状态为1：未售出
    void cancel(@Param(value = "orderId")int orderId);
    //查询商品信息（商品id）
    Good getById(@Param(value = "id")int id);
    //分页查询
    List query(GoodQuery query);
    //查询总数
    int queryCount(GoodQuery query);
//    //后台批量删除
//    void delList(List<Integer> list);
//    //后台更新
//    void update(Good good);
}
