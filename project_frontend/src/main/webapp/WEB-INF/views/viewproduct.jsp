
<%@ include file="header.jsp"%>
<c:url value="resources/images/${product.id }.png" var="imagesUrl"></c:url>

<b>Details about the Product</b>
<table>
<tr>
<td><img src="${imagesUrl }" width="200" height="200"></td>
<td>Product Name:</td><td> ${product.productName }</td>
</tr>
<tr>
<td>Price: </td><td>${product.price }</td>
</tr>
<tr><td> Description:</td><td>${product.description }</td>
<tr>
<td>Quantity:</td><td>${product.quantity }</td>
</tr>
</table>


<c:url value="/cart_addtocart${product.id }" var="url"></c:url>


<form action="${url }">
<security:authorize access="hasRole('ROLE_USER')">
	<h3><b>Enter Units</b></h3><input type="text" name="units" style="width:20%"><br>
	<p style="color:red">${errorQuantity }</p>
	
	<button type="submit" class="btn btn-primary btn-lg">
		Add to cart
	</button>
	</security:authorize>
	
</form>
<c:url value="/getallproducts" var="ram"></c:url>
<a href="${ram }">Back to product list</a><br>



<%@ include file="Footer.jsp"  %>