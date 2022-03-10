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
</head>
<body>
	<div class="container">
		<div class="col-md-offset-1 col-md-10">
			<h3 class="text-center">Spring MVC 5 + Spring Data JPA 2 + JSP +
				MySQL Example - Library Management</h3>
			<hr />
			<input type="button" value="Add Book"
				onclick="window.location.href='create'; return false;"
				class="btn btn-primary" /> <br /> <br />
			<div class="panel panel-info">
				<div class="panel-heading">
					<div class="panel-title">Book List</div>
				</div>
				<div class="panel-body">
					<table class="table table-striped table-bordered">
						<tr>
							<th>Book Name</th>
							<th>Author</th>
							<th>Price</th>
							<th>Action</th>
						</tr>
						<c:forEach var="book" items="${books}">
							<c:url var="updateLink" value="/book/update">
								<c:param name="id" value="${book.id}" />
							</c:url>
							<c:url var="deleteLink" value="/book/delete">
								<c:param name="id" value="${book.id}" />
							</c:url>
							<tr>
								<td>${book.name}</td>
								<td>${book.author}</td>
								<td>${book.price}</td>
								<td><a href="${updateLink}">Update</a> | <a
									href="${deleteLink}"
									onclick="if (!(confirm('Are you sure you want to delete thisbook?'))) return false">Delete</a></td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>