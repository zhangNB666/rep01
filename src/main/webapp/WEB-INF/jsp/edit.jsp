<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css" />
</head>
<body>
	<form action="/product/edit.do" method="post">
		<%--id作为更新条件使用隐藏域存放--%>
		<input name="id" value="${product.id}" type="hidden" />

		<table cellSpacing="1" cellPadding="5" align="center">
			<tr>
				<td class="ta_01" bgColor="#afd1f3" colSpan="2" height="26">
					<strong>修改商品</strong>
				</td>
			</tr>
			<tr>
				<td width="30%" align="center" bgColor="#f5fafe" class="ta_01">
					商品名称：
				</td>
				<td class="ta_01" bgColor="#ffffff">
					<input name="name" type="text" class="bg" value="${product.name}" />
				</td>
			</tr>
			<tr>
				<td align="center" bgColor="#f5fafe" class="ta_01">
					商品价格：
				</td>
				<td class="ta_01" bgColor="#ffffff">
					<input name="price" type="text" class="bg" value="${product.price}"/>
				</td>
			</tr>
			<tr>
				<td align="center" bgColor="#f5fafe" class="ta_01">
					库存数量：
				</td>
				<td class="ta_01" bgColor="#ffffff">
					<input name="num" type="text" class="bg" value="${product.num}" />
				</td>
			</tr>
			<tr>
				<td align="center" bgColor="#f5fafe" class="ta_01">
					商品描述：
				</td>
				<td class="ta_01" bgColor="#ffffff" colspan="3">
					<textarea name="description" rows="5" style="width:100%;">${product.description}</textarea>
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