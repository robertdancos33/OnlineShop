package com.patrickhub.fitnessshop.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.patrickhub.fitnessshop.bean.Address;
import com.patrickhub.fitnessshop.bean.Customer;
import com.patrickhub.fitnessshop.bean.Order;
import com.patrickhub.fitnessshop.bean.Payment;
import com.patrickhub.fitnessshop.bean.User;
import com.patrickhub.fitnessshop.bean.dto.ItemCart;
import com.patrickhub.fitnessshop.bean.dto.ShoppingCart;
import com.patrickhub.fitnessshop.dao.AddressDao;
import com.patrickhub.fitnessshop.dao.CustomerDao;
import com.patrickhub.fitnessshop.dao.OrderDao;
import com.patrickhub.fitnessshop.dao.OrderItemDao;
import com.patrickhub.fitnessshop.dao.PaymentDao;
import com.patrickhub.fitnessshop.util.Fields;
import com.patrickhub.fitnessshop.validation.Validation;

public class CheckoutPaymentServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// validate request fields
		Map<String, String> errors = Validation.validateCreditCardForm(req);
		if(errors.size() == 0) {
			// get card informations
			String cardNumber = req.getParameter(Fields.CARDNUMBER.toString());
			String expiredMonth = req.getParameter(Fields.CARDEXPIRATIONMONTH.toString());
			String expiredYear = req.getParameter(Fields.CARDEXPIRATIONYEAR.toString());
			String cvCode = req.getParameter(Fields.CARDCVCODE.toString());
		
			// get session
			HttpSession session = req.getSession();
			// get username
			String username = (String)session.getAttribute("username");
			// get ShoppingCart
			ShoppingCart shoppingCart = (ShoppingCart)session.getAttribute("cart");
			
			// get current user informations
			Connection connection = (Connection)getServletContext().getAttribute("connection");
			CustomerDao customerDao = new CustomerDao();
			AddressDao addressDao = new AddressDao();
			Customer customer = customerDao.getCustomerByUsername(connection, username);
			Address address = addressDao.getAddressByCustomerId(connection, customer.getId());
			
			// save payment for the current order
			Payment payment = new Payment(cardNumber, expiredMonth + "-" + expiredYear, cvCode);
			PaymentDao paymentDao = new PaymentDao();
			payment = paymentDao.createPayment(connection, payment);
			
			// save current order
			Order order = new Order(address.getId(), payment.getId(), new Date());
			OrderDao orderDao = new OrderDao();
			order = orderDao.createOrder(connection, order);
			
			// save order items
			OrderItemDao orderItemDao = new OrderItemDao();
			for(ItemCart item : shoppingCart.getVectors()) {
				orderItemDao.createOrderItem(connection, item, order.getId());
			}
			
			// remove shopping cart from session
			session.removeAttribute("cart");
			
			// get request dispatcher and send control to checkoutConfirmation.jsp
			Vector<ItemCart> vectors = shoppingCart.getVectors();
			req.setAttribute("vectors", vectors);
			req.setAttribute("customer", customer);
			req.setAttribute("address", address);
			req.getRequestDispatcher("jsp/checkoutConfirmation.jsp").forward(req, resp);
		}
	}
}
