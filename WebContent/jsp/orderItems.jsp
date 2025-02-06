<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Order History</title>
</head>
<body>
	<!-- header -->
	<%@include file="header.jsp" %>
	<section>
		<div class="container">
			<h2 class="mb-5 text-center text-danger font-weight-bold">Track my order step by step</h2>
			<div class="row mt-5 mb-5">
				<div class="col-md-6 d-flex justify-content-center">
					<div>
						<h4 class="text-danger text-uppercase">In delivering</h4>
						<h6 class="text-danger text-uppercase">${requestScope.order.date}</h6>
						<div class="mt-3 justify-content-between font-weight-bold">
							<h4 class="text-uppercase">Order Total</h4>
							<h6 class="text-danger">
								<c:set var="subTotal" value="${0}"/>
								<c:forEach items="${requestScope.items}" var="item" varStatus="loop">
									<c:set var="subTotal" value="${subTotal + item.price*item.quantity}" />
								</c:forEach>
								RON <fmt:formatNumber value="${subTotal}" maxFractionDigits="2" />
							</h6>
						</div>
						<div class="text-muted mt-3">
							<h4 class="text-uppercase">Delivery address</h4>
							<span>${requestScope.customer.firstName} ${requestScope.customer.lastName}</span><br>
							<span>${requestScope.address.street}</span><br>
							<span>${requestScope.address.zipCode} ${requestScope.address.city}</span><br>
							<span>${requestScope.address.country}</span><br>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<c:forEach items="${requestScope.items}" var="item" varStatus="loop">
						<div class = "row mx-3 mb-3 pb-1">
							<div class="d-flex border-bottom">
								<img class="img-fluid" alt="${item.name}" src="image/${item.imgPath}" style="max-width:68.8px; max-height:68.8px;">
								<div class = "ml-3">
									<p><a class="text-center font-weight-bold text-danger"  href="product?id=${item.id}">${item.name}</a><p>
									<span>RON <fmt:formatNumber value="${item.price*item.quantity}" maxFractionDigits="2"/>
										(<span>${item.price}</span> * <span>${item.quantity}</span>)
									</span>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>

	</section>

	<!-- footer -->
	<%@include file="footer.jsp" %>
</body>
</html>
