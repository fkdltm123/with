<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ include file="../dbconn.jsp" %>

<%
	request.setCharacterEncoding("UTF-8");
		
	String id = request.getParameter("m_id");
	String pw = request.getParameter("m_pw");
	String name = request.getParameter("m_name");
	String gender = request.getParameter("m_gender");
	String birth = request.getParameter("m_birth");
	String mail = request.getParameter("m_mail");
	String phone = request.getParameter("m_phone");
	String address = request.getParameter("m_address");
	String regi_date = "일단 공백 처리";
	
	PreparedStatement pstmt = null;
	
	String sql = "insert into member values(?,?,?,?,?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);
	
	pstmt.setString(1, id);
	pstmt.setString(2, pw);
	pstmt.setString(3, name);
	pstmt.setString(4, gender);
	pstmt.setString(5, birth);
	pstmt.setString(6, mail);
	pstmt.setString(7, phone);
	pstmt.setString(8, address);
	pstmt.setString(9, regi_date);
	pstmt.executeUpdate();
	
	if(pstmt != null)
		pstmt.close();
	if(conn != null)
		conn.close();
	
	response.sendRedirect("resultMember.jsp");
	
	
%>