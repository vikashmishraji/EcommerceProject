
<%@ include file="header.jsp"%>
<c:url value="/j_spring_security_check" var="login"></c:url>
<form action="${login }" method="post">
Enter username <input type="text" name="j_username" class="form-control"><br><br>
Enter password <input type="password" name="j_password" class="form-control"><br><br>
<input type="submit" value="Login" class="btn btn-info center-block"><br>
</form>
<%@ include file="Footer.jsp"%>





