<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
body {
	background-color: #7fffda;
}
</style>
<body>
	<div>
		<jsp:include page="header.jsp"></jsp:include>
	</div>
	<div id="check" align="center">
		<form id="search" action="search.app">
			<table>
				<tr>
					<td>Enter Account Number: <input type="number" id="accNo" name="accNo"
						required="required"></td>
				</tr>
				<tr>
					<td><input type="submit" value="Search"></td>
				</tr>
			</table>
		</form>
	</div>
	<div>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>


<script>
	function myFunction() {

	}
</script>
</html>