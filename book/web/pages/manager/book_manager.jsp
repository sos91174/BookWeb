<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品管理</title>

	<%-- 靜態包含 base標籤、css、jQuery文件 --%>
	<%@ include file="/pages/common/head.jsp"%>
	<script type="text/javascript">
		$(function () {
			// 給刪除的a標籤绑定點擊事件，用於删除的確認提示操作
			$("a.deleteClass").click(function () {
				// 在事件的function函數中，有一個this對象。這個this對象，是當前正在響應事件的dom對象。
				/**
				 * confirm是確認提示框函數
				 * 參數是它的提示内容
				 * 它有兩個按鈕，一個確認，一個是取消。
				 * 返回true表示點擊了確認，返回false則表示點擊取消。
				 */
				return confirm("你卻定要删除【" + $(this).parent().parent().find("td:first").text() + "】?");
				// return false// 阻止元素的默認行為===不提交請求
			});
		});
	</script>

</head>
<body>
	
	<div id="header">
			<img class="logo_img" alt="" src="../../static/img/" >
			<span class="wel_word">商品管理系统</span>

		<%-- 靜態包含 manager管理模塊的菜單  --%>
		<%@include file="/pages/common/manager_menu.jsp"%>


	</div>
	
	<div id="main">
		<table>
			<tr>
				<td>名稱</td>
				<td>價格</td>
				<td>作者</td>
				<td>銷售量</td>
				<td>庫存量</td>
				<td colspan="2">執行</td>
			</tr>		

			<c:forEach items="${requestScope.page.items}" var="book">
				<tr>
					<td>${book.name}</td>
					<td>${book.price}</td>
					<td>${book.author}</td>
					<td>${book.sales}</td>
					<td>${book.stock}</td>
					<td><a href="manager/bookServlet?action=getBook&id=${book.id}&pageNo=${requestScope.page.pageNo}">修改</a></td>
					<td><a class="deleteClass" href="manager/bookServlet?action=delete&id=${book.id}&pageNo=${requestScope.page.pageNo}">刪除</a></td>
				</tr>
			</c:forEach>

			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td><a href="pages/manager/book_edit.jsp?pageNo=${requestScope.page.pageTotal}">添加商品</a></td>
			</tr>	
		</table>


		<%--靜態包含分頁--%>
		<%@include file="/pages/common/page_nav.jsp"%>




	</div>


	<%--靜態包含頁尾内容--%>
	<%@include file="/pages/common/footer.jsp"%>


</body>
</html>