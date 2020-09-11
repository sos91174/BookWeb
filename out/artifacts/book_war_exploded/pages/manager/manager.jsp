<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>後台管理</title>

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
			<span class="wel_word">後台管理系统</span>

		<%-- 靜態包含 manager管理模塊的菜單  --%>
		<%@include file="/pages/common/manager_menu.jsp"%>


	</div>
	
	<div id="main">
		<h1>歡迎管理員進入後台管理系统</h1>
	</div>


	<%--靜態包含頁尾内容--%>
	<%@include file="/pages/common/footer.jsp"%>


</body>
</html>