package com.dingyao.huiwan.entiey;

import com.alibaba.excel.annotation.ExcelProperty;
import com.alibaba.excel.metadata.BaseRowModel;

/**
 * TODO
 *
 * @author Otemain
 * @version 1.0
 * @date 2022/5/3 2:35
 */

public class Chi extends BaseRowModel {
    @ExcelProperty(index = 0 , value = "词")
    private String jobNumber;

    public String getJobNumber() {
        return jobNumber;
    }

    public void setJobNumber(String jobNumber) {
        this.jobNumber = jobNumber;
    }

}

