package com.moneymoney.appcontroller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.moneymoney.app.model.pojo.MMCurrentAccount;
import com.moneymoney.app.model.pojo.MMCustomer;
import com.moneymoney.app.model.pojo.MMSavingAccount;
import com.moneymoney.app.model.service.ServiceImpl;
import com.moneymoney.framework.account.pojo.BankAccount;
import com.moneymoney.framework.account.pojo.Customer;

@WebServlet("*.app")
public class AppController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ServiceImpl service = new ServiceImpl();
	MMCustomer activecustomer = null;
	RequestDispatcher dispatcher = null;
	BankAccount account = null;

	public AppController() {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getServletPath();
		HttpSession session = request.getSession();
//		RequestDispatcher dispatcher = res
		System.out.println(action);

		switch (action) {
		case "/addnewaccount.app":
			response.sendRedirect("addnewaccount.jsp");
			break;
		case "/add.app":
			String accName = request.getParameter("accName");
			String emailId = request.getParameter("email");
			String contact = request.getParameter("contact");
			String dob = request.getParameter("dob");
			activecustomer = new MMCustomer(accName, Long.parseLong(contact), dob, emailId);
			String choice = request.getParameter("accountType");
			String balance, odLimit = null;
			if (choice.equals("savingaccount")) {
				String type = request.getParameter("salary");
				System.out.println(type);
				if (type.equals("Blue")) {
					balance = request.getParameter("salbal");
				} else {
					balance = request.getParameter("bal");
				}
				account = new MMSavingAccount(activecustomer, Double.parseDouble(balance));
			} else {
				balance = request.getParameter("cbal");
				odLimit = request.getParameter("odLimit");
				account = new MMCurrentAccount(activecustomer, Double.parseDouble(balance),
						Double.parseDouble(odLimit));
			}
			System.out.println(accName + " " + contact + " " + dob + " " + emailId + " " + choice + " " + balance + " "
					+ odLimit + " " + account.getAccountNumber());
			activecustomer.setAccountNumber(account.getAccountNumber());
			service.addBankAccount(account);
			service.addCustomer(activecustomer);
			request.setAttribute("accNo", account.getAccountNumber());
			dispatcher = request.getRequestDispatcher("displayAccount.app");
			dispatcher.forward(request, response);
			break;
		case "/displayAccount.app":
			if (service.searchAccountById((int) request.getAttribute("accNo")) == null) {
				response.sendRedirect("AccountNotFound.jsp");
			} else {
				account = service.searchAccountById((int) request.getAttribute("accNo"));
				String classType = account.getClass().getSimpleName();
				System.out.println(classType);
				request.setAttribute("bankAccount", account);
				request.setAttribute("classType", classType);
				dispatcher = request.getRequestDispatcher("ViewAccount.jsp");
				dispatcher.forward(request, response);
			}
			break;
		case "/search.app":
			int accNo = Integer.parseInt(request.getParameter("accNo"));
			request.setAttribute("accNo", accNo);
			dispatcher = request.getRequestDispatcher("displayAccount.app");
			dispatcher.forward(request, response);
			break;
		case "/withdrawAmount.app":
			response.sendRedirect("withdraw.jsp");
			break;
		case "/depositAmount.app":
			response.sendRedirect("deposit.jsp");
			break;
		case "/withdraw.app":
			accNo = Integer.parseInt(request.getParameter("accNo"));
			double amount = Double.parseDouble(request.getParameter("withdrawamount"));
			String msg = service.withdraw(accNo, amount);
			System.out.println(msg);
			request.setAttribute("accNo", accNo);
			dispatcher = request.getRequestDispatcher("displayAccount.app");
			dispatcher.forward(request, response);
			break;
		case "/deposit.app":
			accNo = Integer.parseInt(request.getParameter("accNo"));
			amount = Double.parseDouble(request.getParameter("depositamount"));
			System.out.println(amount);
			service.deposit(accNo, amount);
			request.setAttribute("accNo", accNo);
			System.out.println(accNo + "  and  " + amount);
			dispatcher = request.getRequestDispatcher("displayAccount.app");
			dispatcher.forward(request, response);
			break;
		case "/searchAccount.app":
			response.sendRedirect("searchAcc.jsp");

			break;
		case "/fundTransfer.app":
			response.sendRedirect("payment.jsp");
			break;
		case "/transfer.app":
			int sender = Integer.parseInt(request.getParameter("sender"));
			int reciever = Integer.parseInt(request.getParameter("reciever"));
			amount = Double.parseDouble(request.getParameter("amount"));
			System.out.println(sender + " " + amount + " " + reciever);
			msg = service.withdraw(sender, amount);
			System.out.println(msg);
			service.deposit(reciever, amount);
			request.setAttribute("sender", sender);
			request.setAttribute("reciever", reciever);
			request.setAttribute("amount", amount);
			dispatcher = request.getRequestDispatcher("fundTransfer.jsp");
			dispatcher.forward(request, response);
			break;
		case "/viewAllCustomers.app":
			ArrayList<Customer> cust = service.viewAllCustomers();
			request.setAttribute("customers", cust);
			dispatcher = request.getRequestDispatcher("viewAllCustomers.jsp");
			dispatcher.forward(request, response);
			break;
		default:
			response.sendRedirect("home.jsp");
			break;
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
