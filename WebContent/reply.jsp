<%@page import="shop.ReplyDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="dto" class="shop.ReplyDTO"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>
<%
	ReplyDAO dao = new ReplyDAO();
	dao.insert(dto);
%>
<img src=img/re.png width=50 height=50><%= dto.getContent() %>(<%= dto.getWriter() %>)<br>

