

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>

<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">


<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link
	href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css"
	rel="stylesheet">


<script
	src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>

<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">

<link rel="icon" href="resources/images/favicon.ico" type="image/ico"></link>




</head>


<body>
			<c:url value="/getproductForm" var="url3"></c:url>

	<nav class="navbar navbar-inverse" style="background:black">
	<div class="container-Fluid">


		<button type="button" class="navbar-toggle collapsed"
			data-toggle="collapse" data-target="#collapse-example"
			aria-expanded="false">
			<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>


		<div class="navbar-header">
			<c:url value="resources/images/four.jpg" var="url5"></c:url>

			<a class="navbar-brand" href="#"><img src="${url5}	" alt="NIIT"
				height="30px" width="30px"></a>
		</div>


		<div class="collapse navbar-collapse" id="collapse-example">
			<ul class="nav navbar-nav">
				<c:url value="/home" var="url1"></c:url>
				<li class="action"><a href="${url1 }"><span
						class="glyphicon glyphicon-home"></span> Home<span class="sr-only">You
							are in home page link</span></a></li>


				<c:url value="/aboutus" var="url2"></c:url>
				<li><a href="${url2 }"><span class="glyphicon glyphicon-user"></span> About Us</a></li>



				<c:url value="/getproductForm" var="url3"></c:url>
				<li><c:if
						test="${pageContext.request.userPrincipal.name!=null }">
						<security:authorize access="hasRole('ROLE_ADMIN')">
							<a href="${url3 }"><span class="glyphicon glyphicon-plus"></span>
									AddProduct</a>
						</security:authorize>
					</c:if></li>


				<c:url value="/getallproducts" var="url4"></c:url>
				<li><a href="${url4 }">Browse All products</a></li>


				<li class="dropdown"><a href="" class="dropdown-toggle"
					data-toggle="dropdown"> Select by Category<b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><c:forEach items="${categories }" var="c">


								<c:url
									value="/all_product_searchbycategory?searchCondition=${c.categoryName }"
									var="url"></c:url>

								<a href="${url }">${c.categoryName } </a>
							</c:forEach> <c:url value="/all_product_searchbycategory?searchCondition=All"
								var="urll">

							</c:url> <a href="${urll }">All</a></li>
					</ul></li>



				<li><c:if
						test="${pageContext.request.userPrincipal.name!=null }">
						<a href="${url2 }">Welcome ${pageContext.request.userPrincipal.name }</a>
					</c:if></li>

				<c:if test="${pageContext.request.userPrincipal.name==null }">
					<c:url value="/Registrationform" var="url5"></c:url>
					<li><a href="${url5 }"><i class="fa fa-user-plus" aria-hidden="true"></i>Sign up</a></li>
					<c:url value="/login" var="url6"></c:url>
					<li><a href="${url6 }"><i class="fa fa-sign-in" aria-hidden="true"></i>Sign In</a></li>
				</c:if>
				<c:url value="/j_spring_security_logout" var="logoutUrl"></c:url>
				<c:if test="${pageContext.request.userPrincipal.name!=null }">
					<li><a href="${logoutUrl }">logout</a></li>
				</c:if>
			</ul>
		</div>
	</div>

	</nav>