package com.hcl.library.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hcl.library.entity.Book;
import com.hcl.library.exception.ResourceNotFoundException;
import com.hcl.library.repository.BookRepository;

@Service
public class BookService {
	@Autowired
	private BookRepository bookRepository;

	@Transactional
	public List<Book> getBooks() {
		return bookRepository.findAll();
	}

	@Transactional
	public void saveBook(Book book) {
		bookRepository.save(book);
	}

	@Transactional
	public Book getBook(int id) throws ResourceNotFoundException {
		return bookRepository.findById(id).orElseThrow(() -> new ResourceNotFoundException(id));
	}

	@Transactional
	public void deleteBook(int id){
		bookRepository.deleteById(id);
	}
}