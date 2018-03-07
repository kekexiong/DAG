package com.demo.entity;

import java.util.List;

/**
 * @program: spring-boot-demo
 * @description:
 * @author: hu_pf@suixingpay.com
 * @create: 2018-03-01 16:32
 **/
public class ParameVo {
    private List<TBapInterPara> datas;
    private String uuid;
    private String level;

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }

    public List<TBapInterPara> getDatas() {
        return datas;
    }

    public void setDatas(List<TBapInterPara> datas) {
        this.datas = datas;
    }


}
