
<%@ include file="header.jsp" %>

<div >
<div >
<c:url value="/cart_clearcart${cart.id }" var="clear"></c:url>
<a href="${clear }" class="btn btn-danger" pull-left  >
<span class="glyphicon glypicon-remove-sign"></span>
Clear Cart
</a>
<a href="<c:url value="/cart_shippingaddressform${cart.id}"></c:url>" class="btn btn-success pull-right">
<span class="glyphicon glypicon-shopping-cart"></span> Check Out  </a>
<table class="table table-striped">
<thead>
<tr><th>Name</th><th>Quantity</th><th>Total Price</th><th>Remove</th>
</tr>
</thead>
<c:set var="grandTotal" value="0"></c:set>
<c:forEach items="${cart.cartItems }" var="cartItem">
<tr>
<td>${cartItem.product.productName}</td>
<td>${cartItem.quantity}</td>
<td>${cartItem.totalPrice}</td>
<c:url value="/cart_removecartitem${cartItem.cartItemId }" var="remove"></c:url>
<td><a href="${remove }" class="label label-danger" pull-left>
<c:set var="grandTotal" value="${cartItem.totalPrice + grandTotal}"></c:set>
<span class="glyphicon glypicon-remove" ></span>Remove
</a></td>
<td></td>

</tr>
</c:forEach>
</table>
Total Price :${grandTotal }
</div>

</div>
<%@ include file="Footer.jsp" %>