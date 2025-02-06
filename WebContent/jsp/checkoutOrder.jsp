<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Fitness Shop</title>
</head>
<body>
	<div>

		<h3 class="text-danger text-uppercase ml-3 my-5">Your order</h3>
		<c:forEach items="${sessionScope.cart.vectors}" var="item" varStatus="loop">
			<div class = "row border-bottom mx-3 mb-3 pb-1">
				<div class="d-flex">
					<img class="img-fluid" alt="${item.name}" src="image/${item.imgPath}" style="max-width:68.8px; max-height:68.8px;">
					<div class = "ml-3">
						<p class="text-center font-weight-bold text-danger">${item.name}</p>
						<span>RON <fmt:formatNumber value="${item.price*item.quantity}" maxFractionDigits="2"/>
							(<span>${item.price}</span> * <span>${item.quantity}</span>)
						</span>
					</div>
				</div>
			</div>
		</c:forEach>

		<div class="d-flex justify-content-between mt-3 mx-3">
			<p>Subtotal</p>
			<p>
				<c:set var="subTotal" value="${0}"/>
				<c:forEach items="${sessionScope.cart.vectors}" var="item" varStatus="loop">
					<c:set var="subTotal" value="${subTotal + item.price*item.quantity}" />
				</c:forEach>
				RON <fmt:formatNumber value="${subTotal}" maxFractionDigits="2" />
			</p>
		</div>

		<div class="d-flex justify-content-between mx-3">
			<p>Shipping</p>
			<p>-</p>
		</div>
		<hr class="mb-4">
		<div class="d-flex justify-content-between pb-5">
			<p class="font-weight-bold">Order Total</p>
			<p class="font-weight-bold">RON <fmt:formatNumber value="${subTotal}" maxFractionDigits="2" /></p>
		</div>
	</div>
</body>
</html>
