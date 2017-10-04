<%@ include file="header.jsp"  %>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="resources/js/jquery.dataTables.js"></script>
<script>
	$(document).ready(function() {
		var searchCondition = '${searchCondition}';
		$('.table').DataTable({
			"lengthMenu" : [ [ 3, 5, 7, -1 ], [ 3, 5, 7, "ALL" ] ],
			"oSearch" : {
				"sSearch" : searchCondition
			}

		})
	});
</script>
	<b>List of products</b>
	<div class="container">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>Product Name</th>
					<th>Action</th>
					<th>price</th>
					<th>   </th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${products }" var="p">
					<c:url value="resources/images/${p.id }.png" var="imagesUrl"></c:url>
					<c:url value="/all_product_viewproduct${p.id }" var="viewUrl"></c:url>
					<c:url value="/admin_product_deleteproduct${p.id }"
						var="deleteUrl"></c:url>

					<tr>
						<td><img src="${imagesUrl }" height="50" width="50"></td>
						<td><a href="${viewUrl }">${p.productName }</a></td>
						<td>${p.price }"</td>
						<td><a href="${viewUrl}"><span class=glyphiconglyphicon-info-sign" ></span></a>
							<a href="${deleteUrl }"><span
								class="glyphicon glyphicon-trash"></span></a> <c:url
								value="/admin_product_geteditform${p.id }" var="editUrl"></c:url>
							<a href="${editUrl }"><span class=glyphiconglyphicon-pencial"></span></a>
						</td>
					</tr>
				</c:forEach>
				
<security:authorize access="hasRole('ROLE_ADMIN')">
<a href="${deleteUrl }"><span class="glyphicon glyphicon-trash"></span></a>
<c:url value="/admin_product_geteditform${p.id }" var="editUrl"></c:url>
<a href="${editUrl }"><span class="glyphicon glyphicon-pencil"></span></a>
</security:authorize>
		</table>
	</div>

<%@ include file="Footer.jsp"  %>
