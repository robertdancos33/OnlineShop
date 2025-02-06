<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Fitness Shop</title>
</head>
<body>

	<!-- header -->
	<%@include file="header.jsp" %>
	<section>

		<div class="row">
			<div class="col-md-8">
				<div class = "row">
					<div class="col-md-1"></div>
					<div class="col-md-1  bg-secondary border border-secondary rounded-circle d-flex justify-content-center text-white" style="max-width:30px;">
					1
					</div>
					<div class="col-md-3 border-top mt-3 ">

					</div>
					<div class="col-md-1 bg-danger border border-danger rounded-circle d-flex justify-content-center text-white" style="max-width:30px;">
						2
					</div>
					<div class="col-md-4 border-top mt-3">

					</div>
					<div class="col-md-1 bg-secondary border border-secondary rounded-circle d-flex justify-content-center text-white" style="max-width:30px;">
						3
					</div>
					<div class="col-md-1"></div>
				</div>
				<div class="row">
					<div class="col-md-2">
						<p class="text-sm-center">customer information</p>
					</div>
					<div class="col-md-1"></div>
					<div class="col-md-3">
						<p class="text-sm-center  text-danger">Shipping & payment</p>
					</div>
					<div class="col-md-2"></div>
					<div class="col-md-2">
						<p class="text-sm-center">Order Validation</p>
					</div>
				</div>
				<div class="row">
					<div class="ml-5">
						<h4 class="text-danger text-uppercase">Shipping address</h4>
						<p class="text-muted">
							<span>${requestScope.customer.firstName} ${requestScope.customer.lastName}</span><br>
							<span>${requestScope.address.street}</span><br>
							<span>${requestScope.address.zipCode} ${requestScope.address.city}</span><br>
							<span>${requestScope.address.country}</span><br>
						</p>
						<p class="text-muted">
							<span>${requestScope.customer.phone}</span><br>
							<span>${requestScope.customer.email}</span>
						</p>
						<a href="checkout-address" class="text-danger">Edit</a>
					</div>
				</div>
				<hr class="mb-4 ml-3">
				<div class="row ">
					<div class="ml-5">
						<div class="d-block">
							 <h4 class="text-danger text-uppercase">Shipping</h4>
					         <div class="custom-control custom-radio">
						           <input id="credit" name="paymentMethod" type="radio" class="custom-control-input" checked="" required="">
						           <label class="custom-control-label" for="credit">Standard Shipping 3 - 5 working days RON 2.95</label>
					         </div>
					         <div class="custom-control custom-radio">
						           <input id="debit" name="paymentMethod" type="radio" class="custom-control-input" required="">
						           <label class="custom-control-label" for="debit">Next working day RON 4.95</label>
					         </div>
					         <div class="custom-control custom-radio">
						           <input id="paypal" name="paymentMethod" type="radio" class="custom-control-input" required="">
						           <label class="custom-control-label" for="paypal">Saturday delivery RON 7.95</label>
					         </div>
				       </div>
			       </div>
				</div>
				<hr class="mb-4 ml-3">
				<div class="row">
					<div class="ml-4 col-md-8">
						<h4 class="text-danger text-uppercase">Payment</h4>
						<div class="card mb-4 shadow-sm">
						      <div class="card-header d-flex d-inline">
						      	<img alt="" src="image/credit-card-hint.png" style="max-width: 39px; max-height: 26px;">
						        <h6 class="my-0 font-weight-normal" style="margin-left: 5px;">Credit/Debit Card</h6>
						      </div>
						      <div class="card-body pl-5">
						      	<form action="checkout-confirmation" method="post" class="">
							     	 <div class="row mb-3">
								        <div class="col-md-8">
								        	<label class="font-weight-bold" for="cardNumber">CARD NUMBER</label>
											<input id="cardNumber" name="cardNumber" class="form-control rounded" type="text" placeholder="valid card number"/>
											<span id="cardNumberError" class="text-danger font-weight-bold"></span>
										</div>
									 </div>
									 <div class="row mb-5">
										<div class="col-md-4">
											<label class="font-weight-bold" for="cardExpirationMonth">EXPIRY DATE</label>
											<div class="d-flex d-inline">
												<input class="form-control" name="cardExpirationMonth" placeholder="MM"/>
												<input class="form-control" name="cardExpirationYear" placeholder="YY"/>
											</div>
										</div>

										<div class="col-md-3">
											<label class="font-weight-bold" for="cardCVCode">CV CODE</label>
											<input class="form-control" name="cardCVCode" placeholder="cv"/>
										</div>
									</div>
							       	<button class="btn btn-lg btn-danger text-uppercase">Complete your order</button>
						       	 </form>
						      </div>
					    </div>
					</div>
				</div>

			</div>
			<div class="col-md-4 bg-light">
				<!-- user order -->
				<%@include file="checkoutOrder.jsp" %>
			</div>
		</div>
	</section>


	<!-- footer -->
	<%@include file="footer.jsp" %>
</body>
</html>
