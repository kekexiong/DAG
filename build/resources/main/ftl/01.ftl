<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>测试</title>
</head>

<body>
                                    <h1 align="center" width="50%">资金组${fileName}文档</h1>
<h2> 1 接口描述</h2>
<span>${description}</span>
<h2>2 接口概述</h2>
<span>${description2}</span>
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
                                            <td>1</td>
                                            <td>$100</td>
                                        <#--<td>$100</td>-->
                                        <#--<td>$100</td>-->
                                        <#--<td>$100</td>-->
                                        <#--<td>$100</td>-->
                                        </tr>
                                        <tr>
                                            <td>接口类</td>
                                            <td>1</td>
                                            <td>$100</td>
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
                                            <td>1</td>
                                            <td>$100</td>
                                        <#--<td>$100</td>-->
                                        <#--<td>$100</td>-->
                                        <#--<td>$100</td>-->
                                        <#--<td>$100</td>-->
                                        </tr>
                                        <tr>
                                            <td>响应业务参数类型</td>
                                            <td>1</td>
                                            <td>$100</td>
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
<span>${description3}</span>
                                    <table border="1">
                                        <tr>
                                            <th style="font-family: 黑体" bgcolor="#f5f5dc" width="25%">字段名称</th>
                                            <td style="font-family: 黑体" bgcolor="#f5f5dc" width="25%">类型</td>
                                            <td style="font-family: 黑体" bgcolor="#f5f5dc" width="25%">输入项</td>
                                            <td style="font-family: 黑体" bgcolor="#f5f5dc" width="25%">备注</td>

                                        </tr>
                                    <#list demoList as lender>
                                    <tr>
                                        <td>${lender.name!""}</td>
                                        <td>${lender.type!""}</td>
                                        <td>${lender.input!""}</td>
                                        <td>${lender.remark!""}</td>

                                    </tr>
                                    </#list>
                                    </table>

                                    <h2>4 响应说明</h2>
                                    <h3>4.1 响应参数说明</h3>
                                    <span>${description3}</span>

                                    <h2>5 响应码说明</h2>



</body>
</html>