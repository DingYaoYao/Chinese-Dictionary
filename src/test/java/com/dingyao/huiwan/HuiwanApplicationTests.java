package com.dingyao.huiwan;

import com.dingyao.huiwan.entiey.Cai;
import com.dingyao.huiwan.entiey.Chiku;
import com.dingyao.huiwan.mapper.CaiMapper;
import com.dingyao.huiwan.mapper.ChikuMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = HuiwanApplication.class)
public class HuiwanApplicationTests {
    @Autowired
    private ChikuMapper chikuMapper;
    @Autowired
    private CaiMapper CaiMapper;
    @Test
    public   void contextLoads() {
        List<Chiku> tbUsers = chikuMapper.selectAll();
        for (Chiku tbUser : tbUsers) {
            String caizhi = "";
            String chi = tbUser.getText();
            char a[]=chi.toCharArray();
            for(char b:a){
                System.out.println(b);
              Cai Cai= CaiMapper.selectbycai(String.valueOf(b));
      if(Cai!=null){
          caizhi+=Cai.getCai()+">";
          System.out.println(Cai.getCai());
          char d[]=Cai.getCai().toCharArray();
          for (char c:d){
              Cai Caia= CaiMapper.selectbycai(String.valueOf(c));
              if(Caia!=null){
                  caizhi+=Caia.getCai()+">";
                  System.out.println(Caia.getCai());
              }
              }



      }
            }


             chikuMapper.updatechiku(caizhi.replace(" ", ""),tbUser.getId());

            System.out.println(caizhi);

        }
    }}


