<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>  

<!DOCTYPE html>
<html>
<head>
<meta http-equiv='Content-Type' content="text/html; charset=UTF-8">
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
	crossorigin="anonymous" />
<!-- JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0"
	crossorigin="anonymous"></script>
<title>Create Client</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<div class="d-flex justify-content-center"
		style="background-color: #f3f3f3; min-height: 600px; text-align: center; padding: 50px">		
		<div class="row" style="width: 700px">
			<h1>Create Client</h1>
			<form:form action="saveclient" method="POST">
				<div class="row mt-2 mb-2">
					<div class="col-3" style="text-align: right;">
						<label for="inputIDNumber" class="col-form-label">ID
							Number</label>
					</div>
					<div class="col-6">
						<form:input type="text" path="ClientID" class="form-control" maxlength="15" required="required"
						oninvalid="this.setCustomValidity('This is a mandatory field, no space or symbol')" oninput="setCustomValidity('')"  pattern="[a-zA-Z0-9]+" />
					</div>
					<div class="col-3 d-flex align-items-center" style="color: red; font-style: italic;">${errorMessage}</div>
					
				</div>

				<div class="row mt-2 mb-2">
					<div class="col-3" style="text-align: right;">
						<label class="col-form-label">First
							Name</label>
					</div>
					<div class="col-6">
						<form:input type="text" path="firstName" class="form-control" maxlength="60" required="required"
						oninvalid="this.setCustomValidity('This is a mandatory field, no symbol, no number')" oninput="setCustomValidity('')"  pattern="[a-zA-Z ]+" />
					</div>
					<div class="col-3"></div>
				</div>

				<div class="row mt-2 mb-2">
					<div class="col-3" style="text-align: right;">
						<label class="col-form-label">Last
							Name</label>
					</div>
					<div class="col-6">
						<form:input type="text" path="lastName" class="form-control" maxlength="60" required="required"
						oninvalid="this.setCustomValidity('This is a mandatory field, no symbol, no number')" oninput="setCustomValidity('')" pattern="[a-zA-Z ]+" />
					</div>
					<div class="col-3"></div>
				</div>

				<div class="row mt-2 mb-2">
					<div class="col-3" style="text-align: right;">
						<label class="col-form-label">Gender</label>
					</div>
					<div class="col-6">
						<form:select class="form-select" path="gender">
							<form:option value="M">Male</form:option>
							<form:option value="F">Female</form:option>
							<form:option value="U">Unknown</form:option>						
						</form:select>
					</div>
					<div class="col-3"></div>
				</div>
				
				<div class="row mt-2 mb-2">
					<div class="col-3" style="text-align: right;">
						<label for="inputIDNumber" class="col-form-label">Date of Birth</label>
					</div>
					<div class="col-6">
						<form:input type="date" path="DateOfBirth" required="required" max="${maxDate}" class="form-control" 
						oninvalid="this.setCustomValidity('This is a mandatory field and Date cannot be in future')" oninput="setCustomValidity('')" />
					</div>
					<div class="col-3"></div>
				</div>
				<div class="row mt-2 mb-2">
					<div class="col-3" style="text-align: right;">
						<label class="col-form-label">Marital Status</label>
					</div>
					<div class="col-6">
						
						<form:select class="form-select" path="maritalStatus">
							<form:option value="S">Single</form:option>
							<form:option value="M">Married</form:option>
							<form:option value="D">Divorced</form:option>						
						</form:select>					
					</div>
					<div class="col-3" style="text-align: right;"></div>
				</div>
				
				<div class="row mt-2 mb-2">
					<div class="col-3" style="text-align: right;">
						<label class="col-form-label">Address</label>
					</div>
					<div class="col-6">
						<form:textarea path="address" class="form-control" maxlength="120" required="required"
						oninvalid="this.setCustomValidity('This is a mandatory field')" oninput="setCustomValidity('')" />
					</div>
					<div class="col-3" style="text-align: right;"></div>
				</div>
				
				<div class="row mt-2 mb-2">
					<div class="col-3" style="text-align: right;">
						<label class="col-form-label">Country</label>
					</div>
					<div class="col-6">
						<form:select path="country" class="form-select">
							<form:option value="VNI">Vietnam</form:option>
							<form:option value="USA">United States</form:option>
							<form:option value="SIN">Singapore</form:option>
							<form:option value="MAL">Malaysia</form:option>
						</form:select>
					</div>
					<div class="col-3" style="text-align: right;"></div>
				</div>
				<button type="submit" class="btn btn-primary">Save</button>
			</form:form>
		</div>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>