package com.moneymoney.framework.service;

import java.util.ArrayList;

import com.moneymoney.framework.account.pojo.BankAccount;
import com.moneymoney.framework.account.pojo.Customer;

public interface Service {

	void addBankAccount(BankAccount bankAccount);

	void addCustomer(Customer customer);

	ArrayList<BankAccount> viewAllAccounts();

	ArrayList<Customer> viewAllCustomers();

	BankAccount searchAccountById(int num);

	boolean FundTransfer(BankAccount sender, BankAccount reciever, double amount);

}
