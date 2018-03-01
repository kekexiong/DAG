package com.demo.controller;

import com.demo.service.TestDemoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 * @program: spring-boot-demo
 * @description:
 * @author: hu_pf@suixingpay.com
 * @create: 2018-03-01 09:47
 **/
@Controller
public class TestDemo {
    @Autowired
    private TestDemoService testDemoService;

    @RequestMapping(value = "/query")
    @ResponseBody
    public List<Map<String, Object>> queryCondition() {
        return testDemoService.findByCondition();
    }


    @RequestMapping(value = "/index")
    public String index() {
        return "customer";
    }

}
