<%@page import="shop.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="dto" class="shop.BbsDTO"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>
<!-- 액션태그: 여러가지 액션을 한꺼번에 처리 -->
<!-- property: dto객체 중 어떤 변수에 set메소드를 호출할 지 지정  -->
<!-- name: 생성된 객체의 이름 -->

<!-- db처리 -->
<%
	BbsDAO dao = new BbsDAO();
	dao.delete(dto);
%>

<!-- bbs목록으로 이동 -->
<jsp:forward page="bbs.jsp"></jsp:forward>








</body>
</html>