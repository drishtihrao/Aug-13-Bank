package com.moneymoney.app.model.pojo;

import com.moneymoney.framework.account.pojo.Address;

public class MMAddress extends Address {

	public MMAddress(String houseNo, String street, String city, String state, int pinCode) {
		super(houseNo, street, city, state, pinCode);
	}

}
