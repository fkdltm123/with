<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ include file="../dbconn.jsp" %>

<%
	request.setCharacterEncoding("UTF-8");
		
	String id = (String)session.getAttribute("sessionId");
	String pw = request.getParameter("m_pw");
	String mail = request.getParameter("m_mail");
	String phone = request.getParameter("m_phone");
	String address = request.getParameter("m_address");
	
	PreparedStatement pstmt = null;
	
	String sql = "update member set password=?, mail=?, phone=?, address=? where id=?";
	pstmt = conn.prepareStatement(sql);
	
	pstmt.setString(1, pw);
	pstmt.setString(2, mail);
	pstmt.setString(3, phone);
	pstmt.setString(4, address);
	pstmt.setString(5, id);
	pstmt.executeUpdate();
	
	if(pstmt != null)
		pstmt.close();
	if(conn != null)
		conn.close();
	
	response.sendRedirect("../welcome.jsp");
	
	
%>