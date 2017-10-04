<%@ include file="header.jsp"%>

<div class="container wrapper">
	<div class="container">
		<c:url value="/all_savecustomer" var="url"></c:url>
		<form:form action="${url }" modelAttribute="customer">

			<div class="form-group">
				<form:label path="firstname">Enter Firstname</form:label>
				<form:input path="firstname" class="form-control"></form:input>
				<form:errors path="firstname" cassStyle="color:red"></form:errors>
			</div>


			<div class="form-group">
				<form:label path="lastname">Enter Lastnane</form:label>
				<form:input path="lastname" class="form-control" />
				<form:errors path="lastname" cssStyle="color:red"></form:errors>
			</div>


			<div class="form-group">
				<form:label path="email">Enter Email</form:label>
				<form:input path="email" class="form-control" />
				<form:errors path="email" cssStyle="color:red"></form:errors>
				<p style="color: red">${duplicateEmail }</p>
			</div>




			<div class="form-group">
				<form:label path="phone">Enter phone Number</form:label>
				<form:input path="phone" class="form-control" />
				<form:errors path="phone" cssStyle="color:red"></form:errors>
			</div>





			<div class="form-group">
				<form:label path="user.username"> Enter Username</form:label>
				<form:input path="user.username" class="form-control" />
				<form:errors path="user.username" cssStyle="color:red"></form:errors>
				<p style="color: red">${duplicateUsername }</p>
			</div>



			<div class="form-group">
				<form:label path="user.password">Enter Password</form:label>
				<form:input path="user.password" type="password"
					class="form-control" />
				<form:errors path="user.password" cssStyle="color:red"></form:errors>
			</div>





			<div class="form-group">
				<form:label path="billingAddress.streetname">Enter Streetname</form:label>
				<form:input path="billingAddress.streetname" class="form-control" />
				<form:errors path="billingAddress.streetname" cssStyle="color:red"></form:errors>
			</div>



			<div class="form-group">
				<form:label path="billingAddress.apartmentnumber">Enter apartmentnumber </form:label>
				<form:input path="billingAddress.apartmentnumber"
					class="form-control" />
				<form:errors path="billingAddress.apartmentnumber"
					cssStyle="color:red"></form:errors>
			</div>


			<div class="form-group">
				<form:label path="billingAddress.city">Enter City </form:label>
				<form:input path="billingAddress.city" class="form-control" />
				<form:errors path="billingAddress.city" cssStyle="color:red"></form:errors>
			</div>

			<div class="form-group">
				<form:label path="billingAddress.state">Enter State </form:label>
				<form:input path="billingAddress.state" class="form-control" />
				<form:errors path="billingAddress.state" cssStyle="color:red"></form:errors>
			</div>


			<div class="form-group">
				<form:label path="billingAddress.country">Enter Country </form:label>
				<form:input path="billingAddress.country" class="form-control" />
				<form:errors path="billingAddress.country" cssStyle="color:red"></form:errors>
			</div>



			<div class="form-group">
				<form:label path="billingAddress.zipcode">Enter Zipcode </form:label>
				<form:input path="billingAddress.zipcode" class="form-control" />
				<form:errors path="billingAddress.zipcode" cssStyle="color:red"></form:errors>
			</div>

			<div class="form-group">
				<form:label path="shippingAddress.streetname">Enter Streetname</form:label>
				<form:input path="shippingAddress.streetname" class="form-control" />
				<form:errors path="shippingAddress.streetname" cssStyle="color:red"></form:errors>
			</div>


			<div class="form-group">
				<form:label path="shippingAddress.apartmentnumber">Enter apartmentnumber </form:label>
				<form:input path="shippingAddress.apartmentnumber"
					class="form-control" />
				<form:errors path="shippingAddress.apartmentnumber"
					cssStyle="color:red"></form:errors>
			</div>

			<div class="form-group">
				<form:label path="shippingAddress.city">Enter City </form:label>
				<form:input path="shippingAddress.city" class="form-control" />
				<form:errors path="shippingAddress.city" cssStyle="color:red"></form:errors>
			</div>

			<div class="form-group">
				<form:label path="shippingAddress.state">Enter State </form:label>
				<form:input path="shippingAddress.state" class="form-control" />
				<form:errors path="shippingAddress.state" cssStyle="color:red"></form:errors>
			</div>

			<div class="form-group">
				<form:label path="shippingAddress.country">Enter Country </form:label>
				<form:input path="shippingAddress.country" class="form-control" />
				<form:errors path="shippingAddress.country" cssStyle="color:red"></form:errors>
			</div>


			<div class="form-group">
				<form:label path="shippingAddress.zipcode">Enter Zipcode </form:label>
				<form:input path="shippingAddress.zipcode" class="form-control" />
				<form:errors path="shippingAddress.zipcode" cssStyle="color:red"></form:errors>
			</div>
			<div class="form-group" style="text-align: center;">
				<input type="submit" value="Register" class="btn btn-info">
			</div>
		</form:form>
	</div>
</div>

<%@ include file="Footer.jsp"%>
</body>
</html>