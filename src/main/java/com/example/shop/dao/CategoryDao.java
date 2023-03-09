package com.example.shop.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.shop.entity.Category;
import com.example.shop.entity.CategoryQuery;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * 分类mapper接口
 */
@Mapper
public interface CategoryDao extends BaseMapper<Category> {
    //查询种类信息
    List<Category> getList();
    //分页查询
    List query(CategoryQuery query);
    //查询总数
    int queryCount(CategoryQuery query);
    //后台删除
    void delList(List<Integer> list);
    //后台查询（id）
    Category getById(@Param(value = "id")int id);
    //后台更新
    void update(Category good);
}
