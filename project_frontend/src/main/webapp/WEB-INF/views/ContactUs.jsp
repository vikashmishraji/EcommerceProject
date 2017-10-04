<%@ include file="header.jsp"%>
<div class="container">
<div class="row">
	<div class="col-sm-6">

		<p>
		<h3>
			<i class="fa fa-home" aria-hidden="true"></i>Contact information
		</h3>
		</p>

		<p>
			<h4>Shop No-03, Building No.09, Sai shiddhi Sankul Adarsh
			Co.op-Hgs.Soc.Ltd.<br> Western Express High-Way Jogeshwari
		<p>(E), Mumbai - 400 060.</p></h4>

		<i class="fa fa-phone" aria-hidden="true"></i> 8085414433<br> <i
			class="fa fa-envelope" aria-hidden="true"></i>
		<h4>92mishravikash@gmail.com</h4>

	</div>
	<div class="col-sm-6">

		<form class="form-inline" action="sendmail">
			<div class="form-group">
				<label for="email">Name:</label> <input type="name"
					class="form-control" id="name">
			</div>
			<div class="form-group">
				<label for="pwd">Email:</label> <input type="Email"
					class="form-control" id="Email">
			</div>
			<div class="form-group" style="text-align: center;">
				<input type="submit" value="Send message" class="btn btn-info">
			</div>


		</form>
		<div class="form-group">
			<textarea placeholder="message" rows="3" cols="75"></textarea>
		</div>
		
			
	</div>
	
</div>
</div>
<%@ include file="Footer.jsp"%>