<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
	"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>회원 정보 수정</title>
	<!-- <link rel = "stylesheet" href = "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"> -->
	<link rel="stylesheet" href="../resources/css/bootstrap.min.css"/>
	<script type="text/javascript" src="../resources/js/validation.js"></script>
</head>
<body>
	<jsp:include page="../menu.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">회원 정보 수정</h1>
		</div>
	</div>
	<div class="container">
		<%@ include file="../dbconn.jsp" %>
		<%
			String id = (String)session.getAttribute("sessionId");
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String sql = "select * from member where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
		%>
		<form name="updateMember" action="./processUpdateMember.jsp" class="form-horizontal" method="post" >
			<div class="form-group row">
				<label class="col-sm-2">아이디</label>
				<div class="col-sm-5">
					<%=rs.getString("id") %>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">현재 비밀번호</label>
				<div class="col-sm-5">
					<input type="hidden" value="<%=rs.getString("password") %>" id="m_pwC" name="m_pwC" class="form-control">
					<input type="password" id="m_pwCck" name="m_pwCck" class="form-control" placeholder="4~12자">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">새 비밀번호</label>
				<div class="col-sm-5">
					<input type="password" id="m_pw" name="m_pw" class="form-control" placeholder="4~12자">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">새 비밀번호 확인</label>
				<div class="col-sm-5">
					<input type="password" id="m_pwck" name="m_pwck" class="form-control" placeholder="재입력">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">성명</label>
				<div class="col-sm-5">
					<%=rs.getString("name") %>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">성별</label>
				<div class="col-sm-5">
					<%=rs.getString("gender") %>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">생일</label>
				<div class="col-sm-5">
					<%=rs.getString("birth") %>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">이메일</label>
				<div class="col-sm-5">
					<input type="text" value="<%=rs.getString("mail") %>" id="m_mail" name="m_mail" class="form-control" placeholder="ex)example@example.com">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">전화번호</label>
				<div class="col-sm-5">
					<input type="text" value="<%=rs.getString("phone") %>" id="m_phone" name="m_phone" class="form-control" placeholder="ex)01012345678">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">주소</label>
				<div class="col-sm-5">
					<input type="text" value="<%=rs.getString("address") %>" id="m_address" name="m_address" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="button" value="수정" class="btn btn-primary" onclick="UpdateCheckPassword()">
					<input type="button" value="취소" class="btn btn-primary" onclick="location.href='javascript:history.go(-1)'">
					<a href="./deleteMember.jsp" class="btn btn-danger">회원 탈퇴</a>
				</div>
			</div>
		</form>
		<%
			}
			if(rs != null)
				rs.close();
			if(pstmt != null)
				pstmt.close();
			if(conn != null)
				conn.close();
		%>
	</div>
</body>
</html>