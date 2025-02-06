<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register | Fitness-Shop</title>
</head>
<body>
	
	<%
		Map<String, String> errors = (HashMap<String, String>)request.getAttribute("errors");
	%>
	
	<!-- header -->
	<%@include file="header.jsp" %>
	<section>
		<div class="container" style="max-width:800px;">
			<form action="register" method="post" class="border shadow-sm px-5 my-5 rounded" onsubmit="return validateUserRegisterForm()">
				<h3 class="text-uppercase text-danger mt-5 mb-4">Customer login information</h3>
				<div class="row">
					<div class="col-md-6 mb-3">
						<label for="username">Username</label>
						<input id="username" name="username" class="form-control rounded-pill" type="text"/>
						<span id="usernameError" class="text-danger font-weight-bold">${errors.get("username")}</span>
					</div>
					<div class="col-md-6 mb-3">
						<label for="password">Password</label>
						<input id="password" name="password" class="form-control rounded-pill" type="password" />
						<span id="passwordError" class="text-danger font-weight-bold">${errors.get("password")}</span>
					</div>
				</div>
				<h3 class="text-uppercase text-danger mt-5 mb-3">Shipping address</h3>
				 
				<div class="row">
					<div class="col-md-6 mb-3">
						<label for="firstName">First name</label>
						<input id="firstName" name="firstName" class="form-control rounded-pill" type="text"/>
						<span id="firstNameError" class="text-danger font-weight-bold">${errors.get("firstName")}</span>
					</div>
					<div class="col-md-6 mb-3">
						<label for="lastName">Last name</label>
						<input id="lastName" name="lastName" class="form-control rounded-pill" type="text"/>
						<span id="lastNameError" class="text-danger font-weight-bold">${errors.get("lastName")}</span>
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-6 mb-3">
						<label for="email">Email address</label>
						<input id="email" name="email" class="form-control rounded-pill" type="text"/>
						<span id="emailError" class="text-danger font-weight-bold">${errors.get("email")}</span>
					</div>
					<div class="col-md-6 mb-3">
						<label for="phone">Phone</label>
						<input id="phone" name="phone" class="form-control rounded-pill" type="text"/>
						<span id="phoneError" class="text-danger font-weight-bold">${errors.get("phone")}</span>
					</div>
				</div>
				
				<div class="row">
					
					<div class="col-md-6 mb-3">
						 <label for="birthdate">birthdate</label>
						 <input id="birthdate" type="date" name="birthdate" class="form-control rounded-pill"
						 		min="1000-01-01" max="3000-12-31" >
						 <span id="birthdateError" class="text-danger font-weight-bold">${errors.get("birthdate")}</span>
						
						
<!-- 						<input id="birthdate" name="phone" class="form-control rounded-pill" type="text"/> -->
						
<!-- 						<div class="input-group date" data-provide="datepicker"> -->
						
<!-- 						<label for="birthdate">birthdate</label> -->
<!-- 						    <input id="birthdate" type="text" class="form-control"> -->
<!-- 						    <div class="input-group-addon"> -->
<!-- 						        <span class="glyphicon glyphicon-th"></span> -->
<!-- 						    </div> -->
<%-- 						    <span id="birthdateError" class="text-danger font-weight-bold">${errors.get("birthdate")}</span> --%>
<!-- 						</div> -->
					</div>
					<div class="col-md-6 mb-3">
						<label for="country">Country</label>
						<select id="country" name="country" class ="custom-select rounded-pill">
							<option value="">Choose a country</option>
							<% 
								List<Locale> countries = getAllCountries();
								for(Locale country: countries){
							%>
								<option value="<%=country.getDisplayCountry()%>"><%=country.getDisplayCountry()%></option>
							<%
								}
							%>
						</select>
						<span id="countryError" class="text-danger font-weight-bold">${errors.get("country")}</span>
					</div>
				</div>
				
				<div class="mb-3">
						<label for="street">Street Address</label>
						<input id="street" name="street" class="form-control rounded-pill" type="text" />
						<span id="streetError" class="text-danger font-weight-bold"></span>
				</div>
				
				<div class="row">
					<div class="col-md-3 mb-3">
						<label for="zipCode">Postal/Zip</label>
						<input id="zipCode" name="zipCode" class="form-control rounded-pill" type="text"/>
						<span id="zipCodeError" class="text-danger font-weight-bold">${errors.get("zipCode")}</span>
					</div>
					<div class="col-md-9 mb-3">
						<label for="city">City</label>
						<input id="city" name="city" class="form-control rounded-pill" type="text"/>
						<span id="cityError" class="text-danger font-weight-bold">${errors.get("city")}</span>
					</div>
				</div>
				<button class="btn btn-success btn-lg px-5 my-5 rounded-pill">Register</button>
			</form>
		</div>
	</section>


	<%!
		public List<Locale> getAllCountries(){
			List<Locale> result = new ArrayList<>();
			for(String countryCode: Locale.getISOCountries()){
				result.add(new Locale("", countryCode));
			}
			return result;
		}
	%>	
	
	
	<!-- footer -->
	<%@include file="footer.jsp" %>
</body>
</html>