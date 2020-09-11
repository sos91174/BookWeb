<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>結算頁面</title>

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
			<img class="logo_img" alt="" src="../../static/img/1.jpg" >
			<span class="wel_word">付款</span>

		<%--靜態包含，登入 成功之後的菜單 --%>
		<%@ include file="/pages/common/login_success_menu.jsp"%>


	</div>
	
	<div id="main">
		
		<h1>你的訂單已付款完成，訂單號為: ${sessionScope.orderId}</h1>
		
	
	</div>


	<%--靜態包含頁腳内容--%>
	<%@include file="/pages/common/footer.jsp"%>


</body>
</html>