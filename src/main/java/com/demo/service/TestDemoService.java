package com.demo.service;

import com.demo.dao.TestDemoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @program: spring-boot-demo
 * @description:
 * @author: hu_pf@suixingpay.com
 * @create: 2018-03-01 09:48
 **/
@Service
public class TestDemoService {
    @Autowired
    private TestDemoMapper testDemoMapper;

    public List<Map<String, Object>> findByCondition(){
        return testDemoMapper.findByCondition();
    }
}
