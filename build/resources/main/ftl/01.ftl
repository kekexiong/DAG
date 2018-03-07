<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>测试</title>
</head>

<body>
                                    <h1 align="center" width="50%">资金组${doc.interNm?default("")}文档</h1>
<h2> 1 接口描述</h2>
<span>${doc.interDesc?default("")}</span>
<h2>2 接口概述</h2>
<span>${doc.interSummary?default("")}</span>
                                    <table border="1">
                                        <tr>
                                            <th style="font-family: 黑体" bgcolor="#f5f5dc" width="30%">项目</th>
                                            <td style="font-family: 黑体" bgcolor="#f5f5dc" width="30%">内容</td>
                                            <td style="font-family: 黑体" bgcolor="#f5f5dc" width="40%">说明</td>
                                        <#--<th>接口方法名</th>-->
                                        <#--<th>接口类</th>-->
                                        <#--<th>输入业务参数类型</th>-->
                                        <#--<th>接口参数</th>-->
                                        <#--<th>响应业务参数类型</th>-->
                                        <#--<th>返回值</th>-->
                                        </tr>
                                        <tr>
                                            <td>接口方法名</td>
                                            <td>${doc.interMethodNm?default("")}</td>
                                            <td>${doc.interMethodNmDesc?default("")}</td>
                                        <#--<td>$100</td>-->
                                        <#--<td>$100</td>-->
                                        <#--<td>$100</td>-->
                                        <#--<td>$100</td>-->
                                        </tr>
                                        <tr>
                                            <td>接口类</td>
                                            <td>${doc.interClassNm?default("")}</td>
                                            <td>${doc.interClassNmDesc?default("")}</td>
                                        <#--<td>$100</td>-->
                                        <#--<td>$100</td>-->
                                        <#--<td>$100</td>-->
                                        <#--<td>$100</td>-->
                                        </tr>
                                        <tr>
                                            <td>输入业务参数类型</td>
                                            <td>1</td>
                                            <td>$100</td>
                                        <#--<td>$100</td>-->
                                        <#--<td>$100</td>-->
                                        <#--<td>$100</td>-->
                                        <#--<td>$100</td>-->
                                        </tr>
                                        <tr>
                                            <td>接口参数</td>
                                            <td>${doc.transParame?default("")}</td>
                                            <td>${doc.inExplain?default("")}</td>
                                        <#--<td>$100</td>-->
                                        <#--<td>$100</td>-->
                                        <#--<td>$100</td>-->
                                        <#--<td>$100</td>-->
                                        </tr>
                                        <tr>
                                            <td>响应业务参数类型</td>
                                            <td>${doc.outParame?default("")}</td>
                                            <td>${doc.outExplain?default("")}</td>
                                        <#--<td>$100</td>-->
                                        <#--<td>$100</td>-->
                                        <#--<td>$100</td>-->
                                        <#--<td>$100</td>-->
                                        </tr>
                                        <tr>
                                            <td>返回值</td>
                                            <td>1</td>
                                            <td>$100</td>
                                        <#--<td>$100</td>-->
                                        <#--<td>$100</td>-->
                                        <#--<td>$100</td>-->
                                        <#--<td>$100</td>-->
                                        </tr>
                                    </table>
<h2>3 输入说明</h2>
                                    <h3>3.1 通用参数说明</h3>
<span>${doc.inExplain?default("")}</span>
                                    <table border="1">
                                        <tr>
                                            <th style="font-family: 黑体" bgcolor="#f5f5dc" width="25%">字段名称</th>
                                            <td style="font-family: 黑体" bgcolor="#f5f5dc" width="25%">类型</td>
                                            <td style="font-family: 黑体" bgcolor="#f5f5dc" width="25%">输入项</td>
                                            <td style="font-family: 黑体" bgcolor="#f5f5dc" width="25%">备注</td>

                                        </tr>
                                    <#list paraInList as lender>
                                    <tr>
                                        <td>${lender.fieldNm!""}</td>
                                        <td>${lender.fieldTyp!""}</td>
                                        <td>${lender.required!""}</td>
                                        <td>${lender.remarks!""}</td>
                                    </tr>
                                    </#list>
                                    </table>

                                    <#if level=="2">
                                    <table border="1">
                                        <tr>
                                            <th style="font-family: 黑体" bgcolor="#f5f5dc" width="25%">字段名称</th>
                                            <td style="font-family: 黑体" bgcolor="#f5f5dc" width="25%">类型</td>
                                            <td style="font-family: 黑体" bgcolor="#f5f5dc" width="25%">输入项</td>
                                            <td style="font-family: 黑体" bgcolor="#f5f5dc" width="25%">备注</td>

                                        </tr>
                                        <#list paraInList2 as lender>
                                            <tr>
                                                <td>${lender.fieldNm!""}</td>
                                                <td>${lender.fieldTyp!""}</td>
                                                <td>${lender.required!""}</td>
                                                <td>${lender.remarks!""}</td>
                                            </tr>
                                        </#list>
                                    </table>
                                    </#if>

                                    <#if level=="3">
                                    <table border="1">
                                        <tr>
                                            <th style="font-family: 黑体" bgcolor="#f5f5dc" width="25%">字段名称</th>
                                            <td style="font-family: 黑体" bgcolor="#f5f5dc" width="25%">类型</td>
                                            <td style="font-family: 黑体" bgcolor="#f5f5dc" width="25%">输入项</td>
                                            <td style="font-family: 黑体" bgcolor="#f5f5dc" width="25%">备注</td>

                                        </tr>
                                        <#list paraInList2 as lender>
                                            <tr>
                                                <td>${lender.fieldNm!""}</td>
                                                <td>${lender.fieldTyp!""}</td>
                                                <td>${lender.required!""}</td>
                                                <td>${lender.remarks!""}</td>
                                            </tr>
                                        </#list>
                                    </table>

                                    <table border="1">
                                        <tr>
                                            <th style="font-family: 黑体" bgcolor="#f5f5dc" width="25%">字段名称</th>
                                            <td style="font-family: 黑体" bgcolor="#f5f5dc" width="25%">类型</td>
                                            <td style="font-family: 黑体" bgcolor="#f5f5dc" width="25%">输入项</td>
                                            <td style="font-family: 黑体" bgcolor="#f5f5dc" width="25%">备注</td>

                                        </tr>
                                        <#list paraInList3 as lender>
                                            <tr>
                                                <td>${lender.fieldNm!""}</td>
                                                <td>${lender.fieldTyp!""}</td>
                                                <td>${lender.required!""}</td>
                                                <td>${lender.remarks!""}</td>
                                            </tr>
                                        </#list>
                                    </table>
                                    </#if>

                                    <h2>4 响应说明</h2>
                                    <h3>4.1 响应参数说明</h3>
                                    <span>${doc.outExplain?default("")}</span>

                                    <table border="1">
                                        <tr>
                                            <th style="font-family: 黑体" bgcolor="#f5f5dc" width="25%">字段名称</th>
                                            <td style="font-family: 黑体" bgcolor="#f5f5dc" width="25%">类型</td>
                                            <td style="font-family: 黑体" bgcolor="#f5f5dc" width="25%">输入项</td>
                                            <td style="font-family: 黑体" bgcolor="#f5f5dc" width="25%">备注</td>

                                        </tr>
                                    <#list paraOutList as lender>
                                        <tr>
                                            <td>${lender.fieldNm!""}</td>
                                            <td>${lender.fieldTyp!""}</td>
                                            <td>${lender.required!""}</td>
                                            <td>${lender.remarks!""}</td>
                                        </tr>
                                    </#list>
                                    </table>

                                    <h2>5 响应码说明</h2>



</body>
</html>