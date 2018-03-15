<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="zh-hans">
<!--<![endif]-->

<head>
<meta charset="utf-8" />
<title>随行付收单管理系统</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=320, initial-scale=1" name="viewport" />
<meta content="" name="description" />
<meta content="" name="author" />
<jsp:include page="../common/resource.jsp" flush="true" />

</head>

<!-- <body class="page-header-fixed page-sidebar-closed-hide-logo page-content-white page-md"> -->
<body class="iframe-body">

	<!-- BEGIN HEADER -->
	<jsp:include page="../common/header.jsp" flush="true" />
	<!-- END HEADER -->

	<!-- BEGIN CONTAINER -->
	<div class="clearfix"></div>
	<div class="page-container">
		<!-- BEGIN MENU -->
		<%-- <jsp:include page="../common/menu.jsp" flush="true" /> --%>
		<!-- END MENU -->

		<!-- BEGIN CONTENT -->
		<div class="page-content-wrapper">
			<!-- 主体-->
			<!-- <div class="page-content"> -->
			<div class="">
				<!-- 右边开始 -->
				<div class="row">
					<div class="col-md-12">
						<div class="portlet light bordered scaffold-list">
							<!-- 查询信息 -->
							<div class="portlet-body form">
								<form action="<%=request.getContextPath()%>/mec/queryData" class="form-horizontal" id="queryMecPanel_Form">
									<div class="row norow">
																			</div>
									<div class="form-actions">
										<div class="row">
											<div class="col-md-12">
												<div class="row">
													<div class="col-md-offset-1 col-md-11">
														<button type="button" id="query_btn" class="btn btn-success">
															<i class="fa fa-search"></i> 查询
														</button>
														<button type="button" id="reset_btn" class="btn red">
															<i class="fa fa-refresh"></i> 重置
														</button>
														<button type="button" id="add_btn" class="btn btn-info">
															<i class="fa fa-plus"></i> 添加
														</button>
														<button type="button" id="edit_btn" class="btn tn btn btn-primary">
															<i class="fa fa-edit"></i> 修改
														</button>
														<button type="button" id="dele_btn" class="btn tn btn btn-primary">
															<i class="fa fa-trash-o fa-lg"></i> 删除
														</button>
													</div>
												</div>
											</div>
										</div>
									</div>
								</form>
							</div>


						</div>
						<div class="clearfix"></div>
						<div class="portlet light bordered scaffold-list">
							<div class="portlet-title">
								<div class="caption">
									<i class="fa fa-search font-blue"></i> <span
										class="caption-subject font-blue bold uppercase">接口信息信息列表</span>
								</div>
								<div class="tools">
									<a href="" class="fullscreen" data-original-title="全屏" title=""></a>
								</div>
							</div>
							<div class="portlet-body wheel">
								<div>
									<table
										class="table table-striped table-bordered table-hover table-checkable order-column"
										id="queryMecGrid">
										<thead>
											<tr>
												<th><input type="checkbox" class="group-checkable" onclick="checkAll(this.checked)" /></th>
													<th class="nowrap">序号</th>
															<th class="nowrap">接口名称</th>
															<th class="nowrap">接口描述</th>
															<th class="nowrap">接口概述</th>
															<th class="nowrap">接口方法名</th>
															<th class="nowrap">接口方法名描述</th>
															<th class="nowrap">接口类名</th>
															<th class="nowrap">接口类名描述</th>
															<th class="nowrap">传入参数</th>
															<th class="nowrap">传出参数</th>
															<th class="nowrap">输入说明</th>
															<th class="nowrap">响应说明</th>
														<th class="nowrap">操作</th>
											</tr>
										</thead>
										<tbody>
										</tbody>
									</table>
								</div>
							</div>
							<!-- 分页开始 -->
							<div class="row no-margin" id="pagination-bar">
								<div class="col-sm-12 left no-padding">
									<div class="inline fl">
										记录数共:<span id="itemCount"></span>条 当前第<span id="nowpage"></span>/<span
											id="toalPage"></span>页 每页显示:
									</div>
									<div class="inline fl">
										<select id="limit" class=" form-control "
											onchange="onChange4PageSize(this)">
											<option value="10">10</option>
											<option value="20" selected="selected">20</option>
											<option value="30">30</option>
											<option value="50">50</option>
											<option value="80">80</option>
											<option value="100">100</option>
										</select>
									</div>
									<div class="inline fl">条</div>

								<div class="col-sm-6 pull-right no-padding">
									<div id="pagination"
										class="dataTables_paginate paging_simple_numbers clearfix pull-right">
										<nobr>
											<ul class="pagination no-padding" style="float: left">
												<li class="prev "><a href="javascript:;"
													onclick="javascript:pageing(1)"> 首页</a></li>
												<li class="prev "><a href="javascript:;"
													onclick="javascript:pageing('pro')"> 上一页</a></li>
												<li class="next "><a href="javascript:;"
													onclick="javascript:pageing('next')">下一页</a></li>
												<li class="next "><a href="javascript:;"
													onclick="javascript:pageing('last')">末页</a></li>
											</ul>
											<div class="input-group pull-right col-sm-2"
												style="float: left;">
												<input min="1" class="form-control p"
													style="height: 31px; width: 80px;" type="number"> <a
													href="javascript:;" class="input-group-addon"
													onclick="javascript:pageing($('.p').val())"><i
													class="fa fa-mail-forward brown"></i></a>
											</div>
										</nobr>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
			<!----------------------------------- 传入参数的添加 ------------------------------------------>
			<div class="modal fade" id="allotTimingWin" tabindex="-1"
				 role="dialog" data-backdrop="static" data-width="800px"
				 data-height="400px">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					<h4 class="modal-title">传入参数添加</h4>
				</div>
				<div class="modal-body">
					<div class="portlet-body form">
						<form action="<%=request.getContextPath()%>/"
							  class="form-horizontal" id="allotTimingForm">
							<div class="form-body">
								<div class="row norow">

									<br /> <br />
									<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
										<div class="form-group">
											<table border="2"
												   class="table table-striped table-bordered table-hover table-checkable order-column"
												   style="height: 100px;" id="allotTimingTable">
												<thead>
												<tr>
													<th><input type="checkbox" class="group-checkable"
															   onclick="checkAllotTimingAll(this.checked)" /></th>
													<th>字段名称</th>
													<th>字段类型</th>
													<th>是否要求输入</th>
													<th>备注</th>
												</tr>
												</thead>
												<tbody>

												</tbody>
											</table>
										</div>
										<div style="height: 20px;"></div>
									</div>
									<br />
									<div class="form-actions">
										<div class="row">
											<div class="col-md-12">
												<div class="row">
													<div class="col-md-12" style="text-align: center;">
														<button type="button" id="allotTiming_add_btn"
																class="btn btn-success" onClick="addTableRow('1');">
															<i class="fa fa-share"></i>添加
														</button>
														<button type="button" id="allotTiming_del_btn"
																class="btn red" onClick="delTableRow('')">
															<i class="fa fa-share"></i>删除
														</button>
														<button type="button" id="allotTiming_save_btn"
																class="btn btn-info" onClick="saveTableRow('')">
															<i class="fa fa-share"></i>提交
														</button>
														<button type="button" id="allotTiming_cancel_btn1"
																onClick="allotTiming_cancel_btn('')"
																class="btn red">
															<i class="fa fa-share"></i>取消
														</button>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="clearfix"></div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
			<!----------------------------------- 传入参数的添加二级 ------------------------------------------>
			<div class="modal fade" id="allotTimingWin2" tabindex="-1"
				 role="dialog" data-backdrop="static" data-width="800px"
				 data-height="400px">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					<h4 class="modal-title">二级传入参数添加</h4>
				</div>
				<div class="modal-body">
					<div class="portlet-body form">
						<form action="<%=request.getContextPath()%>/"
							  class="form-horizontal" id="allotTimingForm2">
							<div class="form-body">
								<div class="row norow">

									<br /> <br />
									<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
										<div class="form-group">
											<table border="2"
												   class="table table-striped table-bordered table-hover table-checkable order-column"
												   style="height: 100px;" id="allotTimingTable2">
												<thead>
												<tr>
													<th><input type="checkbox" class="group-checkable"
															   onclick="checkAllotTimingAll(this.checked)" /></th>
													<th>字段名称</th>
													<th>字段类型</th>
													<th>是否要求输入</th>
													<th>备注</th>
												</tr>
												</thead>
												<tbody>

												</tbody>
											</table>
										</div>
										<div style="height: 20px;"></div>
									</div>
									<br />
									<div class="form-actions">
										<div class="row">
											<div class="col-md-12">
												<div class="row">
													<div class="col-md-12" style="text-align: center;">
														<button type="button" id="allotTiming_add_btn2"
																class="btn btn-success" onClick="addTableRow('2');">
															<i class="fa fa-share"></i>添加
														</button>
														<button type="button" id="allotTiming_del_btn2"
																class="btn red" onClick="delTableRow('2')">
															<i class="fa fa-share"></i>删除
														</button>
														<button type="button" id="allotTiming_save_btn2"
																class="btn btn-info" onClick="saveTableRow('2')">
															<i class="fa fa-share"></i>提交
														</button>
														<button type="button" id="allotTiming_cancel_btn2"
																onClick="allotTiming_cancel_btn('2')"
																class="btn red">
															<i class="fa fa-share"></i>取消
														</button>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="clearfix"></div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
			<!----------------------------------- 传入参数的添加三级 ------------------------------------------>
			<div class="modal fade" id="allotTimingWin3" tabindex="-1"
				 role="dialog" data-backdrop="static" data-width="800px"
				 data-height="400px">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					<h4 class="modal-title">三级传入参数添加</h4>
				</div>
				<div class="modal-body">
					<div class="portlet-body form">
						<form action="<%=request.getContextPath()%>/"
							  class="form-horizontal" id="allotTimingForm3">
							<div class="form-body">
								<div class="row norow">

									<br /> <br />
									<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
										<div class="form-group">
											<table border="2"
												   class="table table-striped table-bordered table-hover table-checkable order-column"
												   style="height: 100px;" id="allotTimingTable3">
												<thead>
												<tr>
													<th><input type="checkbox" class="group-checkable"
															   onclick="checkAllotTimingAll(this.checked)" /></th>
													<th>字段名称</th>
													<th>字段类型</th>
													<th>是否要求输入</th>
													<th>备注</th>
												</tr>
												</thead>
												<tbody>

												</tbody>
											</table>
										</div>
										<div style="height: 20px;"></div>
									</div>
									<br />
									<div class="form-actions">
										<div class="row">
											<div class="col-md-12">
												<div class="row">
													<div class="col-md-12" style="text-align: center;">
														<button type="button" id="allotTiming_add_btn3"
																class="btn btn-success" onClick="addTableRow('3');">
															<i class="fa fa-share"></i>添加
														</button>
														<button type="button" id="allotTiming_del_btn3"
																class="btn red" onClick="delTableRow('3')">
															<i class="fa fa-share"></i>删除
														</button>
														<button type="button" id="allotTiming_save_btn3"
																class="btn btn-info" onClick="saveTableRow('3')">
															<i class="fa fa-share"></i>提交
														</button>
														<button type="button" id="allotTiming_cancel_btn3"
																onClick="allotTiming_cancel_btn('3')"
																class="btn red">
															<i class="fa fa-share"></i>取消
														</button>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="clearfix"></div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		<!----------------------------------- 添加(修改)功能弹出页面（获取输入值的输入框后缀统一增加_SHOW标识符） ------------------------------------------>
		<div class="modal fade" id="addOrUpdateWin" tabindex="-1" role="dialog" data-backdrop="static" data-width="700px" data-height="300px">
	        <div class="modal-header">
	           <button type="button" class="close"
	              data-dismiss="modal" aria-hidden="true">
	                 &times;
	           </button>
	           <h4 class="modal-title" id="addOrUpdateWin_title"></h4>
	        </div>
	        <div class="modal-body">
	           <div class="portlet-body form">
	               <form action="<%=request.getContextPath()%>/" class="form-horizontal" id="addOrUpdateform">
	                   <div class="form-body">
	                       <div class="row norow">
	                       	<input type="hidden" value = "" id = "hiddenType"/>
	                       	<input type="hidden" value = "" id = "hiddenUUid"/>
	                           				                           				                           			<!-- 普通输入框 -->
	                           												                           				                           				                           			<!-- 普通输入框 -->
										<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
											<div class="form-group">
												<label for="span-medium-2"
													class="control-label col-md-4 text-right">接口名称:</label>
												<div class="col-md-8 paddingnone">
													<input name="interNm"
														id="INTER_NM_SHOW" class="form-control"
														placeholder="接口名称">
												</div>
											</div>
										</div>
	                           												                           				                           				                           			<!-- 普通输入框 -->

	                           												                           				                           				                           			<!-- 普通输入框 -->
										<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
											<div class="form-group">
												<label for="span-medium-2"
													class="control-label col-md-4 text-right">接口方法名:</label>
												<div class="col-md-8 paddingnone">
													<input name="interMethodNm"
														id="INTER_METHOD_NM_SHOW" class="form-control"
														placeholder="接口方法名">
												</div>
											</div>
										</div>
	                           												                           				                           				                           			<!-- 普通输入框 -->
										<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
											<div class="form-group">
												<label for="span-medium-2"
													class="control-label col-md-4 text-right">接口方法名描述:</label>
												<div class="col-md-8 paddingnone">

													<input name="interMethodNmDesc"
														id="INTER_METHOD_NM_DESC_SHOW" class="form-control"
														placeholder="接口方法名描述">
												</div>
											</div>
										</div>
	                           												                           				                           				                           			<!-- 普通输入框 -->
										<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
											<div class="form-group">
												<label for="span-medium-2"
													class="control-label col-md-4 text-right">接口类名:</label>
												<div class="col-md-8 paddingnone">
													<input name="interClassNm"
														id="INTER_CLASS_NM_SHOW" class="form-control"
														placeholder="接口类名">
												</div>
											</div>
										</div>
	                           												                           				                           				                           			<!-- 普通输入框 -->
										<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
											<div class="form-group">
												<label for="span-medium-2"
													class="control-label col-md-4 text-right">接口类名描述:</label>
												<div class="col-md-8 paddingnone">
													<input name="interClassNmDesc"
														id="INTER_CLASS_NM_DESC_SHOW" class="form-control"
														placeholder="接口类名描述">
												</div>
											</div>
										</div>
	                           												                           				                           				                           			<!-- 普通输入框 -->
										<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
											<div class="form-group">
												<label for="span-medium-2"
													class="control-label col-md-4 text-right">传入参数:</label>
												<div class="col-md-8 paddingnone">
													<button type="button" id="add_btn_in">
														<i class="fa fa-plus"></i> 添加传入参数
													</button>
												</div>
											</div>
										</div>
	                           												                           				                           				                           			<!-- 普通输入框 -->
										<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
											<div class="form-group">
												<label for="span-medium-2"
													class="control-label col-md-4 text-right">传出参数:</label>
												<div class="col-md-8 paddingnone">
													<button type="button" id="add_btn_out">
														<i class="fa fa-plus"></i> 添加传出参数
													</button>
												</div>
											</div>
										</div>

							   <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6" style="visibility: hidden">
								   <div class="form-group">
									   <label for="span-medium-2"
											  class="control-label col-md-4 text-right">传出参数:</label>
									   <div class="col-md-8 paddingnone">
										   <button type="button" id="add_btn_out2">
											   <i class="fa fa-plus"></i> 添加传出参数
										   </button>
									   </div>
								   </div>
							   </div>
	                           												                           				                           				                           			<!-- 普通输入框 -->
										<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
											<div class="form-group">
												<label for="span-medium-2"
													class="control-label col-md-4 text-right">输入说明:</label>
												<div class="col-md-8 paddingnone">
													<textarea name="inExplain"
															  id="IN_EXPLAIN_SHOW" class="form-control" rows="5" cols="28"></textarea>
													<%--<input name="inExplain"--%>
														<%--id="IN_EXPLAIN_SHOW" class="form-control"--%>
														<%--placeholder="输入说明">--%>
												</div>
											</div>
										</div>
	                           												                           				                           				                           			<!-- 普通输入框 -->
										<div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
											<div class="form-group">
												<label for="span-medium-2"
													class="control-label col-md-4 text-right">响应说明:</label>
												<div class="col-md-8 paddingnone">
													<textarea name="outExplain"
															  id="OUT_EXPLAIN_SHOW" class="form-control" rows="5" cols="28"></textarea>
													<%--<input name="outExplain"--%>
														<%--id="OUT_EXPLAIN_SHOW" class="form-control"--%>
														<%--placeholder="响应说明">--%>
												</div>
											</div>
										</div>

							   <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
								   <div class="form-group">
									   <label for="span-medium-2"
											  class="control-label col-md-4 text-right">接口描述:</label>
									   <div class="col-md-8 paddingnone">
													<textarea name="interDesc"
															  id="INTER_DESC_SHOW"rows="5" class="form-control" cols="28"></textarea>
										   <%--<input name="interDesc"--%>
										   <%--id="INTER_DESC_SHOW" class="form-control"--%>
										   <%--placeholder="接口描述">--%>
									   </div>
								   </div>
							   </div>
							   <!-- 普通输入框 -->
							   <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
								   <div class="form-group">
									   <label for="span-medium-2"
											  class="control-label col-md-4 text-right">接口概述:</label>
									   <div class="col-md-8 paddingnone">
													<textarea name="interSummary"
															  id="INTER_SUMMARY_SHOW" rows="5"  class="form-control" cols="28"></textarea>
										   <%--<input name="interSummary"--%>
										   <%--id="INTER_SUMMARY_SHOW" class="form-control"--%>
										   <%--placeholder="接口概述">--%>
									   </div>
								   </div>
							   </div>


	                           												                           <div class="clearfix"></div>
	                       </div>
	                   </div>
	                   <div class="form-actions">
	                       <div class="row">
	                           <div class="col-md-12">
	                               <div class="row">
	                                   <div class="col-md-12" style="text-align:center;">
	                                       <button type="button" id="addform_save_btn" class="btn btn-success"><i class="fa fa-save"></i> 提交</button>
	                                       <button type="button" id="addform_cancel_btn" class="btn red"> <i class="fa fa-share"></i> 取消</button>
	                                   </div>
	                               </div>
	                           </div>
	                       </div>
	                   </div>
	               </form>
	           </div>
	        </div>
    	</div>
    	<!-- ---------------------------------------详情页面展示(获取输入值的输入框后缀统一增加_VIEW标识符)------------------------------------------------------------ -->
			<div class="modal fade" id="viewWin" tabindex="-1" role="dialog" data-backdrop="static" data-width="700px" data-height="300px">
		        <div class="modal-header">
		           <button type="button" class="close"
		              data-dismiss="modal" aria-hidden="true">
		                 &times;
		           </button>
		           <h4 class="modal-title" >接口信息详情信息</h4>
		        </div>
		        <div class="modal-body">
		           <div class="portlet-body form">
		               <form action="<%=request.getContextPath()%>/" class="form-horizontal" id="">
		                   <div class="form-body">
		                       <div class="row norow">
		                           <div class="clearfix"></div>
		                       </div>
		                   </div>
		                   <div class="form-actions">
		                       <div class="row">
		                           <div class="col-md-12">
		                               <div class="row">
		                                   <div class="col-md-12" style="text-align:center;">
		                                       <button type="button" id="openform_cancel_btn" class="btn red"> <i class="fa fa-share"></i> 取消</button>
		                                   </div>
		                               </div>
		                           </div>
		                       </div>
		                   </div>
		               </form>
		           </div>
		        </div>
	    	</div>
		</div>
	</div>

	<jsp:include page="../common/footer.jsp" flush="true" />

	<script type="text/javascript">
		//分页功能
		//分页默认隐藏
		$("#pagination-bar").hide();
		//每页多少条
		var limit = 0;
		//当前页
		var page = 1;
		//起始条
		var start = 0;
		//总页数
		var toalPage;
		//数据列表缓存
		var tableData;

		var importLimit = 0;

		var importPage = 1;

		var importStart = 0;

		var importTotalPage;

		var paraDateIn;
        var paraDateOut;
        var paraDateIn2;
        var paraDateOut2;
        var paraDateIn3;
        var paraDateOut3;
        var paraFlag;

		function pageing(opp) {
			$(window.document).scrollTop(0, 500);
			limit = $("#limit  option:selected").text();

			if (opp == 'pro') {
				if (page > 1) {
					page = page - 1;
					start = (page - 1) * limit;
				} else {
					bootbox.alert('已经是第一页');
					return;
				}
			} else if (opp == 'next') {
				if (page == toalPage) {
					bootbox.alert('已经是最后一页');
					return;
				}
				page = page + 1;
				start = (page - 1) * limit;
			} else if (opp == 'last') {
				if (page == toalPage) {
					bootbox.alert('已经是最后一页');
					return;
				}
				page = $("#toalPage").text();
				if (page > toalPage) {
					bootbox.alert('对不起没有你要跳转的页面');
					return;
				} else if (page < 1) {
					bootbox.alert('对不起没有你要跳转的页面');
					return;
				}

				start = (page - 1) * limit;
			} else {
				if (page == 1 && opp == 1) {
					bootbox.alert('已经是第一页');
					return;
				}
				page = opp * 1;
				if (page > toalPage) {
					bootbox.alert('对不起没有你要跳转的页面');
					return;
				} else if (page < 1) {
					bootbox.alert('对不起没有你要跳转的页面');
					return;
				}

				start = (page - 1) * limit;
			}
			$('#queryMecGrid > tbody').empty();
			reloadGrid();
		}
		//全选列表数据
	    function checkAll(checked) {
	    	$("#queryMecGrid tbody :checkbox").prop('checked', checked);
	    }
		function onChange4PageSize(select) {
	    	limit = select.value;
	    	reloadGrid();
	    }
		//初始化页面功能
		$(function(){
			<!---------------------在此手动设置按钮的权限------------------------------->
			//if (!hasPermission(PERMISSSIONCONST.SES1002)) {$("#").hide();}
			<!---------------------在此手动初始化页面表单审核状态数据源---------------------->
			<!--getComboStore系统表生成下拉框    参数说明1：传入值，用于下拉框回显，2下拉夸ID，3传入key值，4传入FALSE或者TRUE用于下拉框可选或者可读状态，FALSE下拉框可以不是disabled，TRUE是disabled状态-->
			<!--getCustomStore自定义下拉框    参数说明1：传入值，用于下拉框回显，2下拉夸ID，3传入FALSE或者TRUE用于下拉框可选或者可读状态，FALSE下拉框可以不是disabled，TRUE是disabled状态-->
			<!--如果不需要回显第一个参数传入""，如果不需要设定disabled属性传入FALSE-->
			//初始化输入框时间默认值方法
			initDefaultDate();
	    	//重置按钮
			$("#reset_btn").on('click', function() {
				$("#queryMecPanel_Form")[0].reset();
				$("#queryMecPanel_Form .bs-select").selectpicker('val','');
				initDefaultDate();
			});
	    	//查询按钮
			$("#query_btn").on('click', function() {
				page = 1;
				reloadGrid();
			});
			//添加按钮
			$("#add_btn").on('click', function() {
				//清空记录
				$("#addOrUpdateform")[0].reset();
				$("#addOrUpdateform .bs-select").selectpicker('val','');
				document.getElementById("hiddenType").value = "1";
				var title = document.getElementById("addOrUpdateWin_title");
				title.innerHTML = "接口信息添加信息";
				addOrUpdate("add","");
			});
			//修改按钮
			$("#edit_btn").on('click', function() {
				var selectRocords = $("#queryMecGrid tbody input:checked");
	    		if (selectRocords.length != 1) {
	    			bootbox.alert("请选择一条数据");
	    			return;
	    		} else {
	    			var index = $(selectRocords[0]).attr("rownum");
	    			record = tableData.items[index];
	    		}
	    		document.getElementById("hiddenType").value = "2";
				var title = document.getElementById("addOrUpdateWin_title");
				title.innerHTML = "接口信息修改信息";
	    		addOrUpdate("update",record);
			});
	    	//添加保存按钮
	    	var param = {};
			$("#addform_save_btn").off('click').on('click', function() {
							param.uuid = $("#UUID_SHOW").val();
							param.interNm = $("#INTER_NM_SHOW").val();
							param.interDesc = $("#INTER_DESC_SHOW").val();
							param.interSummary = $("#INTER_SUMMARY_SHOW").val();
							param.interMethodNm = $("#INTER_METHOD_NM_SHOW").val();
							param.interMethodNmDesc = $("#INTER_METHOD_NM_DESC_SHOW").val();
							param.interClassNm = $("#INTER_CLASS_NM_SHOW").val();
							param.interClassNmDesc = $("#INTER_CLASS_NM_DESC_SHOW").val();
                            param.transParame = paraDateIn+"@@"+paraDateIn2+"@@"+paraDateIn3;
                            param.outParame = paraDateOut+"@@"+paraDateOut2+"@@"+paraDateOut3;
							param.inExplain = $("#IN_EXPLAIN_SHOW").val();
							param.outExplain = $("#OUT_EXPLAIN_SHOW").val();
				var hiddenType = $("#hiddenType").val();
				var url = "";
				if("1" == hiddenType){
                    param.transParame = paraDateIn+"@@"+paraDateIn2+"@@"+paraDateIn3;
                    param.outParame = paraDateOut+"@@"+paraDateOut2+"@@"+paraDateOut3;
				    url = baseURL + "/ses/tBapInterBasicInf/save";
				}else if ("2" == hiddenType){
                    param.transParame = "";
                    param.outParame = "";
				    url = baseURL + "/ses/tBapInterBasicInf/update";
					param.uuid = $("#hiddenUUid").val();
				}else{
					url = "";
				}
				$.ajax({
					type: "POST",
					url: url,
					contentType: "application/x-www-form-urlencoded;charset=utf-8",
					data: param,
					dataType: "json",
					success:function(data){
						if(data.timeout){
		            		ajaxTimeout();
		                }
						bootbox.alert(data.msg);
						$("#addOrUpdateWin").modal('hide');
						reloadGrid();
					},
					error:function(){

					}
				});
                initParaDate();
			});
			//弹出页面取消按钮（添加/修改）
			$("#addform_cancel_btn").on('click',function(){
				$("#addOrUpdateWin").modal('hide');
                initParaDate();
			});

            function initParaDate() {
                var demo;
			    paraDateIn=demo;
                paraDateOut=demo;
                paraDateIn2=demo;
                paraDateOut2=demo;
                paraDateIn3=demo;
                paraDateOut3=demo;
                paraFlag=demo;
            }
	    	//删除按钮
			$("#dele_btn").on('click', function() {
				var selectRocords = $("#queryMecGrid tbody input:checked");
				var uuids = "";
				if(selectRocords.length <= 0){
					bootbox.alert(CONST.TIP001);
	    			return;
				}else{
					for(i=0; i < selectRocords.length; i++){
						var index = $(selectRocords[i]).attr("rownum");
	        			record = tableData.items[index];
	        					uuids += record.uuid+",";
					}
					uuids = uuids.substring(0, uuids.lastIndexOf(","));
					bootbox.confirm("选择了"+selectRocords.length+"条, 确认删除?", function(truthBeTold){
						if(truthBeTold){
		    				 $.ajax({
		     	                type: "POST",
		     	                url: baseURL + "/ses/tBapInterBasicInf/deleteByUuid",
		     	                data:{
		     	                	uuids:uuids
		     	                },
		     	               contentType: "application/x-www-form-urlencoded;charset=utf-8",
		     	                dataType: "json",
		     	                success: function(data) {
		            	if(data.timeout){
		            		ajaxTimeout();
		                }
		     	                	if (data.success) {
		     	                		bootbox.alert("操作成功!");
		     	                		reloadGrid();
		     	                	}else{
		     	                		bootbox.alert("操作失败！ "+data.msg);
		     	                	}
		     	    			},


		     	                error: function(error) {
		     	                	bootbox.alert("操作失败!");
		     	                }
		     		    });
		    			}else{
		    				return;
		    			}
					});
				}
			});
		});
		//添加或者修改方法
		function addOrUpdate(type,record){
			if("add" == type){
				$("#addOrUpdateWin").modal('show');
			}else if("update" == type){
				var param = {};
						param.uuid = record.uuid;
				$.ajax({
					type : "POST",
					url : baseURL + "/ses/tBapInterBasicInf/getDetail",
					data :param,
					contentType: "application/x-www-form-urlencoded;charset=utf-8",
					dataType : "json",
					success:function(data){
					<!--修改页面展示字段-->
//								document.getElementById('UUID_SHOW').value=data.data.uuid;
								document.getElementById('INTER_NM_SHOW').value=data.data.interNm;
								document.getElementById('INTER_DESC_SHOW').value=data.data.interDesc;
								document.getElementById('INTER_SUMMARY_SHOW').value=data.data.interSummary;
								document.getElementById('INTER_METHOD_NM_SHOW').value=data.data.interMethodNm;
								document.getElementById('INTER_METHOD_NM_DESC_SHOW').value=data.data.interMethodNmDesc;
								document.getElementById('INTER_CLASS_NM_SHOW').value=data.data.interClassNm;
								document.getElementById('INTER_CLASS_NM_DESC_SHOW').value=data.data.interClassNmDesc;
//								document.getElementById('TRANS_PARAME_SHOW').value=data.data.transParame;
//								document.getElementById('OUT_PARAME_SHOW').value=data.data.outParame;
								document.getElementById('IN_EXPLAIN_SHOW').value=data.data.inExplain;
								document.getElementById('OUT_EXPLAIN_SHOW').value=data.data.outExplain;
					document.getElementById('hiddenUUid').value=data.data.uuid;
					$("#addOrUpdateWin").modal('show');
					},
					error:function(){
						alert("操作失败，请重新操作！")
					}
				});
			}else{
				bootbox.alert("操作错误，请重新操作！");
    			return;
			}
		}
		//下拉框码表中加载数据(使用系统表)
		function getComboStore(value,element,type_code,isdisabled) {
	    	$.ajax({
	            type: "GET",
	            url: baseURL+"/code/query/typ/" + type_code,
	            contentType: "application/json;charset=utf-8",
	            dataType: "json",
	            success: function(data) {
	            	if(data.timeout){
	            		ajaxTimeout();
	                }
	                $("#" + element).empty();
	                $("#" + element).append($("<option></option>").val("").text("全部"));
	                $.each(data, function(index, obj) {
	                	$("#" + element).append($("<option></option>").val(obj.cdVl).text(obj.cdNm));
	                });
	              	//更新内容刷新到相应的位置
	                $("#" + element).selectpicker('render');
	                $("#" + element).selectpicker('refresh');
	                $("#" + element).selectpicker('val', value);
	                if(isdisabled){
	                	$("#" + element).attr('disabled', true);
	                }
	            },
	            error: function(error) {
	            }
	        });
	    }
		function initDefaultDate(){
	    	var myDate = new Date();
	    	var tempMonth;
	    	if(myDate.getMonth()<9){
	    		tempMonth = '0'+ (myDate.getMonth() + 1);
	    	}else{
	    		tempMonth = myDate.getMonth() + 1;
	    	}
	    	var tempDay;
	    	if(myDate.getDate()<=9){
	    		tempDay = '0'+ myDate.getDate();
	    	}else{
	    		tempDay = myDate.getDate();
	    	}
	    	var dateString = myDate.getFullYear()+"/"+tempMonth+"/"+tempDay;
	    }


		var queryInner_Path = baseURL + "/ses/tBapInterBasicInf/query";
		//实现查询按钮方法
		function reloadGrid(){
			$('#queryMecGrid > tbody').empty();

	    	if(limit==0) {
	    		//默认20条
	    		limit=$("#limit").val();
	    	}
	    	start=(page-1)*limit;

			//获取筛选条件输入值
			var param = {page:page,start:start,limit:limit};
			App.blockUI({target:"body",boxed:!0,message:"查询中，请稍后...",zIndex:12000});
			$.ajax({
				type: "POST",
				url: queryInner_Path,
				contentType: "application/x-www-form-urlencoded;charset=utf-8",
				data: param,
				dataType: "json",
				success:function(data){
					if(data.timeout){
	            		ajaxTimeout();
	                }
					toalPage=Math.ceil(data.totalCount/limit);
					$("#itemCount").text(data.totalCount);
					$("#nowpage").text(page);
					$("#toalPage").text(toalPage);
					if (toalPage < 2) {
	    				$("#pagination").hide();
	    			} else {
	    				$("#pagination").show();
	    			}
					tableData = $.extend(true, {}, data);
    			    $("#queryMecGrid").DataTable().clear().draw();
    			    $.each(data.items,function(index,obj){
    			    	var trData = [];
    			    	trData.push("<input type=\"checkbox\" class=\"checkboxes\" onclick=\"clickCheck(this)\" rownum=\""+index+"\" />");
    			    	trData.push(start + index + 1);
    			    			trData.push(obj.interNm);
    			    			trData.push(obj.interDesc);
    			    			trData.push(obj.interSummary);
    			    			trData.push(obj.interMethodNm);
    			    			trData.push(obj.interMethodNmDesc);
    			    			trData.push(obj.interClassNm);
    			    			trData.push(obj.interClassNmDesc);
    			    			trData.push(obj.transParame);
    			    			trData.push(obj.outParame);
    			    			trData.push(obj.inExplain);
    			    			trData.push(obj.outExplain);
    			    		trData.push("<a href='javascript:void(0)'  onclick=genarate('"+obj.uuid+"')><i class='fa fa-plus'></i>生成文档</a>");
    			    	for(i=0; i < trData.length; i++){
    			    		if(trData[i] == undefined){
    			    			trData[i] = '';
    			    		}
    			    	}
                       	$("#queryMecGrid").DataTable().row.add(trData).draw();
    			    });
    			    $("#queryMecGrid").DataTable().order([1, 'asc']).draw();
    			    $("#pagination-bar").show();
    			    if (page == 1) {
                    	//first page
                    	$("#pagination .prev a").css({'color':'gray','cursor':'not-allowed'});
                    } else {
                    	$("#pagination .prev a").css({'color':'#23527c','cursor':'pointer'});
                    }
                    if (page == toalPage) {
                    	// last page
                    	$("#pagination .next a").css({'color':'gray','cursor':'not-allowed'});
                    } else {
                    	$("#pagination .next a").css({'color':'#23527c','cursor':'pointer'});
                    }
                  	//动态设置iframe高度
                    //var currentTabId = $("#tab-bar", parent.document).children('li.active').children('a').attr('href').replace('#tab_','');
                    //setIframeHeight($('#frame_'+currentTabId,parent.document)[0]);
				},
				error:function(error){

				}
			});

		}
		function allotTiming_cancel_btn(level) {

                $("#allotTimingWin"+level).modal('hide');
                if (level==""){
                    indexCount1 = 15;
                }
                else if(level=="2"){
                    indexCount2 = 15;
                }
                else {
                    indexCount3 = 15;
                }
        }

        var indexCount;
        var indexCount1 = 15;
        var indexCount2 = 15;
        var indexCount3 = 15;
        function addTableRow(level){

            if (level=="1"){
                indexCount=indexCount1;
                indexCount += 1
                indexCount1=indexCount;
            }
            if (level=="2"){
                indexCount=indexCount2;
                indexCount += 1
                indexCount2=indexCount;
            }
            if (level=="3"){
                indexCount=indexCount3;
                indexCount += 1
                indexCount3=indexCount;
            }

            var tr = $("<tr style='display:none' id='"+level+"tr_"+indexCount+"'></tr>");

			/*第一列  */
            var td = $("<td class='nowrap'></td>");
            td.append($("<input type='checkbox' class='group-checkable' id='"+indexCount+"' />"));
            tr.append(td);

			/*第二列  */
            var td = $("<td class='nowrap'></td>");
            td.append($("<input name='pointTime' id='"+level+"pointTime_"+indexCount+"' class='form-control'/>"));
            tr.append(td);

			/*第三列  */
            var td = $("<td class='nowrap'></td>");
            td.append($("<select id='"+level+"payFlg_"+indexCount+"' name='payFlg' class=' form-control' data-show-subtext='true' onchange='selectOnchang("+indexCount+","+level+")'><option value='String' selected='selected'>String</option><option value='Bigdecimal'>Bigdecimal</option><option value='Object'>Object</option><option value='int'>int</option></select>"));
            tr.append(td);

			/*第四列  */
            var td = $("<td class='nowrap'></td>");
            td.append($("<select name='keepAmt' id='"+level+"keepAmt_"+indexCount+"' class='form-control' data-show-subtext='true'>  <option value='是' selected='selected'>是</option><option value='否'>否</option> </select>"));
            tr.append(td);

			/*第五列  */
            var td = $("<td class='nowrap'></td>");
            td.append($("<input name='fixedAmt' id='"+level+"fixedAmt_"+indexCount+"' class='form-control'/>"));
            tr.append(td);

			/*第六列  */
            var td = $("<td class='nowrap'></td>");
            td.append($("<button style='display:none;' name='add_Button' onclick='addMyObject("+indexCount+","+level+");return false' id='"+level+"add_Button_"+indexCount+"' class='form-control'>添加</button>"));
            tr.append(td);

			/*第七列  */
            var td = $("<td class='nowrap'></td>");
            td.append($("<input style='display: none' name='level_UUID' id='level_UUID_"+indexCount+"' class='form-control'/>"));
            tr.append(td);

			if(level=="1"){
                $("#allotTimingTable tbody").append(tr);
            }else {
                $("#allotTimingTable"+level+" tbody").append(tr);
            }
            var element =level+"tr_"+indexCount;
            $("#" + element).show();
        }

        // 下拉框事件
        function selectOnchang(indexCount,level){

            var type = document.getElementById(level+"payFlg_"+indexCount).value;
            if ('Object' == type) {
                $("#"+level+"add_Button_"+indexCount).css('display','block');
            }
            else {
                $("#"+level+"add_Button_"+indexCount).css('display','none');
            }

        }

        function addMyObject(indexCount,level){



//            $("#level_UUID_"+indexCount).val("111");
//			    alert(document.getElementById("level_UUID_"+indexCount).value);
			if(level=="1"){
                $("#allotTimingTable2").DataTable().clear().draw();
                $("#allotTimingWin2").modal('show');
            }
            if(level=="2"){

			    $("#allotTimingTable3").DataTable().clear().draw();
                $("#allotTimingWin3").modal('show');
            }

        }

        // 删除传入参数的表格
        function delTableRow(level){

            var selectRocords = $("#allotTimingTable"+level+" tbody input:checked");
            if (selectRocords.length <= 0) {
                bootbox.alert("请选择要删除的数据！");
                return;
            }else {
                for(i=0; i < selectRocords.length; i ++) {
                    var tr = selectRocords[i].parentNode.parentNode;
                    var tbody = tr.parentNode;
                    tbody.removeChild(tr);
                }
            }
        }

        $("#add_btn_in").on('click', function() {
            $("#allotTimingTable").DataTable().clear().draw();
            $("#allotTimingWin").modal('show');
            paraFlag="in";
            initPara();
        });
        $("#add_btn_out").on('click', function() {
            $("#allotTimingTable").DataTable().clear().draw();
            $("#allotTimingWin").modal('show');
            paraFlag="out";
            initPara();
        });
		//初始化参数
		function initPara() {
            var demo;
            indexCount=demo;
            indexCount1 = 15;
            indexCount2 = 15;
            indexCount3 = 15;
        }

        //全选传入参数数据
        function checkAllotTimingAll(checked) {
            $("#allotTimingTable tbody :checkbox").prop('checked', checked);
        }
        function uuid(){
            return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g,function(c){
                var r=Math.random()*16|0,
                    v=c=='x'?r:(r&0x3|0x8);
                return v.toString(16)
            }).toUpperCase()
        }
        // 传入参数保存按钮

		function saveTableRow(level){

            savePara(paraFlag,level);
            if (level==""){
                indexCount1 = 15;
            }
            else if(level=="2"){
                indexCount2 = 15;
            }
            else {
                indexCount3 = 15;
            }
        }

		function savePara(type,level) {
            var table = document.getElementById("allotTimingTable"+level);
            var rows = table.rows.length;
            var array = [];
            var a = 0;
            if (level==""){
                level="1";
            }

            if(level=="1"){

                for (i = 15; i <=indexCount1; i++){
                    if(document.getElementById(i)){

                        var row = {};
                        row.fieldTyp = document.getElementById(level+"payFlg_"+i).value.trim();
                        row.required = document.getElementById(level+"keepAmt_"+i).value.trim();
                        row.remarks = document.getElementById(level+"fixedAmt_"+i).value.trim();
                        row.fieldNm = document.getElementById(level+"pointTime_"+i).value.trim();
                    }
                    else {
                        continue;
                    }
                    array[a] = row;
                    a++;
                }
                var param = {};
                param.datas = array;
                param.level="1";
                var myuuid=uuid();
                if (type=="in"){
                    param.uuid="IN_"+myuuid;
                    var allotTimingDatas = JSON.stringify(param);
                    paraDateIn=allotTimingDatas;
                }
                else{
                    param.uuid="OUT_"+myuuid;
                    var allotTimingDatas = JSON.stringify(param);
                    paraDateOut=allotTimingDatas;
                }
                $("#allotTimingWin").modal('hide');
            }
            if(level=="2"){
                for (i = 15; i <=indexCount2; i++){
                    if(document.getElementById(i)){

                        var row = {};
                        row.fieldTyp = document.getElementById(level+"payFlg_"+i).value.trim();
                        row.required = document.getElementById(level+"keepAmt_"+i).value.trim();
                        row.remarks = document.getElementById(level+"fixedAmt_"+i).value.trim();
                        row.fieldNm = document.getElementById(level+"pointTime_"+i).value.trim();
                    }
                    else {
                        continue;
                    }
                    array[a] = row;
                    a++;
                }
                var param = {};
                param.datas = array;
                param.level="2";
                var myuuid=uuid();
                if (type=="in"){
                    param.uuid="IN_"+myuuid;
                    var allotTimingDatas = JSON.stringify(param);
                    paraDateIn2=allotTimingDatas;
                }
                else{
                    param.uuid="OUT_"+myuuid;
                    var allotTimingDatas = JSON.stringify(param);
                    paraDateOut2=allotTimingDatas;
                }
                $("#allotTimingWin2").modal('hide');
            }
            if(level=="3"){
                for (i = 15; i <=indexCount3; i++){
                    if(document.getElementById(i)){

                        var row = {};
                        row.fieldTyp = document.getElementById(level+"payFlg_"+i).value.trim();
                        row.required = document.getElementById(level+"keepAmt_"+i).value.trim();
                        row.remarks = document.getElementById(level+"fixedAmt_"+i).value.trim();
                        row.fieldNm = document.getElementById(level+"pointTime_"+i).value.trim();
                    }
                    else {
                        continue;
                    }
                    array[a] = row;
                    a++;
                }
                var param = {};
                param.datas = array;
                param.level="3";
                var myuuid=uuid();
                if (type=="in"){
                    param.uuid="IN_"+myuuid;
                    var allotTimingDatas = JSON.stringify(param);
                    paraDateIn3=allotTimingDatas;
                }
                else{
                    param.uuid="OUT_"+myuuid;
                    var allotTimingDatas = JSON.stringify(param);
                    paraDateOut3=allotTimingDatas;
                }
                $("#allotTimingWin3").modal('hide');
            }



        }
		<!--操作链接点击事件-->
		function genarate(uuid){


            window.open(baseURL + "/ses/tBapInterBasicInf/generate?uuid="+uuid);


		}
		//弹出页面取消按钮（详情）
		$("#openform_cancel_btn").on('click',function(){
			$("#viewWin").modal('hide');
		});
	</script>

</body>

</html>
