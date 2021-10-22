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
<%-- <jsp:useBean id="dto" class="shop.MemberDTO"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/> --%>

<%
	//1.입력한 id, pw를 가지고 온다.
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	//2.dto를 만들어서, 데이터를 넣는다.
	MemberDTO dto = new MemberDTO();
	dto.setId(id);
	dto.setPw(pw);
	
	//3.dao를 사용해서, db처리
	MemberDAO dao = new MemberDAO();
	boolean result = dao.check(dto);
	
	//	결과값이 true이면, id를 session으로 등록!
	//  결과값이 false이면, id를 session으로 등록x!
	if(result){
		session.setAttribute("id", id);
	}
	
	//4.member.jsp로 넘어감.
%>
<jsp:forward page="member.jsp"></jsp:forward>
</body>
</html>






