package com.hcl.library.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hcl.library.entity.Customer;
import com.hcl.library.exception.ResourceNotFoundException;
import com.hcl.library.repository.CustomerRepository;

@Service
public class CustomerServiceImpl implements CustomerService {

	@Autowired
	private CustomerRepository customerRepository;

	@Override
	@Transactional
	public List<Customer> getCustomers() {
		return customerRepository.findAll();
	}

	@Override
	@Transactional
	public void saveCustomer(Customer theCustomer) {
		customerRepository.save(theCustomer);
	}

	@Override
	@Transactional
	public Customer getCustomer(int id) throws ResourceNotFoundException {
		return customerRepository.findById(id).orElseThrow(() -> new ResourceNotFoundException(id));
	}

	@Override
	@Transactional
	public void deleteCustomer(int theId) {
		customerRepository.deleteById(theId);
	}
}