<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<!-- 네이버 로그인 API -->
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

<script type="text/javascript" src="/resources/assets/js/member.js"></script>
<link href="/resources/assets/css/member.css" rel="stylesheet">
</head>
<body onload="loginCheck('${code}')">


	<section class="join-form"
		style="margin-top: 100px; margin-bottom: 100px;">

		<div class="lTitleA"
			style="margin-top: 50px; margin-bottom: 30px; text-align: center;">
			<h3 style="font-weight: bold;">LOGIN</h3>
		</div>

		<div class="mlogin">
			<fieldset class="field">
				<form action="/login/loginPro.toy" method="post">

					<table class="join-table input-form" align="center">
						<thead>
							<!-- <tr>
						<th colspan="2" class="formHeader">LOGIN</th>
					</tr> -->
						</thead>

						<tbody>
							<tr>
								<th><label for="m_email" class="form-header"
									style="font-size: 14.5px;">아이디</label></th>
								<td><input type="text" class="form-control"
									style="font-size: 13px;" id="m_email" name="m_email"
									placeholder="이메일 형식으로 입력해주세요."></td>
							</tr>
							<tr>
								<th><label for="m_password" class="form-header"
									style="font-size: 14.5px;">비밀번호</label></th>
								<td><input type="password" class="form-control"
									id="m_password" name="m_password" placeholder="····"></td>
							</tr>

							<tr>
								<td colspan="2" align="center" height="25"></td>
							</tr>

							<tr>
								<td colspan="2" align="center">
									<button type="button" class="btn btn-login" id="login-btn">로그인</button>
								</td>
							</tr>

							<tr>
								<td colspan="2" align="center" height="10"></td>
							</tr>

							<tr>
								<td colspan="2" align="center">
									<button type="button" id="joinForm" class="Lbt"
										style="padding-right: 20px; padding-left: 20px;">회원가입</button>
									<button type="button" id="findId" class="Lbt"
										style="padding-right: 20px; padding-left: 20px;">아이디찾기</button>
									<button type="button" id="findPw" class="Lbt"
										style="border-right: 1px solid #fff; padding-left: 20px;">비밀번호
										찾기</button>
								</td>
							</tr>

						</tbody>
					</table>
		</form>
					<!-- 네이버 로그인 버튼 노출 영역 -->
					<div id="naver_id_login"
						style="text-align: center; margin-top: 21px;"></div>
					<!-- //네이버 로그인 버튼 노출 영역 -->
					<script type="text/javascript">
					  	var naver_id_login = new naver_id_login("43wP2dYx4JznPIszkbF1", "http://localhost:8080/login/loginPro.toy");
					  	var state = naver_id_login.getUniqState();
					  	naver_id_login.setButton("white", 2,40);
					  	naver_id_login.setDomain("http://localhost:8080/login/login.toy");
					  	naver_id_login.setState(state);
					  	naver_id_login.setPopup();
					  	naver_id_login.init_naver_id_login();
					  </script>
					
					<!-- <script type="text/javascript">
						var naver_id_login = new naver_id_login(
								"43wP2dYx4JznPIszkbF1",
								"http://localhost:8080/login/loginPro.toy");
						var state = naver_id_login.getUniqState();
						naver_id_login.setButton("green", 3, 50);
						naver_id_login
								.setDomain("http://localhost:8080/main.toy");
						naver_id_login.setState(state);
						/* naver_id_login.setPopup(); */
						naver_id_login.init_naver_id_login();
					</script> -->
		</fieldset>


	</section>


</body>
</html>