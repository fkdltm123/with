<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
	"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>회원 가입</title>
	<!-- <link rel = "stylesheet" href = "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"> -->
	<link rel="stylesheet" href="../resources/css/bootstrap.min.css"/>
	<script type="text/javascript" src="../resources/js/validation.js"></script>
</head>
<body>
	<jsp:include page="../menu.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">회원 가입</h1>
		</div>
	</div>
	<div class="container">
		<form name="newMember" action="./processAddMember.jsp" class="form-horizontal" method="post" >
			<div class="form-group row">
				<label class="col-sm-2">아이디</label>
				<div class="col-sm-5">
					<input type="text" id="m_id" name="m_id" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">비밀번호</label>
				<div class="col-sm-5">
					<input type="password" id="m_pw" name="m_pw" class="form-control" placeholder="4~12자">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">비밀번호 확인</label>
				<div class="col-sm-5">
					<input type="password" id="m_pwck" name="m_pwck" class="form-control" placeholder="재입력">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">성명</label>
				<div class="col-sm-5">
					<input type="text" id="m_name" name="m_name" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">성별</label>
				<div class="col-sm-5">
					<input type="radio" name="m_gender" value="male">
					남
					<input type="radio" name="m_gender" value="female">
					여
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">생일</label>
				<div class="col-sm-5">
					<input type="text" id="m_birth" name="m_birth" class="form-control" placeholder="ex)121212">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">이메일</label>
				<div class="col-sm-5">
					<input type="text" id="m_mail" name="m_mail" class="form-control" placeholder="ex)example@example.com">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">전화번호</label>
				<div class="col-sm-5">
					<input type="text" id="m_phone" name="m_phone" class="form-control" placeholder="ex)01012345678">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">주소</label>
				<div class="col-sm-5">
					<input type="text" id="m_address" name="m_address" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="button" value="등록" class="btn btn-primary" onclick="CheckPassword()">
					<input type="button" value="취소" class="btn btn-primary" onclick="location.href='javascript:history.go(-1)'">
				</div>
			</div>
		</form>
	</div>
</body>
</html>