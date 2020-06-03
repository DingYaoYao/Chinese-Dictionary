package com.dingyao.huiwan.mapper;

import com.dingyao.huiwan.entiey.Chiku;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.MyMapper;

import java.util.List;

public interface ChikuMapper extends MyMapper<Chiku> {

    List<Chiku> findUserByNameAndRoleIdlen(@Param("cai")String cai);

    int updatechiku(@Param("caizi") String caizi,@Param("id") int  id);

}