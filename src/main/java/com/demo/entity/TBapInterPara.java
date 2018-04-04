package com.demo.entity;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

/**
 * @description  TBapInterParadomain
 * @author hu_pf@suixingpay.com
 * @date   20180301 15:47:23
 * @review hu_pf@suixingpay.com/2018-03-01
 */
public class TBapInterPara {
	/**
	 * UUID
	 */
		private String uuid;
	
	/**
	 * 字段名称
	 */
		private String fieldNm;
	
	/**
	 * 字段类型
	 */
		private String fieldTyp;
	
	/**
	 * 是否要求输入
	 */
		private String required;
	
	/**
	 * 备注
	 */
		private String remarks;
	
	/**
	 * 等级
	 */
		private String levelPara;
	
	/**
	 * 信息表UUID
	 */
		private String infoUuid;

		private String levelUuid;

		private String description;

	public String getLevelUuid() {
		return levelUuid;
	}

	public void setLevelUuid(String levelUuid) {
		this.levelUuid = levelUuid;
	}

	public TBapInterPara() {
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
	 * get 字段名称
	 */
		public String getFieldNm() {
			return fieldNm;
		}
	
	/**
	 * set 字段名称
	 */
		public void setFieldNm(String fieldNm) {
			this.fieldNm = fieldNm;
		}
	 
	/**
	 * get 字段类型
	 */
		public String getFieldTyp() {
			return fieldTyp;
		}
	
	/**
	 * set 字段类型
	 */
		public void setFieldTyp(String fieldTyp) {
			this.fieldTyp = fieldTyp;
		}
	 
	/**
	 * get 是否要求输入
	 */
		public String getRequired() {
			return required;
		}
	
	/**
	 * set 是否要求输入
	 */
		public void setRequired(String required) {
			this.required = required;
		}
	 
	/**
	 * get 备注
	 */
		public String getRemarks() {
			return remarks;
		}
	
	/**
	 * set 备注
	 */
		public void setRemarks(String remarks) {
			this.remarks = remarks;
		}
	 
	/**
	 * get 等级
	 */
		public String getLevelPara() {
			return levelPara;
		}
	
	/**
	 * set 等级
	 */
		public void setLevelPara(String levelPara) {
			this.levelPara = levelPara;
		}
	 
	/**
	 * get 信息表UUID
	 */
		public String getInfoUuid() {
			return infoUuid;
		}
	
	/**
	 * set 信息表UUID
	 */
		public void setInfoUuid(String infoUuid) {
			this.infoUuid = infoUuid;
		}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this,
				ToStringStyle.SHORT_PREFIX_STYLE);
	}
}
