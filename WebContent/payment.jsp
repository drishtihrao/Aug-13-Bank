<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
		<form action="transfer.app">
			<table>
				<tr>
					<td>Enter sender account : <input type="number" min="101" name="sender"
						required="required"></td>
				</tr>
				<tr>
					<td>Enter receiver account no: <input type="number" min="101" name="reciever"
						required="required"></td>
				</tr>
				<tr>
					<td>Enter amount: <input type="number" name="amount" min="1"
						required="required"></td>
				</tr>
				<tr>
					<td><input type="submit" value="Transfer"></td>
				</tr>
			</table>
		</form>
	</div>
	<div>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>