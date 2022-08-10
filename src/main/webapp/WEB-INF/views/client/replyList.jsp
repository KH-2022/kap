<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>
		<!-- CSS ============================================ -->
		<!--===== Vendor CSS(Bootstrap & Icon Font) =====-->
		<link rel="stylesheet" href="/resources/include/mypage/assets/css/plugins/ionicons.min.css">
		<link rel="stylesheet" href="/resources/include/mypage/assets/css/plugins/fontawesome.min.css">
		<!--===== Plugins CSS(All Plugins Files) =====-->
		<link rel="stylesheet" href="/resources/include/mypage/assets/css/plugins/animate.css">
		<link rel="stylesheet" href="/resources/include/mypage/assets/css/plugins/jquery-ui.min.css">
		<link rel="stylesheet" href="/resources/include/mypage/assets/css/plugins/default.css">
		<!--====== Main Style CSS ======-->
		<link rel="stylesheet" href="/resources/include/mypage/assets/css/style.css">
		<link rel="stylesheet" href="/resources/include/css/star.css" />
		<style>
			.container {
				/* width: 500px;
				margin: 20px auto; */
			}
			hr{
				width:1000px;
			}
			.tab_title li {
				font-size: 35 px;
				list-style: none;
				float: left;
				width: 500px;
				padding: 10px 15px;
				cursor: pointer;
				text-align: center;
				border: 1px solid #bebebe;
			}
			
			.tab_title li.on {
				background-color: #212121;
				font-weight: bold;
			}
			
			.tab_cont {
				clear: both;
				border: 1px solid #dedede;
				width: 1000px;
				height: auto;
			}
			.head {
				padding: 10px 15px;
				background-color: #D3D3D3;
			}
			
			.tab_cont div {
				display: none;
				text-align: center;
			}
			
			.tab_cont div.on {
				display: block;
			}
		</style>
		<script>
			$(function() {
		
				let errorMsg = "${errorMsg}";
				if (errorMsg != "") {
					alert(errorMsg);
					errorMsg = "";
				}
		
				let updateMsg = "${updateMsg}";
				if (updateMsg != "") {
					alert(updateMsg);
					updateMsg = "";
				}
		
				let WithdrawalMsg = "${WithdrawalMsg}";
				if (WithdrawalMsg != "") {
					alert(WithdrawalMsg);
					WithdrawalMsg = "";
				}
		
				$("#pills-order-tab").click(function() {
					location.href = "/myPage/myPage";
				});
				$("#pills-rez-tab").click(function() {
					location.href = "/myPage/reserve";
				});
				$("#pills-qna-tab").click(function() {
					location.href = "/myPage/qna";
				});
				$("#pills-review-tab").click(function() {
					location.href = "/reply/reply";
				});
				$("#pills-account-tab").click(function() {
					location.href = "/myPage/account";
				});
				$("#pills-address-tab").click(function() {
					location.href = "/myPage/add";
				});
				$("#pills-withdrawal-tab").click(function() {
					location.href = "/myPage/withdrawal";
				});
				
				
			}); //메인 메서드 종료
				function replyUpdateForm(){
					
					$("#reviewForm").attr({
						"method" :"post",
						"action" : "/reply/replyUpdateForm"
					});
					$("#reviewForm").submit();
				}
			
				function bReplyUpdateForm(){
					$("#reviewForm").attr({
						"method" :"post",
						"action" : "/reply/bReplyUpdateForm"
					});
					$("#reviewForm").submit();
				}
			
				function replyDelete(e){
					var choice = confirm("상품 리뷰를 삭제하시겠습니까?");
					
					if(choice){
						
						$("#reviewForm").attr({
							"method" :"post",
							"action" : "/reply/replyDelete"
						});
						$("#reviewForm").submit();
					} else {
						location.href = "/reply/replyList"
					}
				};
				
				function bReplyDelete(e){
					var choice = confirm("양조장 체험 리뷰를 삭제하시겠습니까?");
					if(choice){
						
						$("#reviewForm").attr({
							"method" :"post",
							"action" : "/reply/bReplyDelete"
						});
						$("#reviewForm").submit();
					} else {
						location.href = "/reply/replyList"
					}
			};
		</script>
	</head>
	<body>
		<%-- 상단 디자인 영역 --%>
		<div class="hero page-inner overlay"
			style="background-image: url('/resources/images/main_bg_3.jpg');">
			<div class="container">
				<div class="row justify-content-center align-items-center">
					<div class="col-lg-9 text-center mt-5">
						<h1 class="heading" data-aos="fade-up">마이페이지</h1>
					</div>
				</div>
			</div>
		</div>
	
	
		<!--====== Breadcrumb Part Start ======-->
		<div class="breadcrumb-area">
			<div class="container-fluid custom-container">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="/">Home</a></li>
						<li class="breadcrumb-item active">My Account</li>
					</ol>
				</nav>
			</div>
			<!-- container -->
		</div>
		<!--====== Breadcrumb Part Ends ======-->
		<!--====== My Account Part Start ======-->
		<section class="my-account-area pt-10">
			<div class="container-fluid custom-container">
				<div class="row">
					<div class="col-xl-3 col-md-4">
						<div class="my-account-menu mt-30">
							<ul class="nav account-menu-list flex-column nav-pills" id="pills-tab" role="tablist">
								<li><a id="pills-order-tab" data-toggle="pill" href="#pills-order" role="tab" aria-controls="pills-order" aria-selected="false"><i class="far fa-shopping-cart"></i>배송 / 주문 상태 확인</a></li>
								<li><a id="pills-rez-tab" data-toggle="pill" href="#pills-rez" role="tab" aria-controls="pills-rez" aria-selected="true"><i class="far fa-map-marker-alt"></i>체험 예약 정보</a></li>
								<li><a id="pills-qna-tab" data-toggle="pill" href="#pills-qna" role="tab" aria-controls="pills-qna" aria-selected="false"><i class="far fa-question"></i>문의 목록</a></li>
								<li><a class="active"id="pills-review-tab" data-toggle="pill" href="#pills-review" role="tab" aria-controls="pills-review" aria-selected="false"><i class="far fa-comment-dots"></i>댓글 목록</a></li>
								<li><a id="pills-account-tab" data-toggle="pill" href="#pills-account" role="tab" aria-controls="pills-account" aria-selected="false"><i class="far fa-user"></i>회원정보 수정</a></li>
								<li><a id="pills-address-tab" data-toggle="pill" href="#pills-address" role="tab" aria-controls="pills-address" aria-selected="false"><i class="far fa-map-marker-alt"></i>배송지 관리</a></li>
								<li><a id="pills-withdrawal-tab" data-toggle="pill" href="#pills-withdrawal" role="tab" aria-controls="pills-withdrawal" aria-selected="false"><i class="far fa-user"></i>회원탈퇴</a></li>
								<li><a href="/login/logout"><i class="far fa-sign-out-alt"></i>로그아웃</a></li>
							</ul>
						</div>
					</div>
					<div class="col-xl-8 col-md-8">	
					<div class="tab-content my-account-tab mt-30" id="pills-tabContent">
					
							<div class="tab-pane fade show active" id="pills-review" role="tabpanel" aria-labelledby="pills-review-tab">
								<form id="reviewForm">
									<input type="hidden" name="user_no" id="user_no" value="${login.user_no}" /> 
									
									<div class="my-account-download account-wrapper">
										<div class="container">
											<ul class="tab_title">
												<li class="on account-table text-center mt-30 table-responsive">
													<!-- <a href="reply"> 리뷰 작성 </a> -->
													<a href="reply"> 리뷰 작성 </a>
												</li>
												<li class="on account-table text-center mt-30 table-responsive">
													<!-- <a href="replyList"> 작성한 리뷰 </a> -->
													<a href="replyList"> 작성한 리뷰 </a> 
												</li>
											</ul>
											
											<div id="viewReview" class="viewReview">
											<table class="table tab_cont">
											<c:choose>
												<c:when test="${not empty replyList}">
												<thead class="head">
													<tr>
														<th class="pd_review_thumb">사진</th>
														<th class="pd_name">제품명</th>
														<th class="pd_review_content">내용</th>
														<th class="pd_review_date">날짜</th>
														<th class="수정/삭제">수정/삭제</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="reply" items="${replyList}" varStatus="status">
														<input type="hidden" name="pd_review_no" name="pd_review_no" value="${reply.pd_review_no}" />
														<tr class="text-center" data-num="${reply.pd_review_no}">
															<td>
																<c:if test="${not empty reply.pd_review_thumb}">
																	<img src="/uploadStorage/pdReview/thumbnail/${reply.pd_review_thumb}" />
																</c:if>
															</td>
															<td>${reply.pd_name}</td>
															<td>${reply.pd_review_content}</td>
															<td>${reply.pd_review_date}</td>
															<td>
																<a href="replyUpdateForm?pd_review_no=${reply.pd_review_no}">수정</a> / 
																<a href="javascript:void(0);" onclick="replyDelete();">삭제</a>
															</td>
														</tr>
													</c:forEach>
												</c:when>
											<c:otherwise>
												<tr>
													<td colspan="6" class="tac text-center">등록된 상품 리뷰가 존재하지 않습니다.</td>
												</tr>
											</c:otherwise>
										</c:choose>
									</tbody>
								</table>
												
							<hr />
												
														<table class="table tab_cont">
														<c:choose>
															<c:when test="${not empty reserveList}">
															<thead class ="head">
																<tr>
																	<th class="br_review_thumb">사진</th>
																	<th class="br_name">양조장</th>
																	<th class="br_review_content">내용</th>
																	<th class="br_review_date">날짜</th>
																	<th class="수정/삭제">수정/삭제</th>
																</tr>
															</thead>
															<tbody>
																<c:forEach var="reserve" items="${reserveList}" varStatus="status">
																<input type="hidden" name="br_review_no" name="br_review_no" value="${reserve.br_review_no}" />
																	<tr class="text-center" data-num="${reserve.br_review_no}">
																		<td>
																			<c:if test="${not empty reserve.br_review_thumb}">
																				<img src="/uploadStorage/br_review/thumbnail/${reserve.br_review_thumb}" />
																			</c:if>
																		</td>
																		<td>${reserve.br_name}</td>
																		<td>${reserve.br_review_content}</td>
																		<td>${reserve.br_review_date}</td>
																		<td>
																			<a href="bReplyUpdateForm?br_review_no=${reserve.br_review_no}">수정</a> / 
																			<a href="javascript:void(0);" onclick="bReplyDelete();">삭제</a>
																		</td>
																	</tr>
																</c:forEach>
															</c:when>
															<c:otherwise>
																<tr>
																	<td colspan="6" class="tac text-center">등록된 체험장 리뷰가 존재하지 않습니다.</td>
																</tr>
															</c:otherwise>
														</c:choose>
													</tbody>
												</table>
											</div>	
													
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!--====== My Account Part Ends ======-->
		<!--====== Features Banner Part Start ======-->
		<section class="features-banner-area pt-80 pb-100">
			<div class="container-fluid custom-container">
				<div class="features-banner-wrapper d-flex flex-wrap">
					<div class="single-features-banner d-flex">
						<div class="banner-icon">
							<img src="/resources/include/mypage/assets/images/icon1.png"
								alt="Icon">
						</div>
						<div class="banner-content media-body">
							<h3 class="banner-title">Free Shipping</h3>
							<p>Free shipping on all Korea order</p>
						</div>
					</div>
					<!-- single features banner -->
					<div class="single-features-banner d-flex">
						<div class="banner-icon">
							<img src="/resources/include/mypage/assets/images/icon2.png"
								alt="Icon">
						</div>
						<div class="banner-content media-body">
							<h3 class="banner-title">Support 24/7</h3>
							<p>Contact us 24 hours a day</p>
						</div>
					</div>
					<!-- single features banner -->
					<div class="single-features-banner d-flex">
						<div class="banner-icon">
							<img src="/resources/include/mypage/assets/images/icon3.png"
								alt="Icon">
						</div>
						<div class="banner-content media-body">
							<h3 class="banner-title">100% Money Back</h3>
							<p>You have 30 days to Return</p>
						</div>
					</div>
					<!-- single features banner -->
					<div class="single-features-banner d-flex">
						<div class="banner-icon">
							<img src="/resources/include/mypage/assets/images/icon4.png"
								alt="Icon">
						</div>
						<div class="banner-content media-body">
							<h3 class="banner-title">90 Days Return</h3>
							<p>If goods have problems</p>
						</div>
					</div>
					<!-- single features banner -->
					<div class="single-features-banner d-flex">
						<div class="banner-icon">
							<img src="/resources/include/mypage/assets/images/icon5.png"
								alt="Icon">
						</div>
						<div class="banner-content media-body">
							<h3 class="banner-title">Payment Secure</h3>
							<p>We ensure secure payment</p>
						</div>
					</div>
					<!-- single features banner -->
				</div>
				<!-- features banner wrapper -->
			</div>
			<!-- container -->
		</section>
	</body>
</html>