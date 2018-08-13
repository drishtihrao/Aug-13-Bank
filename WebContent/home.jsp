<%@  page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>MM Bank</title>
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
		<table>
			<tr>
				<td><a href="addnewaccount.app">Add New Account</a></td>
			</tr>
			<tr>
				<td><a href="viewAllCustomers.app">View All Customers</a></td>
			</tr>
			<tr>
				<td><a href="searchAccount.app">Search Account</a></td>
			</tr>
			<tr>
				<td><a href="withdrawAmount.app">Withdraw Amount</a></td>
			</tr>
			<tr>
				<td><a href="depositAmount.app">Deposit Amount</a></td>
			</tr>
			<tr>
				<td><a href="fundTransfer.app">Fund Transfer</a></td>
			</tr>
		</table>
	</div>
	<div>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>