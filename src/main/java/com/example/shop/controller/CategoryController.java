package com.example.shop.controller;

import com.example.shop.dao.CategoryDao;
import com.example.shop.entity.*;
import com.example.shop.service.ICategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

/**
 * 种类控制器类
 * @author sen
 */
@RestController
@RequestMapping("/category/")
public class CategoryController {
    @Resource
    private CategoryDao categoryDao;
    @Autowired
    private ICategoryService categoryService;

    @GetMapping("{currentPage}/{pageSize}")
    public List<Category> getPage(@PathVariable int currentPage, @PathVariable int pageSize){
        return categoryService.getPage(currentPage,pageSize).getRecords();
    }

    /**
     * 后台分页查询
     * @param query
     * @return
     */
    @GetMapping("query")
    public TableData query(CategoryQuery query){
        query.setPage((query.getPage() - 1) * query.getLimit());
        TableData tableData = new TableData();
        tableData.setData(categoryDao.query(query));
        tableData.setCount(categoryDao.queryCount(query));
        return tableData;
    }

    /**
     * 后台删除
     * @param idList
     * @return
     */
    @GetMapping("delList")
    public boolean delList(@RequestParam(name = "idList[]") List<Integer> idList){
        categoryDao.deleteBatchIds(idList);
        return true;
    }

    @GetMapping("{id}")
    public Category getById(@PathVariable Integer id){
        return categoryService.getById(id);
    }

    @PutMapping
    public Boolean update(@RequestBody Category category){
        return categoryService.updateById(category);
    }
}
