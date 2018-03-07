package com.demo.test;

import com.demo.entity.ParameVo;
import com.demo.entity.TBapInterPara;
import com.google.gson.Gson;

/**
 * @program: spring-boot-demo
 * @description: 测试转json
 * @author: hu_pf@suixingpay.com
 * @create: 2018-03-01 15:48
 **/
public class Demo {
    public static void main(String[] args) {
//        Gson gson= new Gson();
//        TBapInterPara tBapInterPara=new TBapInterPara();
//        tBapInterPara.setFieldNm("haha");
//        tBapInterPara.setFieldTyp("String");
//        tBapInterPara.setRemarks("这是一个测试");
//        String str= gson.toJson(tBapInterPara);
////        System.out.println(str);
//        TBapInterPara demo1=new TBapInterPara();
//        demo1=gson.fromJson(str,TBapInterPara.class);
//        System.out.println(demo1.getRemarks());
        String str="{\"datas\":[{\"fieldTyp\":\"Object\",\"required\":\"是\",\"remarks\":\"1\",\"fieldNm\":\"1\"}],\"level\":\"1\",\"uuid\":\"IN_94473A5C-0734-4293-B708-5DE7C6AEFDC6\"}@@{\"datas\":[{\"fieldTyp\":\"Object\",\"required\":\"是\",\"remarks\":\"2\",\"fieldNm\":\"2\"}],\"level\":\"2\",\"uuid\":\"IN_3D58EE73-2247-4D10-A943-1FD97D574D8F\"}@@{\"datas\":[{\"fieldTyp\":\"String\",\"required\":\"是\",\"remarks\":\"3\",\"fieldNm\":\"3\"}],\"level\":\"3\",\"uuid\":\"IN_19BC2339-4351-4636-949D-7B90E2C3B2E1\"}";
        String [] myStr=str.split("@@");
        Gson gson=new Gson();
        ParameVo parameVo=new ParameVo();
        parameVo=gson.fromJson(myStr[0],ParameVo.class);
        System.out.println(myStr[0]);
        System.out.println(parameVo.getUuid());
        System.out.println(parameVo.getLevel());
    }
}
