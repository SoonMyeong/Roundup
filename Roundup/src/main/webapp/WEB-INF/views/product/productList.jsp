<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품목록 페이지</title>
<script>
$(function(){
	$("#btnAdd").click(function(){
		location.href="${path}/shop/product/write.do";
	});
});
</script>
</head>
<body>
<h2>상품목록</h2>
<!-- 관리자에게만 상품등록 버튼 표시 -->
<c:if test="${sessionScope.adminId != null}">
    <button type="button" id="btnAdd">상품등록</button><br>
</c:if>
<table border="1">
    <tr>
        <th>상품ID</th>
        <th>상품이미지</th>
        <th>상품명</th>
        <th>가격</th>
    </tr>
    <c:forEach var="row" items="${list}">
    <tr>
        <td>
            ${row.productId}
        </td>
        <td>
            <a href="${path}/shop/product/detail/${row.productId}">
                <img src="${path}/images/${row.productUrl}" width="120ox" height="110px">
            </a>
        </td>
        <td align="center">
            <a href="${path}/shop/product/detail/${row.productId}">${row.productName}</a><br>
            <c:if test="${sessionScope.adminId != null}">
                <a href="${path}/shop/product/edit/${row.productId}">[상품편집]</a>
            </c:if>
        </td>
        <td>
            <fmt:formatNumber value="${row.productPrice}" pattern="###,###,###"/>
        </td>
    </tr>
    </c:forEach>
</table>

<script>
$(document).ready(function(){
    $("#btnAdd").click(function(){
        location.href="${path}/shop/product/write.do";
    });
});
</script>

</body>
</html>