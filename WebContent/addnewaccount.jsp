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
		<h3>Enter Account Holder Details</h3>
		<form id="basic" method="post" action="add.app">
			<table>
				<tr>
					<td>Enter acc holder name:<input type="text" name="accName"
						placeholder="Name" required /></td>
				</tr>
				<br>
				<tr>
					<td>Contact number: <input type="tel" name="contact"
						placeholder="Contact number" min=10 max=10 required /></td>
				</tr>
				<br>
				<tr>
					<td>Date of Birth: <input type="date" name="dob"
						placeholder="D.O.B." required></td>
				</tr>
				<br>
				<tr>
					<td>Email id: <input type="email" name="email"
						placeholder="Email id" required /></td>
				</tr>
				<br>
				<tr>
					<td>Account Type: <select id="accountType" name="accountType"
						onchange="setButton();" required="required">
							<option value="default" selected="selected">----SELECT----</option>
							<option value="savingaccount">Saving Account</option>
							<option value="currentaccount">Current Account</option>
					</select>
					</td>
				</tr>
				<br>
				<!-- Creating a section to select either salary type or non salary type Savings Account -->
				<tr>
					<td>
						<div id="sa" style="display: none">
							<input type="radio" id="salary" name="salary" value="Blue"
								onclick="setBalance(this.value);">Salary <input
								type="radio" id="salary" name="salary" value="Red"
								onclick="setBalance(this.value);">Not Salaried
						</div>
					</td>
				</tr>
				<!-- Setting the conditions of zero balance salary account -->
				<tr>
					<td>
						<div id="salbal" style="display: none">
							Enter Opening Balance: <input type="number" name="salbal" min=0
								placeholder="Minimum 0">
						</div>
					</td>
				</tr>
				<!-- Setting the conditions of minimum balance salary account -->
				<tr>
					<td>
						<div id="bal" style="display: none">
							Enter Opening Balance: <input type="number" name="bal" min=5000
								placeholder="Minimum 5000">
						</div>
					</td>
				</tr>

				<!-- Creating a section to set the od limit and account balance for a current account -->
				<tr>
					<td>
						<div id="ca" style="display: none">
							Enter Over Draft Limit:<input type="number" min=0 name="odLimit"><br>
							Enter account balance:<input type="number" min=10000 name="cbal"><br>
						</div>
					</td>
				</tr>


				<tr>
					<td align="center"><input type="reset" value="Clear"></td>
				</tr>
				<br>
				<tr>
					<td align="center"><input type="submit" value="Create Account"></td>

				</tr>
			</table>
		</form>
	</div>
		<div>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
<script>
	function setButton() {
		var dropdown = document.getElementById("accountType");
		var type = dropdown.options[dropdown.selectedIndex].value;
		if (type == "savingaccount") {
			document.getElementById("sa").style.display = "block";
			document.getElementById("ca").style.display = "none";
		} else if (type == "currentaccount") {
			document.getElementById("sa").style.display = "none";
			document.getElementById("ca").style.display = "block";
		} else if (type == "default") {
			document.getElementById("ca").style.display = "none";
			document.getElementById("sa").style.display = "none";
		}
	}
	function setBalance(bal) {
		switch (bal) {
		case "Blue":
			document.getElementById("salbal").style.display = "block";
			document.getElementById("bal").style.display = "none";
			break
		case "Red":
			document.getElementById("bal").style.display = "block";
			document.getElementById("salbal").style.display = "none";
			break
		}
	}
</script>
</html>