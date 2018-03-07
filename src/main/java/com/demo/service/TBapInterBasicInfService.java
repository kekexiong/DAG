package com.demo.service;

import com.demo.dao.TBapInterBasicInfMapper;
import com.demo.entity.ParameVo;
import com.demo.entity.TBapInterBasicInf;
import com.demo.entity.TBapInterPara;
import com.demo.util.CreateUUID;
import com.google.gson.Gson;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;


/**
 * @title  TBapInterBasicInfService
 * @author hu_pf@suixingpay.com
 * @date   20180301 14:43:14
 */
 @Service
public class TBapInterBasicInfService {

	private static final Logger LOGGER = LoggerFactory.getLogger(TBapInterBasicInfService.class);
	
	@Autowired
	private TBapInterBasicInfMapper tBapInterBasicInfMapper;
	
	/**
	 * 根据条件查询
	 * @author hu_pf@suixingpay.com
 	 * @date   20180301 14:43:14
	 * @param map
	 * @return
	 */
	public List<Map<String, Object>> findByCondition(Map<String,Object> map) {
		return  tBapInterBasicInfMapper.findByCondition(map);
	}
	/**
	 * 根据条件查询总数
	 * @author hu_pf@suixingpay.com
 	 * @date   20180301 14:43:14
	 * @param map
	 * @return
	 */
	public int findByConditionCount(Map<String,Object> map) {
		return  tBapInterBasicInfMapper.findByConditionCount(map);
	}
	/**
	 * 根据主键查询详细
	 * @author hu_pf@suixingpay.com
 	 * @date   20180301 14:43:14
	 * @param uuid
	 * @return
	 */
	public TBapInterBasicInf getByKey(TBapInterBasicInf paramVo) {
		return  tBapInterBasicInfMapper.getByKey(paramVo);
	}
	
	/**
	 * 更新
	 * @author hu_pf@suixingpay.com
 	 * @date   20180301 14:43:14
	 * @param tSesErrorLog
	 * @return
	 */
	public int update(TBapInterBasicInf tBapInterBasicInf) {
		return  tBapInterBasicInfMapper.update(tBapInterBasicInf);
	}
	/**
	 * 插入
	 * @author hu_pf@suixingpay.com
 	 * @date   20180301 14:43:14
	 * @param tSesErrorLog
	 * @return
	 */
	public int insert(TBapInterBasicInf tBapInterBasicInf) {
		Gson gson=new Gson();
		ParameVo parameVo=new ParameVo();
		ParameVo parameVoOut=new ParameVo();
		String [] paraArray = tBapInterBasicInf.getTransParame().split("@@");
		parameVo=gson.fromJson(paraArray[0],ParameVo.class);
		parameVoOut=gson.fromJson(tBapInterBasicInf.getOutParame(),ParameVo.class);
		for(TBapInterPara tBapInterPara:parameVo.getDatas()){
			String uuid=CreateUUID.GetRandomUUID();
			String levelUuid=CreateUUID.GetRandomUUID();
			tBapInterPara.setUuid(uuid);
			tBapInterPara.setInfoUuid(parameVo.getUuid());
			tBapInterPara.setLevelPara(parameVo.getLevel());
			if ("Object".equals(tBapInterPara.getFieldTyp())){
				tBapInterPara.setLevelUuid(levelUuid);
				ParameVo parameVo2=gson.fromJson(paraArray[1],ParameVo.class);
				for(TBapInterPara tBapInterPara2:parameVo2.getDatas()){
					String uuid2=CreateUUID.GetRandomUUID();
					String levelUuid2=CreateUUID.GetRandomUUID();
					tBapInterPara2.setInfoUuid(levelUuid);
					tBapInterPara2.setUuid(uuid2);
					tBapInterPara2.setLevelPara(parameVo2.getLevel());
					if ("Object".equals(tBapInterPara2.getFieldTyp())){
						tBapInterPara2.setLevelUuid(levelUuid2);
						ParameVo parameVo3=gson.fromJson(paraArray[2],ParameVo.class);
						for(TBapInterPara tBapInterPara3:parameVo3.getDatas()){
							String uuid3=CreateUUID.GetRandomUUID();
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
		for(TBapInterPara tBapInterPara:parameVoOut.getDatas()){
			tBapInterPara.setUuid(CreateUUID.GetRandomUUID());
			tBapInterPara.setInfoUuid(parameVoOut.getUuid());
			tBapInterBasicInfMapper.insertPara(tBapInterPara);
		}
		tBapInterBasicInf.setTransParame(parameVo.getUuid());
		tBapInterBasicInf.setOutParame(parameVoOut.getUuid());
		return  tBapInterBasicInfMapper.insert(tBapInterBasicInf);
	}
	/**
	 * 根据主键删除
	 * @author hu_pf@suixingpay.com
 	 * @date   20180301 14:43:14
	 * @param uuid
	 * @return
	 */
	public int delete(Map<String,Object> map) {
		return  tBapInterBasicInfMapper.delete(map);
	}

	public List<Map<String,Object>> selectParaByUuid(String uuid){
		return tBapInterBasicInfMapper.selectParaByUuid(uuid);
	}
}