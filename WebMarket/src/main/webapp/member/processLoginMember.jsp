<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ include file="../dbconn.jsp" %>

<%
	request.setCharacterEncoding("UTF-8");
		
		
	String id = request.getParameter("m_id");
	String pw = request.getParameter("m_pw");
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "select id, password from member where id=?";
	pstmt = conn.prepareStatement(sql);
	
	pstmt.setString(1, id);
	rs = pstmt.executeQuery();
	
	while(rs.next()){
		if(rs.getString("password").equals(pw)){
			session.setAttribute("sessionId",id);
		}
	}
	
	if(rs != null)
		rs.close();
	if(pstmt != null)
		pstmt.close();
	if(conn != null)
		conn.close();
	if(session.getAttribute("sessionId") == null){
		%>
		<script>
			alert("아이디와 비밀번호를 확인해주세요");
			history.go(-1);
		</script>
		<%
	} else{
		response.sendRedirect("../welcome.jsp");
		
	}
	
	
%>