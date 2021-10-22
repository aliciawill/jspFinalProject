<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String id = request.getParameter("id");
	//물건의 id를 장바구니에 계속 추가해야함.
	//1.장바구니 세션이 있는지 확인!
	ArrayList list = (ArrayList)session.getAttribute("bag");
	//2.세션이 있다라는 것은 이미 list가 있다라는 뜻
	if(list != null){
	//3.그 list에 id만 추가.
		list.add(id);
	//4.장바구니 세션이 없는 경우에 list를 만들어주어야 함.
	}else{
	//5.새로 만든 list에 id를 추가.
		list = new ArrayList();
		list.add(id);
	}
	//6.추가한 목록까지 다시 session으로 재설정!해주어야함.
	session.setAttribute("bag", list);
%>