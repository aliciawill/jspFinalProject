<%@page import="shop.ReplyDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="shop.ReplyDAO"%>
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
<script type="text/javascript" src="js/jquery-3.4.1.js"></script>
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
	
	//답글용 dao필요
	ReplyDAO dao2 = new ReplyDAO();
	
	//원글에 대한 답글 목록을 dao로 가지고 온다.
	ArrayList<ReplyDTO> list = dao2.list(dto);
	
	//div태그안에 목록은 붙여준다.
%>
<script type="text/javascript">
	$(function() {
		$("#reply").click(function() {
			$.ajax({
				url: "reply.jsp",
				data: {
					bbsid: <%= dto.getId() %>,
					content: $("#content").val(),
					writer: '${id}'
				} ,
				success: function(result) {
					//alert(result);
					$("div").append(result)
				}
			});	
		});
	});
</script>
</head>
<body>

	<center>
		<img src="img/food.png" width="150" height="80">
	</center>
	<br>
	<table border="1" align="center">
		<tr>
			<td id="td">게시판 번호</td>
			<td id="td2"><%= dto2.getId() %></td>
		</tr>		
		<tr>
			<td id="td">게시판 제목</td>
			<td id="td2"><%= dto2.getTitle() %></td>
		</tr>		
		<tr>
			<td id="td">게시판 내용</td>
			<td id="td2"><%= dto2.getContent() %></td>
		</tr>		
		<tr>
			<td id="td">글쓴이</td>
			<td id="td2"><%= dto2.getWriter() %></td>
		</tr>		
	</table>
	<br>
	<center>
		<a href="bbs.jsp">글목록으로</a> |
		<a href="update2.jsp?id=<%= dto2.getId()%>">수정하기</a> |
		<a href="delete2.jsp?id=<%= dto2.getId()%>">삭제하기</a> |

	<hr color=red>
	댓글: <input type="text" id="content" name="reply">
		<input type="button" id="reply" value="댓글달기">
		<br>
</center>
<table align=center>
	<tr>
		<td style="text-align: left;">
		<div>
			<%
				for(ReplyDTO dto3 : list){
			%>
			
			<img src=img/re.png width=50 height=50><%= dto3.getContent() %>(<%= dto2.getWriter() %>)<br>
			<%		
				}
			%>
		</div>	
		</td>
	</tr>
</table>
	















</body>
</html>