<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
	"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>상품 수정</title>
	<!-- <link rel = "stylesheet" href = "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"> -->
	<link rel="stylesheet" href="./resources/css/bootstrap.min.css"/>
</head>
<body>
	<fmt:setLocale value='<%=request.getParameter("language") %>'/>
	<fmt:bundle basename="bundle.message">
	<jsp:include page="menu.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3"><fmt:message key="title"/></h1>
		</div>
	</div>
	<%@ include file="dbconn.jsp" %>
	<%
		String productId = request.getParameter("id");
	
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from product where p_id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, productId);
		rs = pstmt.executeQuery();
		if(rs.next()){
	%>
	<div class="container">
		<div class="text-right">
			<a href="?language=ko">Korean</a>|<a href="?language=en">English</a>
			<a href="logout.jsp" class="btn btn-sm btn-success pull-right">logout</a>
		</div>
		<div class="row">
			<div class="col-md-5">
				<img src="./resources/upload/<%=rs.getString("p_filename") %>" alt="image" style="width: 100%"/>
			</div>
			<div class="col-md-7">
				<form name="newProduct" action="./processUpdateProduct.jsp" class="form-horizontal" method="post" enctype="multipart/form-data">
					<div class="form-group row">
						<label class="col-sm-2"><fmt:message key="productId"/></label>
						<div class="col-sm-3">
							<input type="text" id="productId" name="productId" class="form-control" value='<%=rs.getString("p_id") %>'>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2"><fmt:message key="pname"/></label>
						<div class="col-sm-3">
							<input type="text" id="name" name="name" class="form-control" value='<%=rs.getString("p_name") %>'>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2"><fmt:message key="unitPrice"/></label>
						<div class="col-sm-3">
							<input type="text" id="unitPrice" name="unitPrice" class="form-control" value='<%=rs.getInt("p_unitPrice") %>'>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2"><fmt:message key="description"/></label>
						<div class="col-sm-5">
							<textarea name="description" cols="50" rows="2" class="form-control"><%=rs.getString("p_description") %></textarea>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2"><fmt:message key="manufacturer"/></label>
						<div class="col-sm-3">
							<input type="text" name="manufacturer" class="form-control" value='<%=rs.getString("p_manufacturer") %>'>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2"><fmt:message key="category"/></label>
						<div class="col-sm-3">
							<input type="text" name="category" class="form-control" value='<%=rs.getString("p_category") %>'>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2"><fmt:message key="unitsInStock"/></label>
						<div class="col-sm-3">
							<input type="text" id="unitsInStock" name="unitsInStock" class="form-control" value='<%=rs.getLong("p_unitsInStock") %>'>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2"><fmt:message key="condition"/></label>
						<div class="col-sm-5">
							<input type="radio" name="condition" value="New">
							<fmt:message key="condition_New"/>
							<input type="radio" name="condition" value="Old">
							<fmt:message key="condition_Old"/>
							<input type="radio" name="condition" value="Refurbished">
							<fmt:message key="condition_Refurbished"/>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2"><fmt:message key="productImage"/></label>
						<div class="col-sm-5">
							<input type="file" name="productImage" class="form-control">
						</div>
					</div>
					<div class="form-group row">
						<div class="col-sm-offset-2 col-sm-10">
							<input type="submit" value="<fmt:message key="button"/>" class="btn btn-primary">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<%
		}
		if(rs != null)
			rs.close();
		if(pstmt != null)
			pstmt.close();
		if(conn != null)
			conn.close();
	%>
	</fmt:bundle>
</body>
</html>