package com.moneymoney.framework.account.pojo;

/**
 * 
 * @author Satyen Singh
 * @author Drishti Rao
 *
 *         Maintaining savings account details of money money bank
 */
public abstract class SavingAccount extends BankAccount {
	private boolean salary;
	private double MINIMUM_BALANCE;

	public SavingAccount(Customer accountHolder, double accountBalance, boolean salary) {
		super(accountHolder, accountBalance);
		this.salary = salary;
		this.MINIMUM_BALANCE = 10000;
	}

	public SavingAccount(Customer accountHolder) {
		super(accountHolder);
		this.salary = true;
		this.MINIMUM_BALANCE = 0;
	}

	public boolean isSalaryValue() {
		return salary;
	}

	public void setSalary(boolean salary) {
		this.salary = salary;
		if (salary)
			this.MINIMUM_BALANCE = 0;
		else
			this.MINIMUM_BALANCE = 10000;
	}

	public double getMINIMUM_BALANCE() {
		return MINIMUM_BALANCE;
	}

	public void setMINIMUM_BALANCE(double mINIMUM_BALANCE) {
		MINIMUM_BALANCE = mINIMUM_BALANCE;
	}

	public abstract String withdraw(double amount);

	@Override
	public String toString() {
		return "SavingAccount [salary=" + salary + ", toString()=" + super.toString() + "]";
	}
}