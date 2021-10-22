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
	<!--1.파라메터 값 가지고 온다.  -->
	<!--2.dto를 만들어서 set메소드로 집어 넣는다.  -->
	<jsp:useBean id="dto" class="shop.BbsDTO"></jsp:useBean>
	<jsp:setProperty property="*" name="dto"/>
	
	<!--3.dao를 이용해서 db처리한다.  -->
	<%
		BbsDAO dao = new BbsDAO();
		dao.insert(dto);
	%>
	<!--4.게시판 목록으로 다시 돌아간다.  -->
	<jsp:forward page="bbs.jsp"></jsp:forward>
</body>
</html>








