# 资金组${doc.interNm?default("")}文档

##1. 接口描述


${doc.interDesc?default("")}
##2. 接口概述

${doc.interSummary?default("")}

|项目|内容|说明|
|----|----|---|
|接口方法名|${doc.interMethodNm?default("")}|${doc.interMethodNmDesc?default("")}|
|接口类|${doc.interClassNm?default("")}|${doc.interClassNmDesc?default("")}|
|接口参数|${doc.transParame?default("")}|${doc.inExplain?default("")}|
|响应业务参数类型|${doc.outParame?default("")}|${doc.outExplain?default("")}|

##3. 输入说明

### 3.1 通用参数说明

${doc.inExplain?default("")}

|字段名称|类型|输入项|备注|
|----|----|---|----|
<#list paraInList as lender>
|${lender.fieldNm!""}|${lender.fieldTyp!""}|${lender.required!""}|${lender.remarks!""}|
</#list>

---------

<#if level=="2">
|字段名称|类型|输入项|备注|
|----|----|---|----|
<#list paraInList2 as lender>
|${lender.fieldNm!""}|${lender.fieldTyp!""}|${lender.required!""}|${lender.remarks!""}|
</#list>
</#if>

<#if level=="3">
|字段名称|类型|输入项|备注|
|----|----|---|----|
<#list paraInList2 as lender>
|${lender.fieldNm!""}|${lender.fieldTyp!""}|${lender.required!""}|${lender.remarks!""}|
</#list>

    ----------

|字段名称|类型|输入项|备注|
|----|----|---|----|
<#list paraInList3 as lender>
|${lender.fieldNm!""}|${lender.fieldTyp!""}|${lender.required!""}|${lender.remarks!""}|
</#list>

</#if>
