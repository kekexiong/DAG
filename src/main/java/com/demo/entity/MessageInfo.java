package com.demo.entity;

import java.util.List;

public class MessageInfo {

    private List<MessageData> messDatas;

    private String oldUuid;

    public List<MessageData> getMessDatas() {
        return messDatas;
    }

    public void setMessDatas(List<MessageData> messDatas) {
        this.messDatas = messDatas;
    }

    public String getOldUuid() {
        return oldUuid;
    }

    public void setOldUuid(String oldUuid) {
        this.oldUuid = oldUuid;
    }

    @Override
    public String toString() {
        return super.toString();
    }
}
