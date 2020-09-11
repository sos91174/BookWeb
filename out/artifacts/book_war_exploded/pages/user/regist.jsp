<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>商城會員註冊</title>

		<%-- 靜態包含 base標籤、css、jQuery文件 --%>
		<%@ include file="/pages/common/head.jsp"%>


		<script type="text/javascript">
			// 頁面加載完成後
			$(function () {

				// 給驗證碼的圖片，绑定點擊事件
				$("#code_img").click(function () {
					// 在事件響應的function函数中有一個this對象。這個this對象，是當前正在響應事件的dom對象
					// src數性表示驗證碼img標籤的 圖片路徑。它可讀可寫
					// alert(this.src);
					this.src = "${basePath}kaptcha.jpg?d=" + new Date();
				});

				// 给註冊綁定點擊事件
				$("#sub_btn").click(function () {
					// 驗證用戶名：必需由字母，數字组成，長度需要5到12位
					//1 獲取用戶名輸入框裡的内容
					var usernameText = $("#username").val();
					//2 創建正則表達式對象
					var usernamePatt = /^\w{5,12}$/;
					//3 使用test方法驗證
					if (!usernamePatt.test(usernameText)) {
						//4 提示用戶结果
						$("span.errorMsg").text("用戶名不符合！");

						return false;
					}

					// 驗證密碼：必須由字母，數字组成，且長度為5到12位
					//1 獲取用戶名輸入框裡的内容
					var passwordText = $("#password").val();
					//2 創建正則表達式對象
					var passwordPatt = /^\w{5,12}$/;
					//3 使用test方法驗證
					if (!passwordPatt.test(passwordText)) {
						//4 提示用户结果
						$("span.errorMsg").text("密碼不符合！");

						return false;
					}

					// 驗證確認密碼：和密碼相同
					//1 獲取密碼的内容
					var repwdText = $("#repwd").val();
					//2 和密碼互相比較
					if (repwdText != passwordText) {
						//3 提示用戶
						$("span.errorMsg").text("你的確認密碼和密碼不相同！");

						return false;
					}

					// 信箱驗證：xxxxx@xxx.com
					//1 獲取信箱的内容
					var emailText = $("#email").val();
					//2 創造正則表達式對象
					var emailPatt = /^[a-z\d]+(\.[a-z\d]+)*@([\da-z](-[\da-z])?)+(\.{1,2}[a-z]+)+$/;
					//3 使用test方法驗證是否合法
					if (!emailPatt.test(emailText)) {
						//4 提示用戶
						$("span.errorMsg").text("信箱格式不符合規定！");

						return false;
					}

					// 驗證碼：现在只需要驗證用戶已輸入。
					var codeText = $("#code").val();

					//去掉驗證碼空格
					// alert("去空格前：["+codeText+"]")
					codeText = $.trim(codeText);
					// alert("去空格後：["+codeText+"]")

					if (codeText == null || codeText == "") {
						//4 提示用戶
						$("span.errorMsg").text("驗證碼不能空白！");

						return false;
					}

					// 去掉錯誤訊息
					$("span.errorMsg").text("");

				});

			});

		</script>
	<style type="text/css">
		.login_form{
			height:420px;
			margin-top: 25px;
		}

	</style>
	</head>


	<body>
		<div id="login_header">
			<img class="logo_img" alt="" src="static/img/" >
			<span class="wel_word">註冊頁面</span>
		</div>

			<div class="login_banner">

				<div id="l_content">
					<span class="login_word">歡迎註冊</span>
				</div>

				<div id="content">
					<div class="login_form">
						<div class="login_box">
							<div class="tit">
								<h1>註冊商城會員</h1>
								<span class="errorMsg">
									${ requestScope.msg }
								</span>
							</div>
							<div class="form">
								<form action="userServlet" method="post">
									<input type="hidden" name="action" value="regist">
									<label>用戶名稱：</label>
									<input class="itxt" type="text" placeholder="請輸入用戶名"
										   value="${requestScope.username}"
										   autocomplete="off" tabindex="1" name="username" id="username" />
									<br />
									<br />
									<label>用戶密碼：</label>
									<input class="itxt" type="password" placeholder="請輸入密碼"
										   autocomplete="off" tabindex="1" name="password" id="password" />
									<br />
									<br />
									<label>確認密碼：</label>
									<input class="itxt" type="password" placeholder="確認密碼"
										   autocomplete="off" tabindex="1" name="repwd" id="repwd" />
									<br />
									<br />
									<label>電子信箱：</label>
									<input class="itxt" type="text" placeholder="請輸入信箱地址"
										   value="${requestScope.email}"
										   autocomplete="off" tabindex="1" name="email" id="email" />
									<br />
									<br />
									<label>驗證碼：</label>
									<input class="itxt" type="text" name="code" style="width: 80px;" id="code" />
									<img id="code_img" alt="" src="kaptcha.jpg" style="float: right; margin-right: 40px; width: 110px; height: 30px;">
									<br />
									<br />
									<input type="submit" value="註冊" id="sub_btn" />
								</form>
							</div>

						</div>
					</div>
				</div>
			</div>

		<%--静態包含頁尾内容--%>
		<%@include file="/pages/common/footer.jsp"%>


	</body>
</html>