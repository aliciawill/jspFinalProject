<%@page import="shop.MemberDAO"%>
<%@page import="shop.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	//1.입력값 받아온다.
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String tel = request.getParameter("tel");
	
	//2.dto을 만들어서 넣어준다.
	MemberDTO dto = new MemberDTO();
	dto.setId(id);
	dto.setPw(pw);
	dto.setName(name);
	dto.setTel(tel);
	
	//3.dao를 사용해서 db처리해준다.
	MemberDAO dao = new MemberDAO();
	dao.insert(dto);
	
	//4.member.jsp로 다시 돌아간다.
%>

<jsp:forward page="member.jsp"></jsp:forward>










</body>
</html>