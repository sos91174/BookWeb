<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>訂單管理</title>

	<%-- 靜態包含 base標籤、css、jQuery文件 --%>
	<%@ include file="/pages/common/head.jsp"%>


</head>
<body>
	
	<div id="header">
			<img class="logo_img" alt="" src="../../static/img/" >
			<span class="wel_word">訂單管理系统</span>

		<%-- 静態包含 manager管理模塊的菜單  --%>
		<%@include file="/pages/common/manager_menu.jsp"%>

	</div>
	
	<div id="main">
		<table>
			<tr>
				<td>日期</td>
				<td>金額</td>
				<td>詳情</td>
				<td>發貨</td>
				
			</tr>		
			<tr>
				<td>2020.08.23</td>
				<td>90.00</td>
				<td><a href="#">查看詳情</a></td>
				<td><a href="#">點擊發貨</a></td>
			</tr>	
			
			<tr>
				<td>2020.08.20</td>
				<td>20.00</td>
				<td><a href="#">查看詳情</a></td>
				<td>已發貨</td>
			</tr>	
			
			<tr>
				<td>2020.08.23</td>
				<td>190.00</td>
				<td><a href="#">查看詳情</a></td>
				<td>等待收貨</td>
			</tr>		
		</table>
	</div>


	<%--静態包含頁尾内容--%>
	<%@include file="/pages/common/footer.jsp"%>


</body>
</html>