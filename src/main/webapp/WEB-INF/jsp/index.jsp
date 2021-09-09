<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/style.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.8.3.min.js"></script>
	<script>
		jQuery(function ($) {
			// 给删除图标绑定点击事件，执行删除操作
			// 包含delete属性的img元素
			// [属性名=值]：属性过滤选择器
			$("img[delete]").click(function () {
				// this是点击的元素，$(this)：jQuery对象
				// 获取商品的id，作为删除的条件
				// var id = this.getAttribute("delete"); // 原生DOM操作
				var id = $(this).attr("delete"); // 获取delete属性的值（商品id）

				// confirm: 确认框，点击确定返回true，取消返回false
				if ( confirm("确定删除吗？") ) {
					location = "/product/delete.do?id=" + id;
				}
			});

			$("#deleteSelected").click(function () {
				// 获取选中的复选框（中的值：商品id）
				var $cks = $(":checkbox[name=chk]:checked");

				if ($cks.size() == 0) {
					alert("请选择删除项！");
					return ;
				}
				/*if (confirm("确定删除吗？") == false) {
					return ;
				}*/
				if ( !confirm("确定删除吗？") ) return ;

				// 处理id：id=1,2,3   将id以逗号分隔
				var arr = []; // 声明一个空数组
				$cks.each(function () {
					arr.push( this.value ); // 向数组中添加元素
				});
				// [1,2,3] ===> "1,2,3"
				var id = arr.join(","); // 将数组中的元素使用指定的字符串连接起来，并返回连接后的字符串
				//alert(id);
				//location = "/delete.do?id=1,2,3";
				location = "/product/delete.do?id=" + id;
			});

			$("#selectAll").click(function () {
				// 让复选框的选中状态和全选按钮的选中状态一致
				var checked = this.checked;
				// 显示迭代
				/*$(":checkbox[name=chk]").each(function () {
					this.checked = checked;
				});*/

				// prop: property
				// jQuery隐式迭代，无需手动遍历
				$(":checkbox[name=chk]").prop("checked", this.checked);
			});

			$(":checkbox[name=chk]").click(function () {
				$("#selectAll").prop("checked", $(":checkbox[name=chk]").size()==$(":checkbox[name=chk]:checked").size());
			});

			$("#addBtn").click(function () {
				// /表示服务器的根目录，webapp就是服务器的根目录
				location = "/add.jsp";
			})


			$("img[edit]").click(function () {
				location = "/product/edit.html?id=" + $(this).attr("edit");
			});
		});
	</script>
</head>
<body>
<div style="padding: 10px;">
	<div class="option">
		<input id="addBtn" type="button" value="添加" />
		<input id="deleteSelected" type="button" value="删除选中" />
	</div>
	<table cellspacing="0" cellpadding="0" bordercolor="gray" border="1" width="100%">
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
		<c:forEach items="${pList}" var="p" varStatus="sta">
		<tr>
			<td align="center">
				<input value="${p.id}" type="checkbox" name="chk" />
			</td>
			<td style="height: 22px" align="center">${sta.count}</td>
			<td style="height: 22px" align="left">${p.name}</td>
			<td style="height: 22px" align="center">${p.price}</td>
			<td style="height: 22px" align="center">${p.num}</td>
			<td style="height: 22px" align="left"><div>${p.description}</div></td>
			<td align="center">
				<img edit="${p.id}" src="${pageContext.request.contextPath}/static/images/i_edit.gif" border="0" style="cursor: hand">&nbsp;&nbsp;
				<img delete="${p.id}" src="${pageContext.request.contextPath}/static/images/i_del.gif" border="0" style="cursor: hand">
			</td>
		</tr>
		</c:forEach>
	</table>
</div>
</body>
</html>