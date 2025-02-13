package com.dingyao.huiwan.controll;

import org.springframework.core.io.FileSystemResource;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/",produces = "application/json; charset=utf-8")
public class controll {
    @RequestMapping(value = "/index",method = RequestMethod.GET)
    public String login() throws Exception {
        return "index";
    }
    @RequestMapping(value = "/fankui",method = RequestMethod.GET)
    public String fankui() throws Exception {
        return "fankui";
    }


    @GetMapping("/ic/{uname}")
    public String previewFile(@PathVariable String uname, Model model) {
        // 将uname添加到Model中，传递给JSP页面
        model.addAttribute("username", uname);
        return "userip"; // 返回JSP页面名称（userip.jsp）
    }

}
