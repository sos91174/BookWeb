<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>我的訂單</title>

	<%-- 靜態包含 base標籤、css、jQuery文件 --%>
	<%@ include file="/pages/common/head.jsp"%>


	<style type="text/css">
	h1 {
		text-align: center;
		margin-top: 200px;
	}
</style>
</head>
<body>
	
	<div id="header">
			<img class="logo_img" alt="" src="../../static/img/" >
			<span class="wel_word">我的訂單</span>

		<%--静態包含，登入成功之後的菜單 --%>
		<%@ include file="/pages/common/login_success_menu.jsp"%>


	</div>
	
	<div id="main">
		
		<table>
			<tr>
				<td>日期</td>
				<td>金額</td>
				<td>狀態</td>
				<td>詳情</td>
			</tr>		
			<tr>
				<td>2020.08.23</td>
				<td>90.00</td>
				<td>未發貨</td>
				<td><a href="#">查看詳情</a></td>
			</tr>	
			
			<tr>
				<td>2020.08.20</td>
				<td>20.00</td>
				<td>已發貨</td>
				<td><a href="#">查看詳情</a></td>
			</tr>	
			
			<tr>
				<td>2020.08.23</td>
				<td>190.00</td>
				<td>已完成</td>
				<td><a href="#">查看詳情</a></td>
			</tr>		
		</table>
		
	
	</div>


	<%--静態包含頁尾内容--%>
	<%@include file="/pages/common/footer.jsp"%>


</body>
</html>