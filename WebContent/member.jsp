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
	</div>
		<div id="center">
			<br>
			<!-- 로그인 구현  -->
			<%
				String id = (String) session.getAttribute("id");
				if (id == null) {
					out.print("로그인이 되지 않았습니다.");
			%>
			<form action="login.jsp">
				아이디: <input type="text" name="id"> 패스워드: <input type="text"
					name="pw">
				<button type="submit">로그인</button>
			</form>
			<%
				} else {
					out.print(id + "님이 로그인이 되었습니다.");
			%>
				<a href="logout.jsp">로그아웃</a>
			<% 
				}
			%>
			<hr>
			<br>

			<!-- 회원가입 구현 -->
			<form action="insert1.jsp">
				<table>
					<tr>
						<td>아이디:</td>
						<td><input type="text" name="id"></td>
					</tr>
					<tr>
						<td>패스워드:</td>
						<td><input type="text" name="pw"></td>
					</tr>
					<tr>
						<td>이름:</td>
						<td><input type="text" name="name"></td>
					</tr>
					<tr>
						<td>전화번호:</td>
						<td><input type="text" name="tel"></td>
					</tr>
					<tr>
						<td colspan="2">
							<button type="submit">회원가입</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>







</body>
</html>