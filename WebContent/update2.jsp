<%@page import="shop.BbsDAO"%>
<%@page import="shop.BbsDTO"%>
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
<%
	//1.id값 가지고 오기
	String id = request.getParameter("id");

	//2.dto에 넣는다.
	BbsDTO dto = new BbsDTO();
	dto.setId(id);
	
	//3.dao를 이용해서 검색한후 가지고 온다.
	BbsDAO dao = new BbsDAO();
	BbsDTO dto2 = dao.select(dto);
	
	//4.가지고 온 검색결과를 테이블 모양으로 프린트
%>
	<center>
		<img src="img/food.png" width="150" height="80">
	</center>
	<br>
	<form action="update22.jsp">
		<table border="1" align="center">
			<tr>
				<td id="td">게시판 번호</td>
				<td id="td2">
					<input 	type="text" 
							name="id" 
							value="<%= dto2.getId() %>"
							readonly="readonly"		
					>
				</td>
			</tr>		
			<tr>
				<td id="td">게시판 제목</td>
				<td id="td2">
					<input 	type="text" 
							name="title" 
							value="<%= dto2.getTitle() %>"
					>
				</td>
			</tr>		
			<tr>
				<td id="td">게시판 내용</td>
				<td id="td2">
					<input 	type="text" 
							name="content" 
							value="<%= dto2.getContent() %>"
					>
				</td>
			</tr>		
			<tr>
				<td id="td">글쓴이</td>
				<td id="td2"><%= dto2.getWriter() %></td>
			</tr>	
			<tr>
				<td colspan="2">
					<input type="submit" value="수정 완료">
				</td>
			</tr>	
		</table>
	</form>
	<br>
	<center>
		<a href="bbs.jsp">글목록으로</a> |
		<a href="one.jsp?id=<%= dto.getId()%>">글내용으로</a> |
	</center>















</body>
</html>