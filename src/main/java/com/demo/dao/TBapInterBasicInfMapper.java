package com.demo.dao;


import com.demo.entity.TBapInterBasicInf;
import com.demo.entity.TBapInterPara;

import java.util.List;
import java.util.Map;

/**
 * @title  TBapInterBasicInfMapper
 * @author hu_pf@suixingpay.com
 * @date   20180301 14:43:14
 */
public interface TBapInterBasicInfMapper {
	
	/**
	 * 根据条件查询
	 * @author hu_pf@suixingpay.com
 	 * @date   20180301 14:43:14
	 * @param map
	 * @return
	 */
	 List<Map<String, Object>> findByCondition(Map<String, Object> map);
	/**
	 * 根据条件查询总数
	 * @author hu_pf@suixingpay.com
 	 * @date   20180301 14:43:14
	 * @param map
	 * @return
	 */
	 int findByConditionCount(Map<String, Object> map);
	/**
	 * 根据主键查询详细
	 * @author hu_pf@suixingpay.com
 	 * @date   20180301 14:43:14
	 * @param uuid
	 * @return
	 */
	 TBapInterBasicInf getByKey(TBapInterBasicInf paramVo);

	/**
	 * 更新
	 * @author hu_pf@suixingpay.com
 	 * @date   20180301 14:43:14
	 * @param tSesErrorLog
	 * @return
	 */
	 int update(TBapInterBasicInf tBapInterBasicInf);

	/**
	 * 插入
	 * @author hu_pf@suixingpay.com
 	 * @date   20180301 14:43:14
	 * @param tSesErrorLog
	 * @return
	 */	 int insert(TBapInterBasicInf tBapInterBasicInf);

	/**
	 * 根据主键删除
	 * @author hu_pf@suixingpay.com
 	 * @date   20180301 14:43:14
	 * @param uuid
	 * @return
	 */
	 int delete(Map<String, Object> map);

	 int insertPara(TBapInterPara tBapInterPara);

	 List<Map<String,Object>> selectParaByUuid(String uuid);

	 int deletePara(Map<String, Object> map);

	/**
	 * 将响应码插入数据库中
	 * @author fan_rc@suixingpay.com
	 * @date   20180402 14:43:14
	 * @param map
	 * @return
	 */
	int insertCodeMessage(Map<String, Object> map);

	List<Map<String,Object>> selectCodeMessByUuid(String uuid);
}