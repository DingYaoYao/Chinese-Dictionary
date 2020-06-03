package com.dingyao.huiwan.mapper;

import com.dingyao.huiwan.entiey.Cai;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.MyMapper;

public interface CaiMapper extends MyMapper<Cai> {


    Cai selectbycai(@Param("caizi") String caizi);

}