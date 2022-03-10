package com.hcl.library.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.hcl.library.entity.Book;
import com.hcl.library.exception.ResourceNotFoundException;
import com.hcl.library.service.BookService;

@Controller
@RequestMapping("/book")
public class BookController {
	private static final Logger LOG = LoggerFactory.getLogger(BookController.class);

	@Autowired
	BookService bookService;

	@GetMapping("/")
	public String listCustomers(Model model) {
		List<Book> books = bookService.getBooks();
		model.addAttribute("books", books);
		return "books";
	}

	@GetMapping("/create")
	public String showCreateForm(Model model) {
		LOG.debug("inside show create book form handler method");
		Book book = new Book();
		model.addAttribute("book", book);
		return "book-form";
	}

	@GetMapping("/update")
	public String showEditForm(@RequestParam("id") int id, Model model) {
		try {
			Book book = bookService.getBook(id);
			model.addAttribute("book", book);
			return "book-form";
		} catch (ResourceNotFoundException e) {
			return "books";
		}
	}

	@PostMapping("/save")
	public String saveBook(@ModelAttribute("book") Book book) {
		bookService.saveBook(book);
		return "redirect:/book/";
	}

	@GetMapping("/delete")
	public String deleteBook(@RequestParam("id") int id) {
		bookService.deleteBook(id);
		return "redirect:/book/";
	}
}