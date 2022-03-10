package com.hcl.library.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.hcl.library.entity.Book;

@Repository("bookRepository")
public interface BookRepository extends JpaRepository<Book, Integer> {
}