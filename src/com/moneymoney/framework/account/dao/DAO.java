package com.moneymoney.framework.account.dao;

import java.util.ArrayList;

import com.moneymoney.framework.account.pojo.BankAccount;
import com.moneymoney.framework.account.pojo.Customer;

public interface DAO {

	/**
	 * @param bankAccount
	 * 
	 * This method takes account object and adds it in the database
	 */
	void addBankAccount(BankAccount bankAccount);
	void addCustomer(Customer customer);
	/**
	 * @return Set of Accounts
	 * 
	 * This method is responsible for returning all the active accounts
	 */
	ArrayList<BankAccount> viewAllAccounts();
	ArrayList<Customer> viewAllCustomers();
	BankAccount searchAccountById(int num);

}