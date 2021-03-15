<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.1/css/bootstrap.css" />
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.24/css/dataTables.bootstrap4.css" />


<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.1/js/bootstrap.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/1.10.24/js/dataTables.bootstrap4.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.0/font/bootstrap-icons.css">

<script type="text/javascript">
	function fillClient(clientID, firstName, lastName, dateOfBirth, gender,
			maritalStatus, address, country) {

		document.getElementById("clientID").innerHTML = clientID + '';
		document.getElementById("firstName").innerHTML = firstName;
		document.getElementById("lastName").innerHTML = lastName;
		document.getElementById("dateOfBirth").innerHTML = dateOfBirth;
		if (gender == 'M')
			document.getElementById("gender").innerHTML = 'Male';
		else if (gender == 'F')
			document.getElementById("gender").innerHTML = 'Female';
		else 
			document.getElementById("gender").innerHTML = 'Unknown';
		
		if (maritalStatus == 'S')
			document.getElementById("maritalStatus").innerHTML = 'Single';
		else if (maritalStatus == 'M')
			document.getElementById("maritalStatus").innerHTML = 'Married';
		else document.getElementById("maritalStatus").innerHTML = 'Divorced';
		document.getElementById("address").innerHTML = address;
		
		if (country == 'VNI')
			document.getElementById("country").innerHTML = 'Vietnam';
		else if (country == 'USA')
			document.getElementById("country").innerHTML = 'United States';
		else if (country == 'SIN')
			document.getElementById("country").innerHTML = 'Singapore';
		else
			document.getElementById("country").innerHTML = 'Malaysia';
	};
	$(document)
			.ready(
					function() {
						$('#table_id').DataTable({
							dom : '<"toolbar">frtip',
							scrollY : '55vh',
							scrollCollapse : true,
							"pageLength" : 100,
							"pageChange" : false,
							"bInfo" : false,
							select : true
						});
						$("#clientEditContainer").hide();
						$('#btnEditCancel').click(function() {
							$("#clientInfoContainer").show(1000);
							$("#clientEditContainer").hide();
						});

						$('#btnEditClient').click(function() {
							$("#clientInfoContainer").hide();							
							$("#clientEditContainer").show(1000);
							
							document.getElementById("txtClientID").value = document.getElementById("clientID").textContent;
							document.getElementById("txtFirstName").value = document.getElementById("firstName").textContent;	
							document.getElementById("txtLastName").value = document.getElementById("lastName").textContent;	
							document.getElementById("txtAddress").value = document.getElementById("address").textContent;
							document.getElementById("txtDateOfBirth").value = document.getElementById("dateOfBirth").textContent;
							
							var gender = document.getElementById("gender").textContent;							
							if (gender == "Male")
								document.getElementById('selGender').getElementsByTagName('option')[0].selected = 'M';
							if (gender === "Female")
								document.getElementById('selGender').getElementsByTagName('option')[1].selected = 'F';
							if (gender == "Unknown")
								document.getElementById('selGender').getElementsByTagName('option')[2].selected = 'U';
							
							var maritalStatus = document.getElementById("maritalStatus").textContent;							
							if (maritalStatus == "Single")
								document.getElementById('selMaritalStatus').getElementsByTagName('option')[0].selected = 'M';
							if (maritalStatus === "Married")
								document.getElementById('selMaritalStatus').getElementsByTagName('option')[1].selected = 'M';
							if (maritalStatus == "Divorced")
								document.getElementById('selMaritalStatus').getElementsByTagName('option')[2].selected = 'D';
							
							var country = document.getElementById("country").textContent;							
							if (country == "Vietnam")
								document.getElementById('selCountry').getElementsByTagName('option')[0].selected = 'VNI';
							if (country === "United States")
								document.getElementById('selCountry').getElementsByTagName('option')[1].selected = 'USA';
							if (country == "Singapore")
								document.getElementById('selCountry').getElementsByTagName('option')[2].selected = 'SIN';
							if (country == "Malaysia")
								document.getElementById('selCountry').getElementsByTagName('option')[2].selected = 'MAL';													
						});
											
						$("div.toolbar").addClass('float-left');
						$("div.toolbar")
								.html(
										'<a href="/ClientUS001/createclient" ><button type="button" class="btn btn-success">Create new client</button></b></a>');
					});
</script>

<title>Client Managerment</title>
</head>
<body>
	<%
	java.text.DateFormat df = new java.text.SimpleDateFormat("dd/MM/yyyy");
	%>
	<%@ include file="header.jsp"%>
	<div class="d-flex justify-content-center"
		style="background-color: #f3f3f3; min-height: 600px">

		<div
			class="row d-flex justify-content-center w-100 pl-3 pr-3 pt-5 pb-5">

			<div class="col-4 card-body bg-white rounded border mr-5 p-4">
				<!-- Client Infor -->
				<div class="row" id="clientInfoContainer">
					<div class="col-12 d-flex justify-content-end">
						<button class="btn btn-primary" id="btnEditClient">Edit</button>
					</div>
					<div class="col-12 d-flex justify-content-center">
						<img class="grounded"
							src="https://icons-for-free.com/iconfiles/png/512/avatar+circle+male+profile+user+icon-1320196710301016992.png"
							style="width: 170px" />
					</div>

					<div class="col-12 mt-2 d-flex justify-content-center">
						<i><b id="clientID"></b></i>
					</div>
					<div class="col-12 row mt-4">
						<div class="col-4">
							<span style="font-weight: 500">First name:</span>
						</div>
						<div class="col-7">
							<span id="firstName"></span>
						</div>
					</div>
					<div class="col-12 row mt-3">
						<div class="col-4">
							<span style="font-weight: 500">Last name:</span>
						</div>
						<div class="col-7">
							<span id="lastName"></span>
						</div>
					</div>
					<div class="col-12 row mt-3">
						<div class="col-4">
							<span style="font-weight: 500">Date of birth:</span>
						</div>
						<div class="col-7" id="dateOfBirth"></div>
					</div>
					<div class="col-12 row mt-3">
						<div class="col-4">
							<span style="font-weight: 500">Gender:</span>
						</div>
						<div class="col-7" id="gender"></div>
					</div>
					<div class="col-12 row mt-3">
						<div class="col-4">
							<span style="font-weight: 500">Marital Status:</span>
						</div>
						<div class="col-7" id="maritalStatus"></div>

					</div>
					<div class="col-12 row mt-3">
						<div class="col-4">
							<span style="font-weight: 500">Country:</span>
						</div>
						<div class="col-7" id="country"></div>
					</div>

					<div class="col-12 row mt-3">
						<div class="col-4">
							<span style="font-weight: 500">Address:</span>
						</div>
						<div class="col-7" id="address"></div>
					</div>
				</div>

				<!-- form edit -->
				<div class="row" id="clientEditContainer">
					<div class="col-12 d-flex justify-content-end"
						style="padding-right: 25px;">
						<button class="btn btn-default" id="btnEditCancel">X</button>
					</div>
					<form:form class="w-100  pl-4 pr-4 mt-4" action="updateclient"
						method="POST">
						<div class="row mt-2 mb-2">
							<div class="col-4">
								<label for="inputIDNumber" class="col-form-label">ID
									Number</label>
							</div>
							<div class="col-8">
								<form:input type="text" path="ClientID" id="txtClientID" class="form-control"
									 readonly="true" />
							</div>
						</div>

						<div class="row mt-2 mb-2">
							<div class="col-4">
								<label class="col-form-label">First Name</label>
							</div>
							<div class="col-8">
								<form:input type="text" path="firstName" id="txtFirstName" class="form-control"
									maxlength="60" required="required"
									oninvalid="this.setCustomValidity('This is a mandatory field, no symbol, no number')"
									oninput="setCustomValidity('')" pattern="[a-zA-Z ]+" />
							</div>
						</div>

						<div class="row mt-2 mb-2">
							<div class="col-4">
								<label class="col-form-label">Last Name</label>
							</div>
							<div class="col-8">
								<form:input type="text" path="lastName" id="txtLastName" class="form-control"
									maxlength="60" required="required"
									oninvalid="this.setCustomValidity('This is a mandatory field, no symbol, no number')"
									oninput="setCustomValidity('')" pattern="[a-zA-Z ]+" />
							</div>
						</div>

						<div class="row mt-2 mb-2">
							<div class="col-4">
								<label class="col-form-label">Gender</label>
							</div>
							<div class="col-8">
								<form:select class="custom-select" id="selGender" path="gender">
									<form:option value="M">Male</form:option>
									<form:option value="F">Female</form:option>
									<form:option value="U">Unknown</form:option>
								</form:select>
							</div>
						</div>

						<div class="row mt-2 mb-2">
							<div class="col-4">
								<label for="inputIDNumber" class="col-form-label">Date
									of Birth</label>
							</div>
							<div class="col-8">
								<form:input type="date" path="DateOfBirth" id="txtDateOfBirth" required="required"
									max="${maxDate}" class="form-control"
									oninvalid="this.setCustomValidity('This is a mandatory field and Date cannot be in future')"
									oninput="setCustomValidity('')" />
							</div>
						</div>
						<div class="row mt-2 mb-2">
							<div class="col-4">
								<label class="col-form-label">Marital Status</label>
							</div>
							<div class="col-8">

								<form:select class="custom-select" id="selMaritalStatus" path="maritalStatus">
									<form:option value="S">Single</form:option>
									<form:option value="M">Married</form:option>
									<form:option value="D">Divorced</form:option>
								</form:select>
							</div>

						</div>

						<div class="row mt-2 mb-2">
							<div class="col-4">
								<label class="col-form-label">Address</label>
							</div>
							<div class="col-8">
								<form:textarea path="address" id="txtAddress" class="form-control"
									maxlength="120" required="required"
									oninvalid="this.setCustomValidity('This is a mandatory field')"
									oninput="setCustomValidity('')" />
							</div>

						</div>

						<div class="row mt-2 mb-2">
							<div class="col-4">
								<label class="col-form-label">Country</label>
							</div>
							<div class="col-8">
								<form:select path="country" id="selCountry" class="custom-select">
									<form:option value="VNI">Vietnam</form:option>
									<form:option value="USA">United States</form:option>
									<form:option value="SIN">Singapore</form:option>
									<form:option value="MAL">Malaysia</form:option>
								</form:select>
							</div>
						</div>
						<div class="col-12 d-flex justify-content-center mt-5">
							<button type="submit" class="btn btn-primary">Save</button>
						</div>
					</form:form>
				</div>
			</div>

			<!-- Datatables -->
			<div class="col-7 card-body bg-white rounded border">
				<table id="table_id" class="table table-hover table-bordered"
					style="width: 100%"">
					<thead>
						<tr>
							<th>ID Number</th>
							<th>First Name</th>
							<th>Last Name</th>
							<th>Date Of Birth</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${listClient}" var="client">
							<tr
								onclick="fillClient('${client.clientID}','${client.firstName}', '${client.lastName}',
							'<fmt:formatDate value="${client.dateOfBirth}" pattern="dd-MM-yyyy" />', '${client.gender}', '${client.maritalStatus}', '${client.address}',
							'${client.country}')">
								<td><c:out value="${client.getClientID()}" /></td>
								<td><c:out value="${client.firstName}" /></td>
								<td><c:out value="${client.lastName}" /></td>
								<td><fmt:formatDate value="${client.dateOfBirth}"
										pattern="dd-MM-yyyy" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<%@ include file="footer.jsp"%>

</body>
</html>