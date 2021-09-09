<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/style.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.8.3.min.js"></script>
	<script>
		jQuery(function ($) {
			// ajax异步加载商品列表
			function load() {
				$.ajax({
					url: "/product/products.json",
					success: function (data) {
						// data: [{id:1,name:"xxx"},{id:2, name:"xxx"},...]
						var arr = [];
						$(data).each(function (i) {
							arr.push(`<tr>
							<td align="center">
								<input value="`+this.id+`" type="checkbox" name="chk" />
							</td>
							<td style="height: 22px" align="center">`+(i+1)+`</td>
							<td style="height: 22px" align="left">`+this.name+`</td>
							<td style="height: 22px" align="center">`+this.price+`</td>
							<td style="height: 22px" align="center">`+this.num+`</td>
							<td style="height: 22px" align="left"><div>`+this.description+`</div></td>
							<td align="center">
								<img edit="`+this.id+`" src="${pageContext.request.contextPath}/static/images/i_edit.gif" border="0" style="cursor: hand">&nbsp;&nbsp;
								<img delete="`+this.id+`" src="${pageContext.request.contextPath}/static/images/i_del.gif" border="0" style="cursor: hand">
							</td>
						</tr>`)
						});

						// 改变元素中的html内容
						$("#dataBody").html( arr.join("") );
					}
				});
			}
			load();
			$("#loadData").click(function () {
				load();
			});
		});
	</script>
</head>
<body>
<div style="padding: 10px;">
	<div class="option">
		<input id="addBtn" type="button" value="添加" />
		<input id="deleteSelected" type="button" value="删除选中" />
		<input id="loadData" type="button" value="ajax加载列表" />
	</div>
	<table cellspacing="0" cellpadding="0" bordercolor="gray" border="1" width="100%">
		<thead>
			<tr style="font-weight: bold; font-size: 12pt; height: 25px; background-color: #afd1f3">
				<td width="40px" align="center">
					<input type="checkbox" id="selectAll" />
				</td>
				<td width="80px" align="center">序号</td>
				<td width="" align="center">商品名称</td>
				<td width="100px" align="center">商品价格</td>
				<td width="100px" align="center">剩余数量</td>
				<td width="500px" align="center">商品描述</td>
				<td width="120px" align="center">编辑</td>
			</tr>
		</thead>
		<tbody id="dataBody"></tbody>
	</table>
</div>
</body>
</html>