package com.demo.test;

import com.demo.util.FreemarkerUtil;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @program: demo-freemarker
 * @description:
 * @author: hu_pf@suixingpay.com
 * @create: 2018-02-27 17:18
 **/
public class FreemarkerTest {
    public static void main(String[] args) {
        Map<String, Object> root = new HashMap<String, Object>();

        FreemarkerUtil util = new FreemarkerUtil();
//        util.fprint("001.jsp", root, "0001.jsp");
        List<Map<String,String>> demoList =new ArrayList<>();
        Map<String,String> demoMap = new HashMap<>();
        Map<String,String> demoMap2 = new HashMap<>();
        demoMap.put("name","uuid");
        demoMap.put("type","String");
        demoMap.put("input","非空");
        demoMap.put("remark","请求流水id");
        demoMap2.put("name","sysId");
        demoMap2.put("type","String");
        demoMap2.put("input","非空");
        demoMap2.put("remark","系统编码");
        demoList.add(demoMap);
        demoList.add(demoMap2);
        root.put("demoList",demoList);
        root.put("fileName","结算接口");
        root.put("description","结算申请接口，提供多种结算模式（秒到 TN  TO）和 多种余额结算方式 ");
        root.put("description2","请在gradle中增加如下配置：\n" +
                "\tcompile (\"com.suixingpay:ses-dubbo-api:1.0-<environment>-SNAPSHOT\")\n");
        root.put("description3","参数类型为com.suixingpay.common.rpc.v2.RpcRequest（传入的对象路径），RpcRequest在common-rpc-3.0.3.jar包中\n" +
                "具体属性说明如下\n");
        util.fprint("01.ftl", root, "01.doc");
//        util.fprint("02.ftl", root, "02.html");
//        util.fprint("03.ftl", root, "03.html");
//        util.fprint("04.ftl", root, "04.html");
//        util.fprint("05.ftl", root, "05.html");
//        util.fprint("06.ftl", root, "06.html");
    }
}
