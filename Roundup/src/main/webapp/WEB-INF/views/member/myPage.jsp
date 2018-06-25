<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="마이페이지" name="pageTitle"/>
</jsp:include>
<style>
div#update-container{
	width:400px;
	margin:0 auto;
	text-align:center;
}
div#update-container input.form-control{display:inline-block;}
div#update-container select.form-control{display:inline-block;}
</style>

<script>
function memberDelete(member_id){
	console.log(member_id);
	var con_test = confirm("삭제하시겠습니까??");
	if(con_test == true){
	  location.href="${pageContext.request.contextPath}/member/memberDelete.do?member_id="+member_id;
	}
	else if(con_test == false){
	}
	
}

</script>
<nav class="nav-list">
     <div class="nav-list-wrapper">
           <ul class="nav nav-tabs nav-justified">
               <li role="presentation" class="active"><a href="#">회원정보수정</a></li>
               <li role="presentation"><a href="#">장바구니</a></li>
               <li role="presentation"><a href="${pageContext.request.contextPath }/purchase/purchaseComplete.jsp">구매내역</a></li>
               <li role="presentation"><a href="./freeboard/freeBoardList.do">공지사항</a></li>
               <li role="presentation"><a href="#">1:1문의</a></li>
           </ul>
     </div>
 </nav>
<div class="mypage-container-master">
	<div id="update-container">
	<br/>
	<h4>회원정보</h4>
	</br>
		<form action="${pageContext.request.contextPath}/member/memberUpdate.do" method="post" name="memberUpdateFrm" >
			<div id="userId-container">
				아이디 : <input type="text" name="member_id" id=member_id_ class="form-control" value="${member.member_id }" required style="width:340px;" readonly/>
			</div>
			<br/>
				이  름 : <input type="text" name="member_name" id="member_name_" class="form-control" value="${member.member_name }" required style="width:353px;"/>
			<br/><br/>
				이메일 : <input type="email" name="member_email" id="member_email_" value="${member.member_email }" class="form-control" style="width:340px;" required/>
			<br/><br/>
				번  호 : <input type="text" name="member_phone" id="member_phone_" value="${member.member_phone }" class="form-control" required required style="width:353px;"/>
			<br/><br/>
				생  일 : <input type="text" name="member_birthday" id="member_birthday_" value="${member.member_birthday }" class="form-control" style="width:353px;"/>
			<br/><br/>
				성별 : <select name="member_gender" id="member_gender_" class="form-control" style="width:353px;">
					<option value=""disabled selected>성별</option>
					<option value="M" ${member.member_gender=='M'?'selected':'' }>남자</option>
					<option value="F" ${member.member_gender=='F'?'selected':'' }>여자</option>
				</select>
			<br/><br/>
			<input type="hidden" name="member_grade" value="${member.member_grade }" />
		<input type="submit" value="수정" class="btn btn-outline-success" /> 
		<input type="reset" value="취소" class="btn btn-outline-success">
		<input type="button" value="삭제" class="btn btn-outline-success" onclick="memberDelete('${member.member_id }');">
		<br><br><br>
		</form>
	</div>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>