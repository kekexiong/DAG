<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>测试</title>
</head>

<body>
                                    <h1 align="center" width="50%">资金组${doc.interNm?default("")}文档</h1>
<h2> 1 接口描述</h2>
<span style="font-family: 等线; font-size: 10pt">&emsp;&emsp;${doc.interDesc?default("")}</span>
<h2>2 接口概述</h2>
<span style="font-family: 等线; font-size: 10pt">&emsp;&emsp;${doc.interSummary?default("")}</span>
                                    <table border="1" cellspacing="0" cellpadding="0" style="margin-left: 35px">
                                        <tr>
                                            <th style="font-family: 等线; font-size: 10pt" bgcolor="#8DB3E2" width="30%">项目</th>
                                            <th style="font-family: 等线; font-size: 10pt" bgcolor="#8DB3E2" width="30%">内容</th>
                                            <th style="font-family: 等线; font-size: 10pt" bgcolor="#8DB3E2" width="40%">说明</th>
                                        </tr>
                                        <tr>
                                            <td style="font-family: 仿宋; font-size: 9pt" align="center">接口方法名</td>
                                            <td style="font-family: 仿宋; font-size: 9pt" align="center">${doc.interMethodNm?default("")}</td>
                                            <td style="font-family: 仿宋; font-size: 9pt" align="center">${doc.interMethodNmDesc?default("")}</td>
                                        </tr>
                                        <tr>
                                            <td style="font-family: 仿宋; font-size: 9pt" align="center">接口类</td>
                                            <td style="font-family: 仿宋; font-size: 9pt" align="center">${doc.interClassNm?default("")}</td>
                                            <td style="font-family: 仿宋; font-size: 9pt" align="center">${doc.interClassNmDesc?default("")}</td>
                                        </tr>
                                        <tr>
                                            <td style="font-family: 仿宋; font-size: 9pt" align="center">输入业务参数类型</td>
                                            <td style="font-family: 仿宋; font-size: 9pt" align="center">${doc.transParame?default("")}</td>
                                            <td style="font-family: 仿宋; font-size: 9pt" align="center">请求bean</td>
                                        </tr>
                                        <tr>
                                            <td style="font-family: 仿宋; font-size: 9pt" align="center">接口参数</td>
                                            <td style="font-family: 仿宋; font-size: 9pt" align="center">请参看输入说明</td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td style="font-family: 仿宋; font-size: 9pt" align="center">响应业务参数类型</td>
                                            <td style="font-family: 仿宋; font-size: 9pt" align="center">${doc.outParame?default("")}</td>
                                            <td style="font-family: 仿宋; font-size: 9pt" align="center">响应bean</td>
                                        </tr>
                                        <tr>
                                            <td style="font-family: 仿宋; font-size: 9pt" align="center">返回值</td>
                                            <td style="font-family: 仿宋; font-size: 9pt" align="center">请参看输出说明</td>
                                            <td></td>
                                        </tr>
                                    </table>
<h2>3 输入说明</h2>
                                    <h3>&emsp;&emsp;3.1 通用参数说明</h3>
<span style="font-family: 等线; font-size: 10pt">&emsp;&emsp;${doc.inExplain?default("")}</span>
                                    <table border="1" cellspacing="0" cellpadding="0" style="margin-left: 35px">
                                        <tr>
                                            <th style="font-family: 等线; font-size: 10pt" bgcolor="#8DB3E2" width="16%">字段名称</th>
                                            <th style="font-family: 等线; font-size: 10pt" bgcolor="#8DB3E2" width="17%">类型</th>
                                            <th style="font-family: 等线; font-size: 10pt" bgcolor="#8DB3E2" width="17%">必填项</th>
                                            <th style="font-family: 等线; font-size: 10pt" bgcolor="#8DB3E2" width="50%">备注</th>
                                        </tr>
                                    <#list paraInList as lender>
                                    <tr>
                                        <td style="font-family: 仿宋; font-size: 9pt" align="center">${lender.fieldNm!""}</td>
                                        <td style="font-family: 仿宋; font-size: 9pt" align="center">${lender.fieldTyp!""}</td>
                                        <td style="font-family: 仿宋; font-size: 9pt" align="center">${lender.required!""}</td>
                                        <td style="font-family: 仿宋; font-size: 9pt" align="center">${lender.remarks!""}</td>
                                    </tr>
                                    </#list>
                                    </table>

                                    <#if levelIn=="2">
                                    <h3>&emsp;&emsp;3.2 业务参数说明（object）</h3>
                                    <h4>&emsp;&emsp;二级参数</h4>
                                    <#list numInMap2?values as Map2>
                                        <#list Map2 as lender>
                                        <span style="font-family: 等线; font-size: 10pt">&emsp;&emsp;${lender.descOneInL!""}</span>
                                        </#list>
                                        <table border="1" cellspacing="0" cellpadding="0" style="margin-left: 35px">
                                            <tr>
                                                <th style="font-family: 等线; font-size: 10pt" bgcolor="#8DB3E2" width="16%">字段名称</th>
                                                <th style="font-family: 等线; font-size: 10pt" bgcolor="#8DB3E2" width="27%">类型</th>
                                                <th style="font-family: 等线; font-size: 10pt" bgcolor="#8DB3E2" width="17%">必填项</th>
                                                <th style="font-family: 等线; font-size: 10pt" bgcolor="#8DB3E2" width="50%">备注</th>
                                            </tr>
                                            <#list Map2 as lender>
                                                <tr>
                                                    <td style="font-family: 仿宋; font-size: 9pt" align="center">${lender.fieldNm!""}</td>
                                                    <td style="font-family: 仿宋; font-size: 9pt" align="center">${lender.fieldTyp!""}</td>
                                                    <td style="font-family: 仿宋; font-size: 9pt" align="center">${lender.required!""}</td>
                                                    <td style="font-family: 仿宋; font-size: 9pt" align="center">${lender.remarks!""}</td>
                                                </tr>
                                            </#list>
                                        </table>
                                    <br>
                                    </#list>
                                    </#if>
                                    <#if levelIn=="3">
                                    <h3>&emsp;&emsp;3.2 业务参数说明（object）</h3>
                                    <h4>&emsp;&emsp;二级参数</h4>
                                        <#list numInMap2?values as Map2>
                                            <#list Map2 as lender>
                                            <span style="font-family: 等线; font-size: 10pt">&emsp;&emsp;${lender.descOneInL!""}</span>
                                            </#list>
                                            <table border="1" cellspacing="0" cellpadding="0" style="margin-left: 35px">
                                                <tr>
                                                    <th style="font-family: 等线; font-size: 10pt" bgcolor="#8DB3E2" width="16%">字段名称</th>
                                                    <th style="font-family: 等线; font-size: 10pt" bgcolor="#8DB3E2" width="17%">类型</th>
                                                    <th style="font-family: 等线; font-size: 10pt" bgcolor="#8DB3E2" width="17%">必填项</th>
                                                    <th style="font-family: 等线; font-size: 10pt" bgcolor="#8DB3E2" width="50%">备注</th>
                                                </tr>
                                                <#list Map2 as lender>
                                                    <tr>
                                                        <td style="font-family: 仿宋; font-size: 9pt" align="center">${lender.fieldNm!""}</td>
                                                        <td style="font-family: 仿宋; font-size: 9pt" align="center">${lender.fieldTyp!""}</td>
                                                        <td style="font-family: 仿宋; font-size: 9pt" align="center">${lender.required!""}</td>
                                                        <td style="font-family: 仿宋; font-size: 9pt" align="center">${lender.remarks!""}</td>
                                                    </tr>
                                                </#list>
                                            </table>
                                        <br>
                                        </#list>
                                    <h4>&emsp;&emsp;三级参数</h4>
                                        <#list numInMap3?values as Map3>
                                            <#list Map3 as lender>
                                            <span style="font-family: 等线; font-size: 10pt">&emsp;&emsp;${lender.descTwoInL!""}</span>
                                            </#list>
                                        <table border="1" cellspacing="0" cellpadding="0" style="margin-left: 35px">
                                            <tr>
                                                <th style="font-family: 等线; font-size: 10pt" bgcolor="#8DB3E2" width="16%">字段名称</th>
                                                <th style="font-family: 等线; font-size: 10pt" bgcolor="#8DB3E2" width="17%">类型</th>
                                                <th style="font-family: 等线; font-size: 10pt" bgcolor="#8DB3E2" width="17%">必填项</th>
                                                <th style="font-family: 等线; font-size: 10pt" bgcolor="#8DB3E2" width="50%">备注</th>
                                            </tr>
                                            <#list Map3 as lender>
                                                <tr>
                                                    <td style="font-family: 仿宋; font-size: 9pt" align="center">${lender.fieldNm!""}</td>
                                                    <td style="font-family: 仿宋; font-size: 9pt" align="center">${lender.fieldTyp!""}</td>
                                                    <td style="font-family: 仿宋; font-size: 9pt" align="center">${lender.required!""}</td>
                                                    <td style="font-family: 仿宋; font-size: 9pt" align="center">${lender.remarks!""}</td>
                                                </tr>
                                            </#list>
                                        </table>
                                       <br>
                                        </#list>
                                    </#if>

                                    <h2>4 响应说明</h2>
                                    <h3>&emsp;&emsp;4.1 通用响应参数说明</h3>
                                    <span style="font-family: 等线; font-size: 10pt">&emsp;&emsp;${doc.outExplain?default("")}</span>
                                    <table border="1" cellspacing="0" cellpadding="0" style="margin-left: 35px">
                                        <tr>
                                            <th style="font-family: 等线; font-size: 10pt" bgcolor="#8DB3E2" width="16%">字段名称</th>
                                            <th style="font-family: 等线; font-size: 10pt" bgcolor="#8DB3E2" width="17%">类型</th>
                                            <th style="font-family: 等线; font-size: 10pt" bgcolor="#8DB3E2" width="17%">必填项</th>
                                            <th style="font-family: 等线; font-size: 10pt" bgcolor="#8DB3E2" width="50%">备注</th>

                                        </tr>
                                    <#list paraOutList as lender>
                                        <tr>
                                            <td style="font-family: 仿宋; font-size: 9pt" align="center">${lender.fieldNm!""}</td>
                                            <td style="font-family: 仿宋; font-size: 9pt" align="center">${lender.fieldTyp!""}</td>
                                            <td style="font-family: 仿宋; font-size: 9pt" align="center">${lender.required!""}</td>
                                            <td style="font-family: 仿宋; font-size: 9pt" align="center">${lender.remarks!""}</td>
                                        </tr>
                                    </#list>
                                    </table>
                                    <br>
                                    <#if levelOut=="2">
                                    <h3>&emsp;&emsp;4.2 业务响应参数说明（object）</h3>
                                    <h4>&emsp;&emsp;二级参数</h4>
                                        <#list numOutMap2?values as Map2>
                                            <#list Map2 as lender>
                                            <span style="font-family: 等线; font-size: 10pt">&emsp;&emsp;${lender.descOneOutL!""}</span>
                                            </#list>
                                        <table border="1" cellspacing="0" cellpadding="0" style="margin-left: 35px">
                                            <tr>
                                                <th style="font-family: 等线; font-size: 10pt" bgcolor="#8DB3E2" width="16%">字段名称</th>
                                                <th style="font-family: 等线; font-size: 10pt" bgcolor="#8DB3E2" width="17%">类型</th>
                                                <th style="font-family: 等线; font-size: 10pt" bgcolor="#8DB3E2" width="17%">必填项</th>
                                                <th style="font-family: 等线; font-size: 10pt" bgcolor="#8DB3E2" width="50%">备注</th>
                                            </tr>
                                            <#list Map2 as lender>
                                                <tr>
                                                    <td style="font-family: 仿宋; font-size: 9pt" align="center">${lender.fieldNm!""}</td>
                                                    <td style="font-family: 仿宋; font-size: 9pt" align="center">${lender.fieldTyp!""}</td>
                                                    <td style="font-family: 仿宋; font-size: 9pt" align="center">${lender.required!""}</td>
                                                    <td style="font-family: 仿宋; font-size: 9pt" align="center">${lender.remarks!""}</td>
                                                </tr>
                                            </#list>
                                        </table>
                                        <br>
                                        </#list>
                                    </#if>

                                    <#if levelOut=="3">
                                    <h3>&emsp;&emsp;4.2 业务响应参数说明（object）</h3>
                                    <h4>&emsp;&emsp;二级参数</h4>
                                        <#list numOutMap2?values as Map2>
                                            <#list Map2 as lender>
                                            <span style="font-family: 等线; font-size: 10pt">&emsp;&emsp;${lender.descOneOutL!""}</span>
                                            </#list>
                                            <table border="1" cellspacing="0" cellpadding="0" style="margin-left: 35px">
                                                <tr>
                                                    <th style="font-family: 等线; font-size: 10pt" bgcolor="#8DB3E2" width="16%">字段名称</th>
                                                    <th style="font-family: 等线; font-size: 10pt" bgcolor="#8DB3E2" width="17%">类型</th>
                                                    <th style="font-family: 等线; font-size: 10pt" bgcolor="#8DB3E2" width="17%">必填项</th>
                                                    <th style="font-family: 等线; font-size: 10pt" bgcolor="#8DB3E2" width="50%">备注</th>
                                                </tr>
                                                <#list Map2 as lender>
                                                    <tr>
                                                        <td style="font-family: 仿宋; font-size: 9pt" align="center">${lender.fieldNm!""}</td>
                                                        <td style="font-family: 仿宋; font-size: 9pt" align="center">${lender.fieldTyp!""}</td>
                                                        <td style="font-family: 仿宋; font-size: 9pt" align="center">${lender.required!""}</td>
                                                        <td style="font-family: 仿宋; font-size: 9pt" align="center">${lender.remarks!""}</td>
                                                    </tr>
                                                </#list>
                                            </table>
                                        <br>
                                        </#list>
                                    <h4>&emsp;&emsp;三级参数</h4>
                                        <#list numOutMap3?values as Map3>
                                            <#list Map3 as lender>
                                            <span style="font-family: 等线; font-size: 10pt">&emsp;&emsp;${lender.descTwoOutL!""}</span>
                                            </#list>
                                            <table border="1" cellspacing="0" cellpadding="0" style="margin-left: 35px">
                                                <tr>
                                                    <th style="font-family: 等线; font-size: 10pt" bgcolor="#8DB3E2" width="16%">字段名称</th>
                                                    <th style="font-family: 等线; font-size: 10pt" bgcolor="#8DB3E2" width="17%">类型</th>
                                                    <th style="font-family: 等线; font-size: 10pt" bgcolor="#8DB3E2" width="17%">必填项</th>
                                                    <th style="font-family: 等线; font-size: 10pt" bgcolor="#8DB3E2" width="50%">备注</th>

                                                </tr>
                                                <#list Map3 as lender>
                                                    <tr>
                                                        <td style="font-family: 仿宋; font-size: 9pt" align="center">${lender.fieldNm!""}</td>
                                                        <td style="font-family: 仿宋; font-size: 9pt" align="center">${lender.fieldTyp!""}</td>
                                                        <td style="font-family: 仿宋; font-size: 9pt" align="center">${lender.required!""}</td>
                                                        <td style="font-family: 仿宋; font-size: 9pt" align="center">${lender.remarks!""}</td>
                                                    </tr>
                                                </#list>
                                            </table>
                                        <br>
                                        </#list>
                                    </#if>

                                    <h2>5 响应码说明</h2>
                                    <table border="1" cellspacing="0" cellpadding="0" style="margin-left: 35px">
                                        <tr>
                                            <th style="font-family: 等线; font-size: 10pt" bgcolor="#8DB3E2" width="30%">code</th>
                                            <th style="font-family: 等线; font-size: 10pt" bgcolor="#8DB3E2" width="70%">描述</th>
                                        </tr>
                                        <#list responseCode as lender>
                                            <tr>
                                                <td style="font-family: 仿宋; font-size: 9pt" align="center">${lender.code!""}</td>
                                                <td style="font-family: 仿宋; font-size: 9pt" align="center">${lender.message!""}</td>
                                            </tr>
                                        </#list>
                                    </table>
                                    <br>
                                    <#if codeFlag == "0">
                                        <table border="1" cellspacing="0" cellpadding="0" style="margin-left: 35px">
                                            <tr>
                                                <th style="font-family: 等线; font-size: 10pt" bgcolor="#8DB3E2" width="30%">${codeMessObject}</th>
                                                <th style="font-family: 等线; font-size: 10pt" bgcolor="#8DB3E2" width="70%">描述</th>
                                            </tr>
                                        <#list objectCodeMess as lender>
                                            <tr>
                                                <td style="font-family: 仿宋; font-size: 9pt" align="center">${lender.code!""}</td>
                                                <td style="font-family: 仿宋; font-size: 9pt" align="center">${lender.message!""}</td>
                                            </tr>
                                        </#list>
                                        </table>
                                    </#if>

</body>
</html>