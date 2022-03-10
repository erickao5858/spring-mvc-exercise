package com.hcl.library.service;

import java.util.List;

import com.hcl.library.entity.Customer;
import com.hcl.library.exception.ResourceNotFoundException;

public interface CustomerService {

	public List<Customer> getCustomers();

	public void saveCustomer(Customer theCustomer);

	public Customer getCustomer(int theId) throws ResourceNotFoundException;

	public void deleteCustomer(int theId) throws ResourceNotFoundException;
}