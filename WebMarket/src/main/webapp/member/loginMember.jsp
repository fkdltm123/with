<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
	"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Login</title>
<!-- 	<link rel = "stylesheet" href = "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
 -->	
 	<link rel="stylesheet" href="../resources/css/bootstrap.min.css"/>
</head>
<body>
	<jsp:include page="../menu.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">로그인</h1>
		</div>
	</div>
	<div class="containcer" align="center">
		<div class="col-md-4 col-md-offset-4">
			<h3 class="form-signin-heading">Please sign in</h3>
			<form class="form-signin" action="processLoginMember.jsp" method="post">
				<div class="form-group col-sm-6">
					<label for="inputUserName" class="sr-only">User Name</label>
					<input type="text" class="form-control" placeholder="ID" id="m_id" name="m_id" required autofocus>
				</div>
				<div class="form-group col-sm-6">
					<label for="inputPassword" class="sr-only">Password</label>
					<input type="password" class="form-control" placeholder="Password" id="m_pw" name="m_pw" required>
				</div>
				<div class=" col-sm-6">
					<button class="btn btn-lg btn-success btn-clock col-sm-12"  type="submit">로그인</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>