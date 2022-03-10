<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>HCL Library - Books</title>
<link href="<c:url value="/resources/css/bootstrap.min.css" />"
	rel="stylesheet">
<%@ page isELIgnored="false"%>
<script src="<c:url value="/resources/js/jquery-1.11.1.min.js" />"></script>
<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
<script>
let books = [];
let filterCriteria = ''
$().ready(() => {
	<c:forEach items="${books}" var="book" varStatus="loop">
		books.push({"id":"${book.id}","name":"${book.name}","author":"${book.author}","price":"${book.price}"});
	</c:forEach>
	sortBooks(0);
	listBooks();
})

listBooks = () => {
	const table = $("table")
	// Initialize table
	table.empty();
	table.append("<tr><th>Book Name</th><th>Author</th><th>Price</th><th>Action</th></tr>")
	books.forEach(book => {
		// Filter by Book Name
		if (filterCriteria != '') {
			if (!book.name.toLowerCase().includes(filterCriteria.toLowerCase()))
				return
		}
		// Construct table row with book information
		let tr = $("<tr>")
		tr.append("<td>" + book.name + "</td><td>" + book.author + "</td><td>" + book.price + "</td>")
		// Construct row column with buttons
		let td = $("<td>")
		let updateButton = $("<Button>").attr("class", "btn btn-primary").text("Update").on("click", () => {
			window.location.href = "update?id=" + book.id;
		})
		let deleteButton = $("<Button>").attr("class", "btn btn-danger").text("Delete").on("click", () => {
			if (confirm('Are you sure you want to delete this book?'))
				window.location.href = "delete?id=" + book.id;
		})
		// Combine elements
		td.append(updateButton).append(deleteButton)
		// Set Column Size and Vertical Align
		$("td").addClass("col-md-2")
		tr.append(td)
		table.append(tr)
	})
}

sortBooks = (sortCriteria) => {
	switch (sortCriteria) {
		case 0: books.sort((a, b) => {
			if (a.name.toLowerCase() > b.name.toLowerCase()) return 1;
			else return -1;
		})
			break;
		case 1: books.sort((a, b) => {
			if (a.author.toLowerCase() > b.author.toLowerCase()) return 1;
			else return -1;
		})
			break;
		case 2: books.sort((a, b) => {
			if (a.price > b.price) return 1;
			else return -1;
		})
			break;
	}
	listBooks()
}

applyfilter = (e) => {
	filterCriteria = e.value
	listBooks()
}
</script>
</head>
<body>
	<div class="container">
		<div class="col-md-offset-1 col-md-10">
			<h3 class="text-center">Spring MVC 5 + Spring Data JPA 2 + JSP +
				MySQL Example - Library Management</h3>
			<hr />
			<div class="input-group">
				<span class="input-group-addon" id="basic-addon1">Filter</span> <input
					type="text" class="form-control" placeholder="Book Name"
					aria-describedby="basic-addon1" oninput="applyfilter(this)">
			</div>
			<br /> <input type="button" value="Add Book"
				onclick="window.location.href='create'; return false;"
				class="btn btn-primary" />
			<div class="btn-group">
				<button type="button" class="btn btn-info dropdown-toggle"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					Sort <span class="caret"></span>
				</button>
				<ul class="dropdown-menu">
					<li><a href="#" onclick="sortBooks(0)">Name(A-Z)</a></li>
					<li><a href="#" onclick="sortBooks(1)">Author(A-Z)</a></li>
					<li><a href="#" onclick="sortBooks(2)">Price($-$$$)</a></li>
				</ul>
			</div>
			<br /> <br />
			<div class="panel panel-info">
				<div class="panel-heading">
					<div class="panel-title">Book List</div>
				</div>
				<div class="panel-body">
					<table class="table table-striped table-bordered">
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>