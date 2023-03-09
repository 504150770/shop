package com.example.shop.util;

import lombok.Data;

@Data
public class R {
    private Boolean flag;
    private Object data;

    public R(){}

    public R(boolean flag){
        this.flag = flag;
    }

    public R(Boolean flag,Object data){
        this.flag = flag;
        this.data = data;
    }
}
