package com.dingyao.huiwan.controll;

import com.dingyao.huiwan.entiey.Cai;
import com.dingyao.huiwan.entiey.Chiku;
import com.dingyao.huiwan.entiey.Fankui;
import com.dingyao.huiwan.mapper.CaiMapper;
import com.dingyao.huiwan.mapper.ChikuMapper;
import com.dingyao.huiwan.mapper.FankuiMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;


@RestController
@RequestMapping(value = "/v1",produces = "application/json; charset=utf-8")
public class HomeController {
    @Autowired
    private ChikuMapper chikuMapper;
    @Autowired
    private FankuiMapper fankuiMapper;
    @Autowired
    private CaiMapper CaiMapper;

    @RequestMapping(value = "/indexx",method = RequestMethod.GET)
    public List<Chiku> login() throws Exception {
        List<Chiku>Chiku= chikuMapper.selectAll();
        return Chiku;
    }

    @RequestMapping(value = "/fankui",method = RequestMethod.POST)
    public int  fankui(@RequestParam("name")String name,@RequestParam("text")String text,@RequestParam("ip")String ip) throws Exception {
        int a=0;
        if(name.equals("查询")){
            Fankui Fankui=new Fankui();
            Fankui.setName(name);
            Fankui.setUserip(ip);
            Fankui.setText(text);
            fankuiMapper.insert(Fankui);
            return 8888;
        }else{
            List<Chiku>Chiku=new ArrayList<>();
            String   caisql="  1=1  AND  `TEXT` =  '"+text+"'   ";
            Chiku= chikuMapper.findUserByNameAndRoleIdlen(caisql);
            if(Chiku.size()>0){
                return 2;
            }else{
                Fankui Fankui=new Fankui();
                Fankui.setName(name);
                Fankui.setUserip(ip);
                Fankui.setText(text);
                fankuiMapper.insert(Fankui);

                Chiku ciku=new Chiku();
                ciku.setText(text);
                ciku.setLen(text.length());
                String caizhi = "";
                char ac[]=text.toCharArray();
                for(char b:ac){
                    Cai Cai= CaiMapper.selectbycai(String.valueOf(b));
                    if(Cai!=null){
                        caizhi+=Cai.getCai()+">";
                        char d[]=Cai.getCai().toCharArray();
                        for (char c:d){
                            Cai Caia= CaiMapper.selectbycai(String.valueOf(c));
                            if(Caia!=null){
                                caizhi+=Caia.getCai()+">";
                            }
                        }
                    }
                }
                ciku.setCaizi(caizhi.replace(" ", ""));
                String pinyin=stringutil.getPinYinHeadChar(text);
                ciku.setPinyin(pinyin.replace(" ", ""));
              a=  chikuMapper.insert(ciku);
            }

        }
        return a;
    }
    @RequestMapping(value = "/query",method = RequestMethod.POST)
    public List<Chiku> chazhao(@RequestParam("text")String text,@RequestParam("len")int len,@RequestParam("pinyin")String pinyin,@RequestParam("cai")String cai) throws Exception {
        List<Chiku>Chiku=new ArrayList<>();
        String caisql="1=1  ";
        if(!cai.equals("")){
            char a[]=cai.toCharArray();
            for(char b:a){
                caisql+="AND  `caizi` LIKE  '%"+b+"%'   ";
            }
        }
        if(!text.equals("")){
            char a[]=text.toCharArray();
            for(char b:a){
                caisql+="AND  `TEXT` LIKE  '%"+b+"%'   ";
            }
        }
        if(!pinyin.equals("")){
            char a[]=pinyin.toCharArray();
            for(char b:a){
                caisql+="AND  `pinyin` LIKE  '%"+b+"%'   ";
            }
        }
        if(len==0){
            caisql+=" order by len*1 desc;";
            Chiku= chikuMapper.findUserByNameAndRoleIdlen(caisql);
        }else{
            caisql+="AND  `len` LIKE  '%"+len+"%'   ";
            caisql+=" order by len*1 desc;";
            Chiku= chikuMapper.findUserByNameAndRoleIdlen(caisql);
        }
        return Chiku;
    }

}
