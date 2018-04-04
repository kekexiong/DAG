package com.demo.service;

import com.demo.dao.TBapInterBasicInfMapper;
import com.demo.entity.*;
import com.demo.util.CreateUUID;
import com.demo.util.FreemarkerUtil;
import com.google.gson.Gson;
import freemarker.ext.beans.HashAdapter;
import org.apache.commons.collections.map.HashedMap;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.mail.search.SearchTerm;
import java.util.*;


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

        //将响应码存入数据库中
        MessageInfo messageInfo = gson.fromJson(tBapInterBasicInf.getCodeMessageUuid(), MessageInfo.class);
        for(MessageData messageData : messageInfo.getMessDatas()) {
            Map<String, Object> messMap = new HashedMap();
            messMap.put("uuid", messageData.getUuid());
            messMap.put("code", messageData.getCode());
            messMap.put("message", messageData.getMessage());
            messMap.put("oldUuid", messageInfo.getOldUuid());
            tBapInterBasicInfMapper.insertCodeMessage(messMap);
        }

        String[] paraArray = tBapInterBasicInf.getTransParame().split("@@");
        String[] paraArrayOut = tBapInterBasicInf.getOutParame().split("@@");
        String inUuid = null;
        String outUuid = null;
        for(int i = 0; i < paraArray.length; i++){
            if(!"undefined".equals(paraArray[i])) {
                parameVo = gson.fromJson(paraArray[i], ParameVo.class);
                List<TBapInterPara> tBapInterParasList = parameVo.getDatas();
                for(TBapInterPara t : tBapInterParasList) {
                    if (i == 0) {
                        t.setInfoUuid(parameVo.getUuid());
                        inUuid = parameVo.getUuid();
                    }
                    t.setLevelPara(parameVo.getLevel());
                    t.setUuid(CreateUUID.GetRandomUUID());
                    tBapInterBasicInfMapper.insertPara(t);
                }
            }
        }
        for(int i = 0; i < paraArrayOut.length; i++) {
            if (!"undefined".equals(paraArrayOut[i])){
                parameVoOut = gson.fromJson(paraArrayOut[i], ParameVo.class);
                List<TBapInterPara> tBapInterParas = parameVoOut.getDatas();
                for(TBapInterPara t : tBapInterParas) {
                    if (i == 0) {
                        t.setInfoUuid(parameVoOut.getUuid());
                        outUuid = parameVoOut.getUuid();
                    }
                    t.setLevelPara(parameVoOut.getLevel());
                    t.setUuid(CreateUUID.GetRandomUUID());
                    tBapInterBasicInfMapper.insertPara(t);
                }
            }
        }
        /*if (!"undefined".equals(paraArray[0])){
            parameVo = gson.fromJson(paraArray[0], ParameVo.class);
            this.inserMethod(parameVo, paraArray);
        }*/
       /* if (!"undefined".equals(paraArray[0])){
            parameVoOut = gson.fromJson(paraArrayOut[0], ParameVo.class);
            this.inserMethod(parameVoOut, paraArrayOut);
        }*/
        tBapInterBasicInf.setTransParame(inUuid);
        tBapInterBasicInf.setOutParame(outUuid);
        tBapInterBasicInf.setCodeMessageUuid(messageInfo.getOldUuid());
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
                //tBapInterPara.setLevelUuid(levelUuid);
                ParameVo parameVo2 = gson.fromJson(paraArray[1], ParameVo.class);
                for (TBapInterPara tBapInterPara2 : parameVo2.getDatas()) {
                    String uuid2 = CreateUUID.GetRandomUUID();
                    String levelUuid2 = CreateUUID.GetRandomUUID();
                    //tBapInterPara2.setInfoUuid(levelUuid);
                    tBapInterPara2.setUuid(uuid2);
                    tBapInterPara2.setLevelPara(parameVo2.getLevel());
                    if ("Object".equals(tBapInterPara2.getFieldTyp())&&!"undefined".equals(paraArray[2])) {
                        //tBapInterPara2.setLevelUuid(levelUuid2);
                        ParameVo parameVo3 = gson.fromJson(paraArray[2], ParameVo.class);
                        for (TBapInterPara tBapInterPara3 : parameVo3.getDatas()) {
                            String uuid3 = CreateUUID.GetRandomUUID();
                            //tBapInterPara3.setInfoUuid(levelUuid2);
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
        root.put("codeFlag", "1");
        //从输入参数的说明字段中，获取其类型，并填入word中
        String inExplain = null;
        String[] inExplainArray = detail.getInExplain().split("[\\u4e00-\\u9fa5]");
        for(String s : inExplainArray) {
            if(s.contains("com.suixingpay")) {
                String[] classArray = s.split("\\.");
                inExplain = classArray[classArray.length-1].split("[^a-z^A-Z]")[0];
            }
        }
        detail.setTransParame(inExplain);

        //从输出参数导入说明字段中，获取其类型，并填入word中
        String outExplain = null;
        String[] outExplainArray = detail.getOutExplain().split("[\\u4e00-\\u9fa5]");
        for(String s : outExplainArray) {
            if(s.contains("com.suixingpay")) {
                String[] classArray = s.split("\\.");
                outExplain =classArray[classArray.length-1].split("[^a-z^A-Z]")[0];
            }
        }
        detail.setOutParame(outExplain);
        //响应信息
        root.put("responseCode", tBapInterBasicInfMapper.selectCodeMessByUuid(detail.getCodeMessageUuid()));
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
        String finalMap2 = "";
        String finalMap3 = "";
        String descOneL = "";
        String descTwoL = "";
        String classNameOneL = null;//用来存放一级实体类的类名
        String classNameTwoL = null;//用来存放二级实体类的类名
        int number2 = 0;
        int number3 = 0;
        Map<Integer, List<Map<String, Object>>> numMap2 = new HashedMap();
        Map<Integer, List<Map<String, Object>>> numMap3 = new HashedMap();
        if ("in".equals(flag)) {
            myLevel = "levelIn";
            tempList = "paraInList";
            tempList2 = "paraInList2";
            tempList3 = "paraInList3";
            finalMap2 = "numInMap2";
            finalMap3 = "numInMap3";
            descOneL = "descOneInL";
            descTwoL = "descTwoInL";
            classNameOneL = "classNameInOne";
            classNameTwoL = "classNameInTwo";
        } else {
            myLevel = "levelOut";
            tempList = "paraOutList";
            tempList2 = "paraOutList2";
            tempList3 = "paraOutList3";
            finalMap2 = "numOutMap2";
            finalMap3 = "numOutMap3";
            descOneL = "descOneOutL";
            descTwoL = "descTwoOutL";
            classNameOneL = "classNameOutOne";
            classNameTwoL = "classNameOutTwo";
        }

        List<Map<String, Object>> paraInList = this.selectParaByUuid(paraUuid);
        //从数据的描述中获取其实体类的类名，并写入文档中
        insertClassName(paraInList, classNameOneL);

        root.put(tempList, paraInList);
        root.put(myLevel, "1");
        for (Map<String, Object> level2Map : paraInList) {
            if ("Object".equals(level2Map.get("fieldTyp"))) {
                paraInList2 = this.selectParaByUuid((String) level2Map.get("levelUuid"));
                if(null != paraInList2) {
                    //从数据的描述中获取其实体类的类名，并写入文档中
                    insertClassName(paraInList2, classNameTwoL);

                    paraInList2.get(0).put(descOneL, level2Map.get("description"));
                    numMap2.put(number2, paraInList2);
                    number2++;
                }
                for (Map<String, Object> level3Map : paraInList2) {
                    if ("Object".equals(level3Map.get("fieldTyp"))) {
                        paraInList3 = this.selectParaByUuid((String) level3Map.get("levelUuid"));
                        if(null != paraInList3) {
                            paraInList3.get(0).put(descTwoL, level3Map.get("description"));
                            numMap3.put(number3, paraInList3);
                            number3++;
                        }
                    }
                }
            }
        }
        for(Map<String, Object> mapOne : paraInList) {
            //更新className
            updateObjectClassName(mapOne, classNameOneL);
        }
        if (paraInList2 != null) {
            for(Map<String, Object> mapTwo : paraInList2) {
                //更新className
                updateObjectClassName(mapTwo, classNameTwoL);
                //从备注中获取业务响应参数说明
                insertObjectResponseMess(mapTwo, flag, root);
            }
            root.put(myLevel, "2");
            root.put(tempList2, paraInList2);
            root.put(finalMap2, numMap2);
        }else {
            root.put("codeFlag", "1");
        }
        if (paraInList3 != null) {
            root.put(myLevel, "3");
            root.put(tempList3, paraInList3);
            root.put(finalMap3, numMap3);
        }
        return root;

    }

    /**
     *  从数据的描述中获取其实体类的类名，并写入文档中
     *
     * @param tempList
     * @param className
     * @author fan_rc@suixingpay.com
     * @date 20180402 14:43:14
     */
    public void insertClassName(List<Map<String, Object>> tempList, String className) {
        for(int i = 0; i < tempList.size(); i++) {
            if("Object".equals(tempList.get(i).get("fieldTyp"))) {
                String classNameTwo = null;
                String[] descTwo = tempList.get(i).get("description").toString().split("[\\u4e00-\\u9fa5]");
                for(String s : descTwo) {
                    if(s.contains("com.suixingpay")) {
                        String[] classArray = s.split("\\.");
                        classNameTwo = classArray[classArray.length-1].split("[^a-z^A-Z]")[0];
                    }
                }
                tempList.get(i).put(className, classNameTwo);//将类名存入map中
            }
        }
    }

    /**
     *  从备注中获取业务响应参数说明，并写入文档中
     *
     * @param tempMap
     * @param flag
     * @param root
     * @author fan_rc@suixingpay.com
     * @date 20180402 14:43:14
     */
    public void insertObjectResponseMess(Map<String, Object> tempMap, String flag,  Map<String, Object> root) {
        List<Map<String, Object>> codeList = new ArrayList<>();
        if(tempMap.get("fieldNm").toString().contains("Code") && "out".equals(flag)) {
            String remarks = tempMap.get("remarks").toString();
            if(null != remarks && !"".equals(remarks)) {
                String[] code = remarks.split("\\(|（");
                if(code.length >= 2) {
                    String[] remarkArray = code[1].split("\\)|）");
                    if(remarkArray.length == 1) {
                        String remark = remarkArray[0];
                        if(null != remark && !"".equals(remark)) {
                            String[] code2 = remark.split("(:|：)");
                            if(code2.length >= 2) {
                                List<String> list = new ArrayList<>();
                                for(int i = 0; i < code2.length; i++) {
                                    String[] codeTemp = code2[i].split(";|；");
                                    for(int j = 0; j < codeTemp.length; j++) {
                                        list.add(codeTemp[j]);
                                    }
                                }
                                for(int i = 0; i < list.size(); i = i + 2) {
                                    Map<String, Object> map = new HashedMap();
                                    map.put("code", list.get(i));
                                    map.put("message", list.get(i+1));
                                    codeList.add(map);
                                }
                                root.put("objectCodeMess", codeList);
                                root.put("codeMessObject", tempMap.get("fieldNm").toString());
                                root.put("codeFlag", "0");
                            }
                        }
                    }
                }
            }
        }
    }

    /**
     *  更新实体类的类型，并写入文档中
     *
     * @param TempMap
     * @param className
     * @author fan_rc@suixingpay.com
     * @date 20180402 14:43:14
     */
    public void updateObjectClassName(Map<String, Object> TempMap, String className) {
        if("Object".equals(TempMap.get("fieldTyp"))) {
            if(null != TempMap.get(className) && !"".equals(TempMap.get(className).toString().trim())) {
                TempMap.put("fieldTyp", TempMap.get(className));
            } else {
                TempMap.put("fieldTyp", "T");
            }
        }
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