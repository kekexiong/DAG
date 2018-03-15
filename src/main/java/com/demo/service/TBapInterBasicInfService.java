package com.demo.service;

import com.demo.dao.TBapInterBasicInfMapper;
import com.demo.entity.ParameVo;
import com.demo.entity.TBapInterBasicInf;
import com.demo.entity.TBapInterPara;
import com.demo.util.CreateUUID;
import com.demo.util.FreemarkerUtil;
import com.google.gson.Gson;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * @author hu_pf@suixingpay.com
 * @title TBapInterBasicInfService
 * @date 20180301 14:43:14
 */
@Service
public class TBapInterBasicInfService {

    private static final Logger LOGGER = LoggerFactory.getLogger(TBapInterBasicInfService.class);

    @Autowired
    private TBapInterBasicInfMapper tBapInterBasicInfMapper;

    /**
     * 根据条件查询
     *
     * @param map
     * @return
     * @author hu_pf@suixingpay.com
     * @date 20180301 14:43:14
     */
    public List<Map<String, Object>> findByCondition(Map<String, Object> map) {
        return tBapInterBasicInfMapper.findByCondition(map);
    }

    /**
     * 根据条件查询总数
     *
     * @param map
     * @return
     * @author hu_pf@suixingpay.com
     * @date 20180301 14:43:14
     */
    public int findByConditionCount(Map<String, Object> map) {
        return tBapInterBasicInfMapper.findByConditionCount(map);
    }

    /**
     * 根据主键查询详细
     *
     * @param paramVo
     * @return
     * @author hu_pf@suixingpay.com
     * @date 20180301 14:43:14
     */
    public TBapInterBasicInf getByKey(TBapInterBasicInf paramVo) {
        return tBapInterBasicInfMapper.getByKey(paramVo);
    }

    /**
     * 更新
     *
     * @param tBapInterBasicInf
     * @return
     * @author hu_pf@suixingpay.com
     * @date 20180301 14:43:14
     */
    public int update(TBapInterBasicInf tBapInterBasicInf) {
        return tBapInterBasicInfMapper.update(tBapInterBasicInf);
    }

    /**
     * 插入
     *
     * @param tBapInterBasicInf
     * @return
     * @author hu_pf@suixingpay.com
     * @date 20180301 14:43:14
     */
    public int insert(TBapInterBasicInf tBapInterBasicInf) {
        Gson gson = new Gson();
        ParameVo parameVo = new ParameVo();
        ParameVo parameVoOut = new ParameVo();
        String[] paraArray = tBapInterBasicInf.getTransParame().split("@@");
        String[] paraArrayOut = tBapInterBasicInf.getOutParame().split("@@");
        if (!"undefined".equals(paraArray[0])){
            parameVo = gson.fromJson(paraArray[0], ParameVo.class);
            this.inserMethod(parameVo, paraArray);
        }
        if (!"undefined".equals(paraArray[0])){
            parameVoOut = gson.fromJson(paraArrayOut[0], ParameVo.class);
            this.inserMethod(parameVoOut, paraArrayOut);
        }
        tBapInterBasicInf.setTransParame(parameVo.getUuid());
        tBapInterBasicInf.setOutParame(parameVoOut.getUuid());
        return tBapInterBasicInfMapper.insert(tBapInterBasicInf);
    }

    public void inserMethod(ParameVo parameVo, String[] paraArray) {
        Gson gson = new Gson();
        for (TBapInterPara tBapInterPara : parameVo.getDatas()) {
            String uuid = CreateUUID.GetRandomUUID();
            String levelUuid = CreateUUID.GetRandomUUID();
            tBapInterPara.setUuid(uuid);
            tBapInterPara.setInfoUuid(parameVo.getUuid());
            tBapInterPara.setLevelPara(parameVo.getLevel());
            if ("Object".equals(tBapInterPara.getFieldTyp())&&!"undefined".equals(paraArray[1])) {
                tBapInterPara.setLevelUuid(levelUuid);
                ParameVo parameVo2 = gson.fromJson(paraArray[1], ParameVo.class);
                for (TBapInterPara tBapInterPara2 : parameVo2.getDatas()) {
                    String uuid2 = CreateUUID.GetRandomUUID();
                    String levelUuid2 = CreateUUID.GetRandomUUID();
                    tBapInterPara2.setInfoUuid(levelUuid);
                    tBapInterPara2.setUuid(uuid2);
                    tBapInterPara2.setLevelPara(parameVo2.getLevel());
                    if ("Object".equals(tBapInterPara2.getFieldTyp())&&!"undefined".equals(paraArray[2])) {
                        tBapInterPara2.setLevelUuid(levelUuid2);
                        ParameVo parameVo3 = gson.fromJson(paraArray[2], ParameVo.class);
                        for (TBapInterPara tBapInterPara3 : parameVo3.getDatas()) {
                            String uuid3 = CreateUUID.GetRandomUUID();
                            tBapInterPara3.setInfoUuid(levelUuid2);
                            tBapInterPara3.setUuid(uuid3);
                            tBapInterPara3.setLevelPara(parameVo3.getLevel());
                            tBapInterBasicInfMapper.insertPara(tBapInterPara3);
                        }
                    }
                    tBapInterBasicInfMapper.insertPara(tBapInterPara2);
                }
            }
            tBapInterBasicInfMapper.insertPara(tBapInterPara);
        }
    }

    /**
     * @param paramVo
     * @return java.util.Map<java.lang.String,java.lang.Object>
     * @Description: 生成模板数据
     * @author hu_pf@suixingpay.com
     * @date 2018/3/8 10:36
     */
    public Map<String, Object> generatePara(TBapInterBasicInf paramVo) {
        TBapInterBasicInf detail = this.getByKey(paramVo);
        Map<String, Object> root = this.conmonMethod(detail.getTransParame(), "in");
        Map<String, Object> rootOut = this.conmonMethod(detail.getOutParame(), "out");
        root.putAll(rootOut);
        root.put("doc", detail);
        return root;
    }

    /**
     * @param paraUuid, flag
     * @return java.util.Map<java.lang.String,java.lang.Object>
     * @Description: generatePara方法抽出的公共方法
     * @author hu_pf@suixingpay.com
     * @date 2018/3/8 10:36
     */
    public Map<String, Object> conmonMethod(String paraUuid, String flag) {
        List<Map<String, Object>> paraInList2 = null;
        List<Map<String, Object>> paraInList3 = null;
        Map<String, Object> root = new HashMap<String, Object>();
        String tempList = "";
        String tempList2 = "";
        String tempList3 = "";
        String myLevel = "";
        if ("in".equals(flag)) {
            myLevel = "levelIn";
            tempList = "paraInList";
            tempList2 = "paraInList2";
            tempList3 = "paraInList3";
        } else {
            myLevel = "levelOut";
            tempList = "paraOutList";
            tempList2 = "paraOutList2";
            tempList3 = "paraOutList3";
        }

        List<Map<String, Object>> paraInList = this.selectParaByUuid(paraUuid);
        root.put(tempList, paraInList);
        root.put(myLevel, "1");
        for (Map<String, Object> level2Map : paraInList) {
            if ("Object".equals(level2Map.get("fieldTyp"))) {
                paraInList2 = this.selectParaByUuid((String) level2Map.get("levelUuid"));
                for (Map<String, Object> level3Map : paraInList2) {
                    if ("Object".equals(level3Map.get("fieldTyp"))) {
                        paraInList3 = this.selectParaByUuid((String) level3Map.get("levelUuid"));
                    }
                }
            }
        }

        if (paraInList2 != null) {
            root.put(myLevel, "2");
            root.put(tempList2, paraInList2);
        }
        if (paraInList3 != null) {
            root.put(myLevel, "3");
            root.put(tempList3, paraInList3);
        }
        return root;

    }

    /**
     * 根据主键删除
     *
     * @param map
     * @return
     * @author hu_pf@suixingpay.com
     * @date 20180301 14:43:14
     */
    public int delete(Map<String, Object> map) {
        String deleteIn=this.getDeleteUuids("in",map);
        String deleteOut=this.getDeleteUuids("out",map);
        String deletePara=deleteIn+","+deleteOut;
        if (!",".equals(deletePara)){
            Map<String, Object> paramsMap = new HashMap<String, Object>();
            paramsMap.put("paraUuids", deletePara.split(","));
            tBapInterBasicInfMapper.deletePara(paramsMap);
        }
        return tBapInterBasicInfMapper.delete(map);
    }

    public String getDeleteUuids(String flag,Map<String, Object> map){
        String [] uuids= (String[]) map.get("uuids");
        TBapInterBasicInf tBapInterBasicInf=new TBapInterBasicInf();
        StringBuffer paraUuids= new StringBuffer();
        String queryCon="";
        for (int i=0;i<uuids.length;i++){
            tBapInterBasicInf.setUuid(uuids[i]);
            TBapInterBasicInf resultEntity = this.getByKey(tBapInterBasicInf);
            if ("in".equals(flag)){
                queryCon=resultEntity.getTransParame();
            }
            else {
                queryCon=resultEntity.getOutParame();
            }
            if (queryCon!=""&&queryCon!=null){
                if (i==0){
                    paraUuids.append(queryCon);
                }else {
                    paraUuids.append(","+queryCon);
                }

                List<Map<String, Object>> paraList=this.selectParaByUuid(queryCon);
                for (Map<String, Object> paraMap:paraList){
                    if ("Object".equals(paraMap.get("fieldTyp"))){
                        paraUuids.append(","+paraMap.get("levelUuid"));
                        List<Map<String, Object>> paraList2=this.selectParaByUuid((String) paraMap.get("levelUuid"));
                        for (Map<String, Object> paraMap2:paraList2){
                            if ("Object".equals(paraMap2.get("fieldTyp"))){
                                paraUuids.append(","+paraMap2.get("levelUuid"));
                            }
                        }
                    }
                }
            }
        }
        return paraUuids.toString();
    }
    public List<Map<String, Object>> selectParaByUuid(String uuid) {
        return tBapInterBasicInfMapper.selectParaByUuid(uuid);
    }
}