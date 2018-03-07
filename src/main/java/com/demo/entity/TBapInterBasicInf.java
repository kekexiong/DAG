package com.demo.entity;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

/**
 * @description  TBapInterBasicInfdomain
 * @author hu_pf@suixingpay.com
 * @date   20180301 14:43:14
 * @review hu_pf@suixingpay.com/2018-03-01
 */
public class TBapInterBasicInf {
	/**
	 * UUID
	 */
		private String uuid;
	
	/**
	 * 接口名称
	 */
		private String interNm;
	
	/**
	 * 接口描述
	 */
		private String interDesc;
	
	/**
	 * 接口概述
	 */
		private String interSummary;
	
	/**
	 * 接口方法名
	 */
		private String interMethodNm;
	
	/**
	 * 接口方法名描述
	 */
		private String interMethodNmDesc;
	
	/**
	 * 接口类名
	 */
		private String interClassNm;
	
	/**
	 * 接口类名描述
	 */
		private String interClassNmDesc;
	
	/**
	 * 传入参数
	 */
		private String transParame;
	
	/**
	 * 传出参数
	 */
		private String outParame;
	
	/**
	 * 输入说明
	 */
		private String inExplain;
	
	/**
	 * 响应说明
	 */
		private String outExplain;
	
	
	public TBapInterBasicInf() {
		super();
	}
	
	/**
	 * get UUID
	 */
		public String getUuid() {
			return uuid;
		}
	
	/**
	 * set UUID
	 */
		public void setUuid(String uuid) {
			this.uuid = uuid;
		}
	 
	/**
	 * get 接口名称
	 */
		public String getInterNm() {
			return interNm;
		}
	
	/**
	 * set 接口名称
	 */
		public void setInterNm(String interNm) {
			this.interNm = interNm;
		}
	 
	/**
	 * get 接口描述
	 */
		public String getInterDesc() {
			return interDesc;
		}
	
	/**
	 * set 接口描述
	 */
		public void setInterDesc(String interDesc) {
			this.interDesc = interDesc;
		}
	 
	/**
	 * get 接口概述
	 */
		public String getInterSummary() {
			return interSummary;
		}
	
	/**
	 * set 接口概述
	 */
		public void setInterSummary(String interSummary) {
			this.interSummary = interSummary;
		}
	 
	/**
	 * get 接口方法名
	 */
		public String getInterMethodNm() {
			return interMethodNm;
		}
	
	/**
	 * set 接口方法名
	 */
		public void setInterMethodNm(String interMethodNm) {
			this.interMethodNm = interMethodNm;
		}
	 
	/**
	 * get 接口方法名描述
	 */
		public String getInterMethodNmDesc() {
			return interMethodNmDesc;
		}
	
	/**
	 * set 接口方法名描述
	 */
		public void setInterMethodNmDesc(String interMethodNmDesc) {
			this.interMethodNmDesc = interMethodNmDesc;
		}
	 
	/**
	 * get 接口类名
	 */
		public String getInterClassNm() {
			return interClassNm;
		}
	
	/**
	 * set 接口类名
	 */
		public void setInterClassNm(String interClassNm) {
			this.interClassNm = interClassNm;
		}
	 
	/**
	 * get 接口类名描述
	 */
		public String getInterClassNmDesc() {
			return interClassNmDesc;
		}
	
	/**
	 * set 接口类名描述
	 */
		public void setInterClassNmDesc(String interClassNmDesc) {
			this.interClassNmDesc = interClassNmDesc;
		}
	 
	/**
	 * get 传入参数
	 */
		public String getTransParame() {
			return transParame;
		}
	
	/**
	 * set 传入参数
	 */
		public void setTransParame(String transParame) {
			this.transParame = transParame;
		}
	 
	/**
	 * get 传出参数
	 */
		public String getOutParame() {
			return outParame;
		}
	
	/**
	 * set 传出参数
	 */
		public void setOutParame(String outParame) {
			this.outParame = outParame;
		}
	 
	/**
	 * get 输入说明
	 */
		public String getInExplain() {
			return inExplain;
		}
	
	/**
	 * set 输入说明
	 */
		public void setInExplain(String inExplain) {
			this.inExplain = inExplain;
		}
	 
	/**
	 * get 响应说明
	 */
		public String getOutExplain() {
			return outExplain;
		}
	
	/**
	 * set 响应说明
	 */
		public void setOutExplain(String outExplain) {
			this.outExplain = outExplain;
		}
	 
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this,
				ToStringStyle.SHORT_PREFIX_STYLE);
	}
}
