package com.dingyao.huiwan.controll;

import org.springframework.stereotype.Controller;
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

}
