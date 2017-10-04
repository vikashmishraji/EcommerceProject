<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<%@ include file="header.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form:form action="saveproduct" method="post" modelAttribute="product" enctype="multipart/form-data">
	
		<div class="form-group">
			<form:hidden path="id" class="form-control " />
		</div>
		<div class="Form-group">
			Enter Product Name<br>
			
			
			<form:input path="productName" />
			<br> Enter price<br>
			
			
			<form:input path="price" />
			<br> Enter Quantity<br>
			
			<form:input path="quantity" />
			<br> Enter Description<br>
			
			<form:textarea path="description" class="Form-control" />
		</div>
		<br>
		<div calss="form-group">
	Upload an image<br>
	
	<input type="file" name="image">
	</div>
		
		<div class="form-group">
			Select Category<br>
			
			<c:forEach items="${categories }" var="c">
				<form:radiobutton path="category.id" value="${c.id }" />${c.categoryName }
</c:forEach>
		</div>
		<div class="form-group">
			<input type="submit" value="Add product">
		</div>
	</form:form>
</body>
<%@ include file="Footer.jsp"%>
</html>