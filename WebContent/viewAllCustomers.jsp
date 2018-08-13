<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
body {
	background-color: #7fffda;
}
</style>
</head>
<body>

	<div>
		<jsp:include page="header.jsp"></jsp:include>
	</div>
	
	<div align="center">

		<h1>Account Holder List</h1>
		<jstl:if test="${requestScope.customers != null }">
			<table>
				<tr>
					<th>Customer ID</th>
					<th>Name</th>
					<th>Date of Birth</th>
					<th>Email ID</th>
					<th>Contact</th>
				</tr>
				<jstl:forEach items="${requestScope.customers}" var="customer">
					<tr>
						<td>${customer.customerId}</td>
						<td>${customer.customerName}</td>
						<td>${customer.dateOfBirth}</td>
						<td>${customer.emailId}</td>
						<td>${customer.contactNumber}</td>
					</tr>
				</jstl:forEach>
			</table>
		</jstl:if>
		<jstl:if test="${requestScope.customers == null}">
			<h2>No customers found!</h2>
		</jstl:if>
	</div>
	<div>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>

</body>
</html>