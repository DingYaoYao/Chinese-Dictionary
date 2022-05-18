package com.dingyao.huiwan.controll;

import com.alibaba.excel.EasyExcelFactory;
import com.alibaba.excel.metadata.Sheet;
import com.dingyao.huiwan.entiey.Chi;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

/**
 * TODO
 *
 * @author Otemain
 * @version 1.0
 * @date 2022/5/3 2:38
 */
public class main {


    public static void main(String[] args) throws FileNotFoundException {
        //存放表格中员工工号
        ArrayList<String> jobNumbers = new ArrayList<>();
        // sheetNo --> 读取哪一个 表单
        // headLineMun --> 从哪一行开始读取( 不包括定义的这一行，比如 headLineMun为2 ，那么取出来的数据是从 第三行的数据开始读取 )
        // clazz --> 将读取的数据，转化成对应的实体，需要 extends BaseRowModel
        Sheet sheet = new Sheet(1, 1, Chi.class);
        // 这里 取出来的是 ExcelModel实体 的集合
        InputStream is =new FileInputStream("C:\\Users\\Administrator\\Desktop\\wasd.xlsx");
        List<Object> readList = EasyExcelFactory.read(is, sheet);
        for (int i = 0; i < readList.size(); i++) {
            Chi wno = (Chi) readList.get(i);
            //拿到实体类可以做一些验证
            //员工表里去查下，这个工号有没有，如果没有，提示：第rowNum行工号"   "有误，请核实！
            String jobNumber = wno.getJobNumber();//获取到员工工号
            //当前行数
            int d = i + 2;
            //判断是否为空为空跳过
            if (jobNumber==null||jobNumber.length()==0) {
                continue;
            }
            System.out.println(jobNumber);



            jobNumbers.add(jobNumber);

        }




    }


}
