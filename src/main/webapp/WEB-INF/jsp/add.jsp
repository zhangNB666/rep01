<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css" />
</head>
<body>
	<%--
		完善form表单：
			1. action: 提交的servlet地址
			2. method: 提交方式post
			3. 表单元素必须包含name属性，否则数据不会提交，name属性的值就是参数的名字
	--%>
	<form action="/product/add.do" method="post">
		<table cellSpacing="1" cellPadding="5" align="center">
			<tr>
				<td class="ta_01" bgColor="#afd1f3" colSpan="2" height="26">
					<strong>添加商品</strong>
				</td>
			</tr>
			<tr>
				<td width="30%" align="center" bgColor="#f5fafe" class="ta_01">
					商品名称：
				</td>
				<td class="ta_01" bgColor="#ffffff">
					<input name="name" type="text" class="bg"/>
				</td>
			</tr>
			<tr>
				<td align="center" bgColor="#f5fafe" class="ta_01">
					商品价格：
				</td>
				<td class="ta_01" bgColor="#ffffff">
					<input name="price" type="text" class="bg"/>
				</td>
			</tr>
			<tr>
				<td align="center" bgColor="#f5fafe" class="ta_01">
					库存数量：
				</td>
				<td class="ta_01" bgColor="#ffffff">
					<input name="num" type="text" class="bg" />
				</td>
			</tr>
			<tr>
				<td align="center" bgColor="#f5fafe" class="ta_01">
					商品描述：
				</td>
				<td class="ta_01" bgColor="#ffffff" colspan="3">
					<textarea name="description1" rows="5" style="width:100%;"></textarea>
				</td>
			</tr>
			<tr>
				<td class="ta_01" style="WIDTH: 100%" align="center" bgColor="#f5fafe" colSpan="2">
					<input type="submit" value="确定" />&nbsp;&nbsp;
					<input type="reset" value="重置" />&nbsp;&nbsp;
					<input id="goBack" type="button" value="返回" onclick="history.go(-1)" />
				</td>
			</tr>
		</table>
	</form>
</body>
</html>