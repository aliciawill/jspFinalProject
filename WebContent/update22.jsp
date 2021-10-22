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
<!-- dto를 만들어서 받은 파라메터값 dto에 넣는다. -->
<jsp:useBean id="dto" class="shop.BbsDTO"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>

<!-- dao를 이용해서 update처리 -->
<%
	BbsDAO dao = new BbsDAO();
	dao.update(dto);
%>
<!-- one.jsp로 넘겨서 수정된 내용을 확인. -->
<jsp:forward page="one.jsp">
	<jsp:param value="<%= dto.getId() %>" name="id"/>
</jsp:forward>
</body>
</html>





