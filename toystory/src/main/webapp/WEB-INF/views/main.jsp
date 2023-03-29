<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

<style>
.my_img {
	filter: brightness(1);
}

.my_img:hover {
	filter: brightness(0.92);
}
</style>
</head>
<body>

	<!-- ======= 배너 이미지 슬라이드 ======= -->
	<section id="testimonials"
		style="margin-top: 90px; margin-bottom: -20px;">
		<div class="slides-1 swiper" data-aos-delay="80">
			<div class="swiper-wrapper">
				<div class="swiper-slide"
					style="text-align: center; justify-content: center;">
					<div class="testimonial-item">
						<img alt="banner1" src="/resources/assets/img/banner/11.png"
							class="my_img"
							onclick="location.href='/notice/detail.toy?n_num=4'"
							style="cursor: pointer;">
					</div>
				</div>
				<div class="swiper-slide"
					style="text-align: center; justify-content: center;">
					<div class="testimonial-item">
						<img alt="banner2" src="/resources/assets/img/banner/22.png"
							class="my_img"
							onclick="location.href='/goods/search.toy?keyword=DIY#goDiy'"
							style="cursor: pointer;">
					</div>
				</div>
				<div class="swiper-slide"
					style="text-align: center; justify-content: center;">
					<div class="testimonial-item">
						<img alt="banner3" src="/resources/assets/img/banner/33.png">
					</div>
				</div>
			</div>
			<div class="swiper-pagination"></div>
		</div>
	</section>
	<!-- ======= 배너 이미지 슬라이드 END ======= -->


	<!-- ======= 베스트 3 ======= -->
	<section id="sec1">
		<div class="tab-content">
			<div class="tab-pane fade active show" id="menu-starters">
				<div class="tab-header text-center">
					<h3>BEST 3</h3>
					<p>토이스토리의 베스트 상품을 소개합니다.</p>
				</div>
				<br />
				<!-- 베스트3 헤더 end -->

				<!-- 베스트 상품 보여짐  -->
				<!-- form 태그로 받아오기  -->
				<div class="container">
					<div class="row gy-5">
						<!-- 상품1 -->

						<c:forEach items="${bestProduct }" var="product">
							<div class="col-lg-4 menu-item"
								style="text-align: center; font-size: small;">
								<a href="/goods/detail.toy?g_id=${product.g_id }"><img
									src="${pageContext.request.contextPath}/resources/assets/img/image/${product.f_svname }"
									class="radius_img" alt=""></a> <br /> <strong><p
										class="ingredients" align="center">
										[
										<c:out value="${product.g_brand}" />
										]
										<c:out value="${product.g_name}" />
									</p></strong>
									<strong style="font-size: 15px;">
										<p class="price" align="center">
										<c:if test="${product.g_sale ne 0}">
											<!-- 할인중이라면 -->
											<div style="margin-bottom: 4px;">
												<span style="text-decoration: line-through; color: #c2c2c2; font-weight: normal;">
													${product.g_price }원
												</span>
												<span style="color: red;">(${product.g_sale}%)</span>
											</div>
											<c:if
												test="${(product.g_price * (100-product.g_sale)) / 100 lt 1}">
												<fmt:formatNumber type="number"
													pattern="###,###,###,###,###,###"
													value="${(product.g_price * (100-product.g_sale)) / 100 +1}" />원
		            						</c:if>
											<c:if
												test="${(product.g_price * (100-product.g_sale)) / 100 gt 1}">
												<fmt:formatNumber type="number"
													pattern="###,###,###,###,###,###"
													value="${(product.g_price * (100-product.g_sale)) / 100}" />원
		            						</c:if>
										</c:if>
										<c:if test="${product.g_sale eq 0}">
											<fmt:formatNumber type="number"
												pattern="###,###,###,###,###,###" value="${product.g_price}" />원
		            					</c:if>
										</p>
								</strong>
							</div>
						</c:forEach>




					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- ======= 신상 3 ======= -->
	<section id="sec1" style="margin-bottom: 150px">
		<div class="tab-content">
			<div class="tab-pane fade active show" id="menu-starters">
				<div class="tab-header text-center">
					<h3>NEW 3</h3>
					<p>토이스토리의 신상품을 소개합니다.</p>
				</div>
				<br />
				<!-- 신상3 헤더 end -->

				<!-- 신상품 보여짐  -->
				<!-- form 태그로 받아오기 -->
				<div class="container">
					<div class="row gy-5">

						<c:forEach items="${newProduct }" var="product">
							<div class="col-lg-4 menu-item"
								style="text-align: center; font-size: small;">
								<a href="/goods/detail.toy?g_id=${product.g_id }"><img
									src="${pageContext.request.contextPath}/resources/assets/img/image/${product.f_svname }"
									class="radius_img" alt=""></a> <br />
									<strong>
										<p class="ingredients" align="center">
											[
											<c:out value="${product.g_brand}" />
											]
											<c:out value="${product.g_name}" />
										</p>
									</strong>
								<c:if test="${product.g_sale ne 0}">
								<!-- 할인 중이라면 -->
									<div style="font-size: 15px; margin-bottom: 4px;">
										<span style="text-decoration: line-through; color: #c2c2c2; font-weight: normal;">${product.g_price }원</span>
										<span style="color: red;">&nbsp;(${product.g_sale}%)</span>
									</div>
									<p style="font-size: 15px;">
									<c:if test="${(product.g_price * (100-product.g_sale)) / 100 lt 1}">
										<fmt:formatNumber type="number"
											pattern="###,###,###,###,###,###"
											value="${(product.g_price * (100-product.g_sale)) / 100 +1}" />원
			            			</c:if>
									<c:if
										test="${(product.g_price * (100-product.g_sale)) / 100 gt 1}">
										<fmt:formatNumber type="number"
											pattern="###,###,###,###,###,###"
											value="${(product.g_price * (100-product.g_sale)) / 100}" />원
			            			</c:if>
			            			</p>
								</c:if>
								<p style="font-size: 15px;">
								<c:if test="${product.g_sale eq 0}">
									<fmt:formatNumber type="number"
										pattern="###,###,###,###,###,###" value="${product.g_price}" />원
		            			</c:if>
		            			</p>
							</div>

						</c:forEach>


					</div>
				</div>
			</div>
		</div>
	</section>

<!-- 	<script type="text/javascript">
		var naver_id_login = new naver_id_login("43wP2dYx4JznPIszkbF1",
				"http://localhost:8080/login/loginPro.toy");
		// 접근 토큰 값 출력
		// 네이버 사용자 프로필 조회
		naver_id_login.get_naver_userprofile("naverSignInCallback()");
		// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
		function naverSignInCallback() {
			 alert(naver_id_login.getProfileData('email'));
			 alert(naver_id_login.getProfileData('nickname'));
			
			var email = naver_id_login.getProfileData('email');
			var nickname = naver_id_login.getProfileData('nickname');
			
			$.ajax({
		          url : "/login/loginPro.toy", 
		         type : "get",
		         data : { m_email : email,  loginName : nickname},
		         success : function(result) {
		        	 console.log("성공~");
		         },
		 		error: function(result){
					console.log(result.responseText); //responseText의 에러메세지 확인
				}
		      });
		}
	</script> -->
	<!-- <script type="text/javascript">
  var naver_id_login = new naver_id_login("43wP2dYx4JznPIszkbF1", "http://localhost:8080/login/loginPro.toy");
  // 접근 토큰 값 출력
  alert(naver_id_login.oauthParams.access_token);
  // 네이버 사용자 프로필 조회
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  function naverSignInCallback() {
    alert(naver_id_login.getProfileData('email'));
    alert(naver_id_login.getProfileData('nickname'));
  }
</script> -->

	<!-- 최상단으로 가기 버튼 -->
	<a href="#"
		class="scroll-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

</body>
</html>