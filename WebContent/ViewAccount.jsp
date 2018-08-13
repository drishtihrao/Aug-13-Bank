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
	background-color: #7fffff;
}
</style>
</head>
<body>
	<div>
		<jsp:include page="header.jsp"></jsp:include>
	</div>
	<div align="center">
		<h1>Account Holder List</h1>

		<jstl:if test="${requestScope.bankAccount != null }">
			<table>
				<tr>Customer Name: ${bankAccount.customer.customerName}
				</tr>
				<br>
				<tr>Account Number: ${bankAccount.accountNumber}
				</tr>
				<br>
				<tr>Customer ID: ${bankAccount.customer.customerId}
				</tr>
				<br>
				<tr>Account Type: ${classType}
				</tr>
				<br>
				<tr>Account Balance: ${bankAccount.accountBalance}
				</tr>
				<br>
				<jstl:if test="${classType.equals('MMCurrentAccount')}">
					<tr>OD Limit: ${bankAccount.odLimit}
					</tr>
					<br>
				</jstl:if>
				<jstl:if test="${classType.equals('MMSavingsAccount')}">
					<tr>Salary: ${bankAccount.salaryValue}
					</tr>
					<br>
				</jstl:if>
			</table>
		</jstl:if>
		<jstl:if test="${requestScope.bankAccount == null }">
			<h4>No ACCOUNT Found!</h4>
		</jstl:if>
	</div>
		<div>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>