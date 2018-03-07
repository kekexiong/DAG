package com.demo.controller;

import com.demo.entity.ParameVo;
import com.demo.entity.TBapInterBasicInf;
import com.demo.entity.TBapInterPara;
import com.demo.service.TBapInterBasicInfService;
import com.demo.util.CreateUUID;
import com.demo.util.FreemarkerUtil;
import com.google.gson.Gson;
import com.lemon.core.constants.ConstantsBase;
import com.lemon.core.constants.LogType;

import com.lemon.utils.LogUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @description  接口信息控制层
 * @author hu_pf@suixingpay.com
 * @date   20180301 14:43:14
 */
@Controller
@RequestMapping("/ses/tBapInterBasicInf")
public class TBapInterBasicInfController extends BaseController {

	@Autowired
	private TBapInterBasicInfService tBapInterBasicInfService;
	static final Logger LOGGER = LoggerFactory.getLogger(TBapInterBasicInfController.class);
	
	/**
	 * @description: 信息查询
	 * @param session
	 * @param start
	 * @param limit
	 * @param paramVo
	 * @return map
	 * @author hu_pf@suixingpay.com
	 * @date 20180301 14:43:14
	 */
	@RequestMapping(value ="/query", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> queryCondition(HttpSession session,
			@RequestParam(value = "start", defaultValue = ConstantsBase.START) int start,
			@RequestParam(value = "limit", defaultValue = ConstantsBase.LIMIT) int limit,
			@ModelAttribute TBapInterBasicInf tBapInterBasicInf) {
		String tcd = "TBapInterBasicInfController.queryCondition";
		String opNm = "接口信息-查询";
			try {
				LOGGER.info(LogUtils.genLogs(LogType.BAP, tcd, "", opNm + "--begin"));
				Map<String, Object> map = setParams(start, limit);
				map.put("tBapInterBasicInf", tBapInterBasicInf);
				session.setAttribute("queryMecTOneAcRateParam", map);
				List<Map<String, Object>> list = tBapInterBasicInfService.findByCondition(map);
				int count = tBapInterBasicInfService.findByConditionCount(map);
				LOGGER.info(LogUtils.genLogs(LogType.BAP, tcd, "", opNm + "--end"));
				return setResult(list, count);
			} catch (Exception e) {
				LOGGER.error(LogUtils.genLogs(LogType.BAP, tcd, "", opNm + "--end,异常" + e.getMessage()));
				return setFailure("查询失败");
			}
	}
	
	/**
	 * 根据主键取得详细
	 * @param session
	 * @param paramVo
	 * @return map
	 * @author hu_pf@suixingpay.com
	 * @date 20180301 14:43:14
	 */
	@RequestMapping(value = "/generate", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> generateDoc(HttpSession session, @ModelAttribute TBapInterBasicInf paramVo) {
		String tcd = "TBapInterBasicInfController.queryCondition";
		String opNm = "接口信息-详细";
			try {
//
				Map<String, Object> root = new HashMap<String, Object>();
				TBapInterBasicInf detail= tBapInterBasicInfService.getByKey(paramVo);
				FreemarkerUtil util = new FreemarkerUtil();
				List<Map<String,Object>> paraInList =tBapInterBasicInfService.selectParaByUuid(detail.getTransParame());
				List<Map<String,Object>> paraInList2=null;
				List<Map<String,Object>> paraInList3=null;
				List<Map<String,Object>> paraOutList =tBapInterBasicInfService.selectParaByUuid(detail.getOutParame());
				root.put("doc",detail);
				root.put("paraInList",paraInList);
				root.put("paraOutList",paraOutList);
				for (Map<String,Object> level2Map:paraInList){
					if ("Object".equals(level2Map.get("fieldTyp"))){
						paraInList2=tBapInterBasicInfService.selectParaByUuid((String) level2Map.get("levelUuid"));
						for (Map<String,Object> level3Map:paraInList2){
							if ("Object".equals(level3Map.get("fieldTyp"))){
								paraInList3=tBapInterBasicInfService.selectParaByUuid((String) level3Map.get("levelUuid"));
							}
						}
					}
				}
				if (paraInList2!=null){
					root.put("level","2");
					root.put("paraInList2",paraInList2);
				}
				if (paraInList3!=null){
					root.put("level","3");
					root.put("paraInList3",paraInList3);
				}
				util.fprint("01.ftl", root, "01.doc");

				return super.setFailure("生成成功");
			} catch (Exception e) {
				LOGGER.error(LogUtils.genLogs(LogType.BAP, tcd, "", opNm + "--end,异常" + e.getMessage()));
				return super.setFailure("查询失败");
			}
	}
	
	/**
	 * 保存
	 * @param paramVo
	 * @return map
	 * @author hu_pf@suixingpay.com
	 * @date 20180301 14:43:14
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> save( @ModelAttribute TBapInterBasicInf tBapInterBasicInf) {
		String tcd = "TBapInterBasicInfController.save";
		String opNm = "接口信息-保存";
		try{
			LOGGER.info(LogUtils.genLogs(LogType.BAP, tcd, "", opNm + "--begin"));
				tBapInterBasicInf.setUuid(CreateUUID.GetRandomUUID());
//			Gson gson=new Gson();
//			ParameVo parameVo=new ParameVo();
//			parameVo=gson.fromJson(tBapInterBasicInf.getTransParame(),ParameVo.class);
			int num = tBapInterBasicInfService.insert(tBapInterBasicInf);
			if(num>0){
				return super.setSuccess("保存成功!");
			}
			LOGGER.info(LogUtils.genLogs(LogType.BAP, tcd, "", opNm + "--end"));
			return super.setFailure("保存成功0条!");
			
		}catch(Exception e){
			LOGGER.error(LogUtils.genLogs(LogType.BAP, tcd, "", opNm + "--end,异常" + e.getMessage()));
			return super.setFailure("保存失败!");
		}
	}
	
	/**
	 * 更新
	 * @param paramVo
	 * @return map
	 * @author hu_pf@suixingpay.com
	 * @date 20180301 14:43:14
	 */
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> udpate( @ModelAttribute TBapInterBasicInf paramVo) {
		String tcd = "TBapInterBasicInfController.save";
		String opNm = "接口信息-更新";
		try{
			LOGGER.info(LogUtils.genLogs(LogType.BAP, tcd, "", opNm + "--begin"));
			int num = tBapInterBasicInfService.update(paramVo);
			if(num>0){
				return super.setSuccess("更新成功!");
			}
			LOGGER.info(LogUtils.genLogs(LogType.BAP, tcd, "", opNm + "--end"));
			return super.setFailure("更新成功0条!");
		}catch(Exception e){
			LOGGER.error(LogUtils.genLogs(LogType.BAP, tcd, "", opNm + "--end,异常" + e.getMessage()));
			return super.setFailure("更新失败!");
		}
	}

	/**
	 * 根据主键删除
	 * @param session
	 * @param paramVo
	 * @return map
	 * @author hu_pf@suixingpay.com
	 * @date 20180301 14:43:14
	 */
	@RequestMapping(value = "/deleteByUuid", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteByUuid(HttpSession session, @RequestParam(value = "uuids") String uuids) {
		String tcd = "TBapInterBasicInfController.deleteByUuid";
		String opNm = "接口信息-删除";
		if(uuids==null|| "".equals(uuids)){
			return super.setFailure("错误：付款单号参数为空");
		}
		// 参数map
		Map<String, Object> paramsMap = new HashMap<String, Object>();
		paramsMap.put("uuids", uuids.split(","));//付款单号数组
		try{
			LOGGER.info(LogUtils.genLogs(LogType.BAP, tcd, "", opNm + "--begin"));
			int num = tBapInterBasicInfService.delete(paramsMap);
			if(num>0){
				return super.setSuccess("删除成功!");
			}
			LOGGER.info(LogUtils.genLogs(LogType.BAP, tcd, "", opNm + "--end"));
			return super.setFailure("删除成功0条!");
			
		}catch(Exception e){
			LOGGER.error(LogUtils.genLogs(LogType.BAP, tcd, "", opNm + "--end,异常" + e.getMessage()));
			return super.setFailure("删除失败!");
		}
	}

	@RequestMapping(value = "/paraIn",method = RequestMethod.POST)
	@ResponseBody
	public String dealInf(@ModelAttribute ParameVo allotTimingDatas){
		String s="s";
		return "1";
	}
}