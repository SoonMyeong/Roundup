<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<meta name="_csrf" content="${_csrf.token}" />
<meta name="_csrf_header" content="${_csrf.headerName}" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="마이페이지" name="pageTitle" />
</jsp:include>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7a701e8b07c907d6b0da0dbd2a200e68&libraries=services"></script>
<script charset="UTF-8" type="text/javascript"
	src="http://t1.daumcdn.net/cssjs/postcode/1522037570977/180326.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/code/highcharts.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/code/modules/exporting.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/js/code/modules/export-data.js"></script>
<sec:authorize access="hasAnyRole('ROLE_USER')">
	<sec:authentication property="principal.username" var="member_id" />
	<sec:authentication property="principal.member_name" var="member_name" />
</sec:authorize>
<style>

div.section_div-s table tr:hover {
   border: 1px solid #ddd;
   background: #FFEAEA;
    font-size: 0.9em;
}

div.section_div-s table th {
   border: 1px solid #ddd;
   background: lightblue;
   padding: 15px;
   font-size: 0.9em;
   
}

div.section_div-s table tr {
   font-size: 0.9em;
   
}

div#update-container {
	width: 700px;
	/* margin: 0 auto; */
}

div#basket-container {
	width: 780px;
	/* margin: 0 auto; */
}

div#userId-container span.guide {
	display: none;
	font-size: 12px;
	position: relative;
	top: 12px;
	right: 10px;
	margin-right: 1000px;
}

div#userId-container span.ok {
	color: blue;
}

div#userId-container span.error {
	color: orange;
}

table#tbl_enroll {
	width: 780px;
	margin: 0 auto;
	font-size: 0.9em;
}

#update-container h2 {
	text-align: left;
	padding-bottom: 30px;
	padding-top: 20px;
}

table#tbl_enroll input, table#tbl_enroll select {
	width: 500px;
}

div#btnDiv {
	text-align: center;
}

div.mypage {
	width: 980px;
	margin: 0 auto;
	min-height: 780px;
}

.list-group-item {
	position: relative;
	display: block;
	padding: .75rem 1.25rem;
	margin-bottom: -1px;
	background-color: #fff;
	border: 1px solid rgba(0, 0, 0, .125);
	width: 150px;
}

.mypage-detail {
	width: 780px;
}

.sidenav {
	background-color: #fff;
	height: 100%;
}

.number-hyelin {
	display: inline;
}

.table {
	width: 780px;
}

.col-sm-3 {
	max-width: 200px;
}

.chart-master {
	width: 780px;
}
/* 지도api관련 */
.map_wrap, .map_wrap * {
	margin: 0;
	padding: 0;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	font-size: 12px;
}

.map_wrap a, .map_wrap a:hover, .map_wrap a:active {
	color: #000;
	text-decoration: none;
}

.map_wrap {
	position: relative;
	width: 780px;
	height: 500px;
}

#menu_wrap {
	position: absolute;
	top: 0;
	left: 0;
	bottom: 0;
	width: 250px;
	margin: 10px 0 30px 10px;
	padding: 5px;
	overflow-y: auto;
	background: rgba(255, 255, 255, 0.7);
	z-index: 1;
	font-size: 12px;
	border-radius: 10px;
}

.bg_white {
	background: #fff;
}

#menu_wrap hr {
	display: block;
	height: 1px;
	border: 0;
	border-top: 2px solid #5F5F5F;
	margin: 3px 0;
}

#menu_wrap .option {
	text-align: center;
}

#menu_wrap .option p {
	margin: 10px 0;
}

#menu_wrap .option button {
	margin-left: 5px;
}

#placesList li {
	list-style: none;
}

#placesList .item {
	position: relative;
	border-bottom: 1px solid #888;
	overflow: hidden;
	cursor: pointer;
	min-height: 65px;
}

#placesList .item span {
	display: block;
	margin-top: 4px;
}

#placesList .item h5, #placesList .item .info {
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

#placesList .item .info {
	padding: 10px 0 10px 55px;
}

#placesList .info .gray {
	color: #8a8a8a;
}

#placesList .info .jibun {
	padding-left: 26px;
	background:
		url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png)
		no-repeat;
}

#placesList .info .tel {
	color: #009900;
}

#placesList .item .markerbg {
	float: left;
	position: absolute;
	width: 36px;
	height: 37px;
	margin: 10px 0 0 10px;
	background:
		url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png)
		no-repeat;
}

#placesList .item .marker_1 {
	background-position: 0 -10px;
}

#placesList .item .marker_2 {
	background-position: 0 -56px;
}

#placesList .item .marker_3 {
	background-position: 0 -102px
}

#placesList .item .marker_4 {
	background-position: 0 -148px;
}

#placesList .item .marker_5 {
	background-position: 0 -194px;
}

#placesList .item .marker_6 {
	background-position: 0 -240px;
}

#placesList .item .marker_7 {
	background-position: 0 -286px;
}

#placesList .item .marker_8 {
	background-position: 0 -332px;
}

#placesList .item .marker_9 {
	background-position: 0 -378px;
}

#placesList .item .marker_10 {
	background-position: 0 -423px;
}

#placesList .item .marker_11 {
	background-position: 0 -470px;
}

#placesList .item .marker_12 {
	background-position: 0 -516px;
}

#placesList .item .marker_13 {
	background-position: 0 -562px;
}

#placesList .item .marker_14 {
	background-position: 0 -608px;
}

#placesList .item .marker_15 {
	background-position: 0 -654px;
}

#pagination {
	margin: 10px auto;
	text-align: center;
}

#pagination a {
	display: inline-block;
	margin-right: 10px;
}

#pagination .on {
	font-weight: bold;
	cursor: default;
	color: #777;
}

.map-card {
	width: 780px;
}

.delivery-map {
	display: hidden;
}
</style>

<script>
	/* 주소검색api */
	function sample4_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 도로명 조합형 주소 변수

						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}
						// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
						if (fullRoadAddr !== '') {
							fullRoadAddr += extraRoadAddr;
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('sample4_roadAddress').value = fullRoadAddr;
						document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

						// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
						if (data.autoRoadAddress) {
							//예상되는 도로명 주소에 조합형 주소를 추가한다.
							var expRoadAddr = data.autoRoadAddress
									+ extraRoadAddr;
							document.getElementById('guide').innerHTML = '(예상 도로명 주소 : '
									+ expRoadAddr + ')';

						} else if (data.autoJibunAddress) {
							var expJibunAddr = data.autoJibunAddress;
							document.getElementById('guide').innerHTML = '(예상 지번 주소 : '
									+ expJibunAddr + ')';

						} else {
							document.getElementById('guide').innerHTML = '';
						}
					}
				}).open();
	}

	$(function() {
		$("#password_chk").blur(function() {
			var p1 = $("#member_password_").val();
			var p2 = $(this).val();
			if (p1 != p2) {
				alert("패스워드가 일치하지 않습니다.");
				$("#member_password_").focus();
			}
			;
		});

		$("#member_id_").on("keyup", function() {
			var member_id = $(this).val().trim();
			if (member_id.length < 4) {
				$(".guide").hide();
				$("#idDuplicateCheck").val(0);
				return;
			}

			$.ajax({
				url : "checkIdDuplicate.do",
				data : {
					member_id : member_id
				},
				dataType : "json",
				success : function(data) {
					console.log(data);//{isUsable: false}
					if (data.isUsable == true) {
						$(".guide.error").hide();
						$(".guide.ok").show();
						$("#idDuplicateCheck").val(1);
					} else {
						$(".guide.error").show();
						$(".guide.ok").hide();
						$("#idDuplicateCheck").val(0);
					}
				},
				error : function(jqxhr, textStatus, errorThrown) {
					console.log("ajax실패", jqxhr, textStatus, errorThrown);

				}

			});

		});
	});
	/*
	 * 유효성검사함수
	 */
	function validate(str) {
		var member_id = $("#member_id_");
		var member_password = $("#member_password_");
		var member_name = $("#member_name_");
		var member_birthday = $("#member_birthday_");
		var member_phone = $("#member_phone_")

		if (member_id.val().trim().length < 4
				|| member_id.val().trim().length >= 12) {
			alert("아이디는 최소4자리이상 12자 미만여야 합니다");
			member_id.focus();
			return false;
		}

		if (member_password.val().trim().length < 4
				|| member_password.val().trim().length > 8) {
			alert("비밀번호는 최소4자리이상이거나 8자리 미만여야 합니다.");
			member_password.focus();
			return false;
		}

		if (member_name.val().trim().length > 8) {
			alert("이름을 8글자 미만로 적어주세요");
			return false;
		}

		if (member_name.val().indexOf(" ") >= 0) {
			alert("이름에 공백을 사용할 수 없습니다.")
			document.member_name_.focus()
			document.member_name_.select()
			return false;
		}

		return true;
	}

	$(function() {
		var memberAddress = "${memberAddress.address}";
		var address = memberAddress.split("#");
		console.log(memberAddress);
		console.log(address);
		$("#sample4_roadAddress").val(address[0]);
		$("#sample4_jibunAddress").val(address[1]);
		$("#sample4_detailAddress").val(address[2]);
	});
</script>



<sec:authorize access="hasAnyRole('ROLE_USER')">
	<sec:authentication property="principal.username" var="member_id" />
	<sec:authentication property="principal.member_name" var="member_name" />
</sec:authorize>

<div class="mypage container">
	<div class="row">
		<div class="col-sm-3 sidenav">
			<div class="list-group" id="list-tab" role="tablist">
				<a class="list-group-item list-group-item-action"
					id="list-home-list" data-toggle="tab" href="#list-home" role="tab"
					aria-controls="home">Home</a> <a
					class="list-group-item list-group-item-action"
					id="list-profile-list" data-toggle="tab" href="#list-profile"
					role="tab" aria-controls="profile">회원관리</a> <a
					class="list-group-item list-group-item-action"
					id="list-basket-list" data-toggle="tab" href="#list-basket"
					role="tab" aria-controls="baskeet">상품등록</a>
			</div>
		</div>
		<div class="col-8">
			<div class="tab-content" id="nav-tabContent">
				<div class="tab-pane fade show active" id="list-home"
					role="tabpanel" aria-labelledby="list-home-list">
					<!-- home -->
					<!-- chart넣을부분 -->
					<div class="card text-center chart-master">
						<div class="card-header">
							<ul class="nav nav-tabs card-header-tabs">
								<li class="nav-item"><a class="nav-link active" href="#">카테고리</a>
								</li>
								<li class="nav-item"><a class="nav-link" href="#">가격</a></li>
							</ul>
						</div>
						<div class="card-body">
							<div id="ca-container"
								style="min-width: 310px; height: 400px; max-width: 600px; margin: 0 auto"></div>
						</div>
					</div>

					<!-- chart넣을부분 끝-->

					<!-- 지도api시작 -->

					<!-- ------------------------ -->
					<div class="card map-card">
						<div class="card-body">
							<h5 class="card-title">가까운 편의점을 찾아보세요</h5>

						</div>
						<div class="map_wrap">
							<div id="map"
								style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>

							<div id="menu_wrap" class="bg_white">
								<div class="option">
									<div>
										<form onsubmit="searchPlaces(); return false;">
											<input type="hidden" name="${_csrf.parameterName}"
												value="${_csrf.token}" /> 키워드 : <input type="text"
												value="편의점" id="search_keyword" size="15">
											<button type="submit">검색하기</button>
										</form>
									</div>
								</div>
								<hr>
								<ul id="placesList"></ul>
								<div id="pagination"></div>
							</div>
						</div>

					</div>
					<!-- 지도api끝 -->


				</div>
				<!-- 회원관리div -->
				<div class="tab-pane fade" id="list-profile" role="tabpanel"
					aria-labelledby="list-profile-list">
					<div id="update-container">
						<h3>회원관리</h3>
						<br />

						<div class="main-li-container" style="width: 779px;">

							<div class="row-dh">

								<div class="rightcolumn" style="width: 777px;">
									<div class="section_div-s" style="width: 777px;">
										<br />
										<p class="imsosotired2">&nbsp;총 회원 수 : ${totalContents }명</p>

										<table class="table" id="tbl_enroll">
											<tr>
												<th>아이디</th>
												<th>이름</th>
												<th>성별</th>
												<th>생년월일</th>
												<th>전화번호</th>
												<th>이메일</th>
												<th>가입일</th>
												<th>회원등급</th>
											</tr>
											<c:forEach items="${list}" var="m">
												<tr no="${m.member_id }">
													<td>${m.member_id }</td>
													<td>${m.member_name }</td>
													<td>${m.member_gender }</td>
													<td>${m.member_birthday }</td>
													<td>${m.member_phone }</td>
													<td>${m.member_email }</td>
													<td>${m.member_enrollDate }</td>
													<td>${m.member_grade }</td>

												</tr>
											</c:forEach>

										</table>
										 <br /> <br />
										<!-- 페이지바 -->
										<%
											int totalContents = Integer.parseInt(String.valueOf(request.getAttribute("totalContents")));
											int numPerPage = Integer.parseInt(String.valueOf(request.getAttribute("numPerPage")));
											int cPage = 1;
											try {
												cPage = Integer.parseInt(request.getParameter("cPage"));
											} catch (NumberFormatException e) {

											}
										%>
										<%=com.proj.rup.common.util.Utils.getPageBar(totalContents, cPage, numPerPage, "managerPage.do")%>

									</div>



								</div>
								<br> <br> <br>


							</div>

						</div>
					</div>
					<br /> <br />



				</div>
				<div class="tab-pane fade" id="list-basket" role="tabpanel"
					aria-labelledby="list-basket-list">

					<div id="product-container">
						<h3>상품등록</h3>
						<br />
						<div class="main-li-container" style="width: 779px;">
							<form action="productEnrollEnd.do" name="productFrm"
								method="post" enctype="multipart/form-data"
								onsubmit="return validate();"
								style="margin-top: 20px; margin-bottom: 20px; margin-left: 50px; margin-right: 50px;">
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<span class="input-group-text" id="inputGroup-sizing-default">상품이름</span>
									</div>
									<input type="text" class="form-control" name="productName"
										aria-label="Default"
										aria-describedby="inputGroup-sizing-default">
								</div>
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<span class="input-group-text" id="inputGroup-sizing-default">등록자</span>
									</div>
									<input type="text" class="form-control" name="memberId"
										aria-label="Default" value="${admin_id }"
										aria-describedby="inputGroup-sizing-default" readonly>
								</div>
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<label class="input-group-text" for="inputGroupSelect01">브랜드</label>
									</div>
									<select class="custom-select" name="brandNo"
										id="inputGroupSelect01">
										<c:forEach var="b" items="${brandList }" varStatus="vs">
											<option value="${b.brand_no }">${b.brand_name }</option>
										</c:forEach>
									</select>
								</div>
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<label class="input-group-text" for="inputGroupSelect01">카테고리</label>
									</div>
									<select class="custom-select category-level level-1"
										name="categoryNo" id="category1">
										<!-- onchange="doChange(this,'category2');" -->
										<option value="" selected disabled>Select</option>
										<c:forEach var="c" items="${categoryList }" varStatus="vs">
											<c:if test="${c.category_level == 1 }">
												<option value="${c.category_no }">${c.category_name }</option>
											</c:if>
										</c:forEach>
									</select> <select class="custom-select category-level level-2"
										name="categoryNo" id="category2">

									</select> <select class="custom-select category-level level-3"
										name="categoryNo" id="category3">

									</select>
								</div>
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<span class="input-group-text" id="inputGroup-sizing-default">상품가격</span>
									</div>
									<input type="number" class="form-control" name="price"
										step="100" aria-label="Default"
										aria-describedby="inputGroup-sizing-default">
								</div>
								<div class="input-group mb-3">
									<div class="input-group-prepend">
										<span class="input-group-text">상품이미지</span>
									</div>
									<div class="custom-file">
										<input type="file" class="custom-file-input" name="upFile"
											id="inputGroupFile01"> <label
											class="custom-file-label" id="chooseFile"
											for="inputGroupFile01">Choose file</label>
									</div>
								</div>

								<button type="reset" class="btn btn-outline-primary">초기화</button>
								<button type="submit" class="btn btn-outline-primary">상품등록</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</div>
<br />
<br />
<br />

<!-- 상품등록 스크립트 시작 -->
<script>
	function validate() {

		return true;
	}
	/* 다중select스크립트 시작*/

	$(function() {
		$(".category-level")
				.on(
						"change",
						function() {
							var val = $(this).find('option:selected').val();
							var nextE = $(this).next();
							var nextEclass = $(this).attr("class");
							console.log(nextE);
							console.log(val);
							console.log(nextEclass);

							var nextEclasses = nextEclass.split(" ");
							console.log(nextEclasses[2]);

							$
									.ajax({
										url : "${pageContext.request.contextPath}/product/selectChildCategory.do",
										data : {
											categoryNo : val
										},
										success : function(data) {
											var html = "";
											console.log(data);
											html += "<option value='' selected disabled>Select</option>";
											for ( var i in data) {
												console
														.log(data[i].category_name);
												html += "<option value='"+data[i].category_no+"'>"
														+ data[i].category_name
														+ "</option>";
											}

											nextE.html(html);
										},
										error : function(jqxhr, textStatus,
												errorThrown) {
											console.log("ajax처리실패!");
											console.log(jqxhr);
											console.log(textStatus);
											console.log(errorThrown);
										}
									});
						});
	});

	$(function() {
		$("[name=upFile]").on("change", function() {
			//var fileName = $(this).val();
			var fileName = $(this).prop("files")[0].name;

			$(this).next(".custom-file-label").html(fileName);
		});
		
	});
</script>
<!-- 상품등록 스크립트 끝 -->

<!-- 회원관리 스크립트 -->
<script>
	$(function() {
		$("tr[no]")
				.on(
						"click",
						function() {
							console.log($(this).attr("no"));
							location.href = "${pageContext.request.contextPath}/manager/managerView.do?member_id="
									+ $(this).attr("no");
						});
	});
</script>
<!-- 회원관리 스크립트 끝 -->

<script type="text/javascript">
	/* 차트부분스크립트 */
	// Make monochrome colors
	var pieColors = (function() {
		var colors = [], base = Highcharts.getOptions().colors[0], i;

		for (i = 0; i < 10; i += 1) {
			// Start out with a darkened base color (negative brighten), and end
			// up with a much brighter color
			colors.push(Highcharts.Color(base).brighten((i - 3) / 7).get());
		}
		return colors;
	}());

	// Build the chart
	Highcharts.chart('ca-container', {
		chart : {
			plotBackgroundColor : null,
			plotBorderWidth : null,
			plotShadow : false,
			type : 'pie'
		},
		title : {
			text : 'Browser market shares at a specific website, 2014'
		},
		tooltip : {
			pointFormat : '{series.name}: <b>{point.percentage:.1f}%</b>'
		},
		plotOptions : {
			pie : {
				allowPointSelect : true,
				cursor : 'pointer',
				colors : pieColors,
				dataLabels : {
					enabled : true,
					format : '<b>{point.name}</b><br>{point.percentage:.1f} %',
					distance : -50,
					filter : {
						property : 'percentage',
						operator : '>',
						value : 4
					}
				}
			}
		},
		series : [ {
			name : 'Share',
			data : [ {
				name : 'Chrome',
				y : 61.41
			}, {
				name : 'Internet Explorer',
				y : 11.84
			}, {
				name : 'Firefox',
				y : 10.85
			}, {
				name : 'Edge',
				y : 4.67
			}, {
				name : 'Safari',
				y : 4.18
			}, {
				name : 'Other',
				y : 7.05
			} ]
		} ]
	});
</script>
<!-- 지도api관련 스크립트 -->
<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center : new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		level : 3
	// 지도의 확대 레벨 
	};

	var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

	/* ---------------------------------- */
	// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
	if (navigator.geolocation) {

		// GeoLocation을 이용해서 접속 위치를 얻어옵니다
		navigator.geolocation.getCurrentPosition(function(position) {

			var lat = position.coords.latitude, // 위도
			lon = position.coords.longitude; // 경도
			console.log(lat + "," + lon);
			var locPosition = new daum.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
			message = '<div style="padding:5px;">현재위치입니다.</div>'; // 인포윈도우에 표시될 내용입니다

			// 마커와 인포윈도우를 표시합니다
			displayMarker(locPosition, message);

		});

	} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다

		var locPosition = new daum.maps.LatLng(33.450701, 126.570667), message = 'geolocation을 사용할수 없어요..'

		displayMarker(locPosition, message);
	}

	// 지도에 마커와 인포윈도우를 표시하는 함수입니다
	function displayMarker(locPosition, message) {

		// 마커를 생성합니다
		var marker = new daum.maps.Marker({
			map : map,
			position : locPosition
		});

		var iwContent = message, // 인포윈도우에 표시할 내용
		iwRemoveable = true;

		// 인포윈도우를 생성합니다
		var infowindow = new daum.maps.InfoWindow({
			content : iwContent,
			removable : iwRemoveable
		});

		// 인포윈도우를 마커위에 표시합니다 
		infowindow.open(map, marker);

		// 지도 중심좌표를 접속위치로 변경합니다
		map.setCenter(locPosition);
	}
	// 마커를 담을 배열입니다
	var markers = [];

	//장소 검색 객체를 생성합니다
	var ps = new daum.maps.services.Places();

	// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
	var infowindow = new daum.maps.InfoWindow({
		zIndex : 1
	});

	// 키워드로 장소를 검색합니다
	searchPlaces();

	// 키워드 검색을 요청하는 함수입니다
	function searchPlaces() {

		var keyword = document.getElementById('search_keyword').value;

		if (!keyword.replace(/^\s+|\s+$/g, '')) {
			alert('키워드를 입력해주세요!');
			return false;
		}

		// 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
		ps.keywordSearch(keyword, placesSearchCB);
	}

	// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
	function placesSearchCB(data, status, pagination) {
		if (status === daum.maps.services.Status.OK) {

			// 정상적으로 검색이 완료됐으면
			// 검색 목록과 마커를 표출합니다
			displayPlaces(data);

			// 페이지 번호를 표출합니다
			displayPagination(pagination);

		} else if (status === daum.maps.services.Status.ZERO_RESULT) {

			alert('검색 결과가 존재하지 않습니다.');
			return;

		} else if (status === daum.maps.services.Status.ERROR) {

			alert('검색 결과 중 오류가 발생했습니다.');
			return;

		}
	}

	// 검색 결과 목록과 마커를 표출하는 함수입니다
	function displayPlaces(places) {

		var listEl = document.getElementById('placesList'), menuEl = document
				.getElementById('menu_wrap'), fragment = document
				.createDocumentFragment(), bounds = new daum.maps.LatLngBounds(), listStr = '';

		// 검색 결과 목록에 추가된 항목들을 제거합니다
		removeAllChildNods(listEl);

		// 지도에 표시되고 있는 마커를 제거합니다
		removeMarker();

		for (var i = 0; i < places.length; i++) {

			// 마커를 생성하고 지도에 표시합니다
			var placePosition = new daum.maps.LatLng(places[i].y, places[i].x), marker = addMarker(
					placePosition, i), itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

			// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
			// LatLngBounds 객체에 좌표를 추가합니다
			bounds.extend(placePosition);

			// 마커와 검색결과 항목에 mouseover 했을때
			// 해당 장소에 인포윈도우에 장소명을 표시합니다
			// mouseout 했을 때는 인포윈도우를 닫습니다
			(function(marker, title) {
				daum.maps.event.addListener(marker, 'mouseover', function() {
					displayInfowindow(marker, title);
				});

				daum.maps.event.addListener(marker, 'mouseout', function() {
					infowindow.close();
				});

				itemEl.onmouseover = function() {
					displayInfowindow(marker, title);
				};

				itemEl.onmouseout = function() {
					infowindow.close();
				};
			})(marker, places[i].place_name);

			fragment.appendChild(itemEl);
		}

		// 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
		listEl.appendChild(fragment);
		menuEl.scrollTop = 0;

		// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
		map.setBounds(bounds);
	}

	// 검색결과 항목을 Element로 반환하는 함수입니다
	function getListItem(index, places) {

		var el = document.createElement('li'), itemStr = '<span class="markerbg marker_'
				+ (index + 1)
				+ '"></span>'
				+ '<div class="info">'
				+ '   <h5>'
				+ places.place_name + '</h5>';

		if (places.road_address_name) {
			itemStr += '    <span>' + places.road_address_name + '</span>'
					+ '   <span class="jibun gray">' + places.address_name
					+ '</span>';
		} else {
			itemStr += '    <span>' + places.address_name + '</span>';
		}

		itemStr += '  <span class="tel">' + places.phone + '</span>' + '</div>';

		el.innerHTML = itemStr;
		el.className = 'item';

		return el;
	}

	// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
	function addMarker(position, idx, title) {
		var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
		imageSize = new daum.maps.Size(36, 37), // 마커 이미지의 크기
		imgOptions = {
			spriteSize : new daum.maps.Size(36, 691), // 스프라이트 이미지의 크기
			spriteOrigin : new daum.maps.Point(0, (idx * 46) + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
			offset : new daum.maps.Point(13, 37)
		// 마커 좌표에 일치시킬 이미지 내에서의 좌표
		}, markerImage = new daum.maps.MarkerImage(imageSrc, imageSize,
				imgOptions), marker = new daum.maps.Marker({
			position : position, // 마커의 위치
			image : markerImage
		});

		marker.setMap(map); // 지도 위에 마커를 표출합니다
		markers.push(marker); // 배열에 생성된 마커를 추가합니다

		return marker;
	}

	// 지도 위에 표시되고 있는 마커를 모두 제거합니다
	function removeMarker() {
		for (var i = 0; i < markers.length; i++) {
			markers[i].setMap(null);
		}
		markers = [];
	}

	// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
	function displayPagination(pagination) {
		var paginationEl = document.getElementById('pagination'), fragment = document
				.createDocumentFragment(), i;

		// 기존에 추가된 페이지번호를 삭제합니다
		while (paginationEl.hasChildNodes()) {
			paginationEl.removeChild(paginationEl.lastChild);
		}

		for (i = 1; i <= pagination.last; i++) {
			var el = document.createElement('a');
			el.href = "#";
			el.innerHTML = i;

			if (i === pagination.current) {
				el.className = 'on';
			} else {
				el.onclick = (function(i) {
					return function() {
						pagination.gotoPage(i);
					}
				})(i);
			}

			fragment.appendChild(el);
		}
		paginationEl.appendChild(fragment);
	}

	// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
	// 인포윈도우에 장소명을 표시합니다
	function displayInfowindow(marker, title) {
		var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

		infowindow.setContent(content);
		infowindow.open(map, marker);
	}

	// 검색결과 목록의 자식 Element를 제거하는 함수입니다
	function removeAllChildNods(el) {
		while (el.hasChildNodes()) {
			el.removeChild(el.lastChild);
		}
	}

	/* 배송지 찾기 */
	function searchMap() {

	}
</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>