<%@page import="shop.BbsDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="shop.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="css/project.css">
</head>
<body>
<div id="total">
	<div id="top">
		<jsp:include page="top.jsp"></jsp:include>
	</div>
	<div id="top2">
		<jsp:include page="top2.jsp"></jsp:include>
	</div>
	<div id="center">
	<!-- bbs.jsp를 호출하자마자 서버와 통신 : 결과는 bbs의 목록 -->
	<!-- 1.dao를 이용해서 목록을 가지고 온다. -->
	<!-- 2.목록을 테이블형태로 프린트. -->
	<%
		BbsDAO dao = new BbsDAO();
		ArrayList<BbsDTO> list = dao.list();
	%>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	
	&nbsp;&nbsp;
	<a href="insert2.jsp">
		<img src="img/insert2.png" width=150 height=35>
	</a>
	<table border="1" align="center">
		<tr>
			<td id="td">게시판 번호</td>
			<td id="td">게시판 제목</td>
			<td id="td">글쓴이</td>
		</tr> 
		<%
		/* for-each */
			for(BbsDTO dto: list){
		%>
			<tr>
				<td id="td2"><%= dto.getId() %></td>
				<td id="td2">
					<a href="one.jsp?id=<%= dto.getId() %>">
						<%= dto.getTitle() %>	
					</a>
				</td>
				<td id="td2"><%= dto.getWriter() %></td>
			</tr>
		<%		
			}
		%>	
	</table>	
	</div>
</div>







</body>
</html>