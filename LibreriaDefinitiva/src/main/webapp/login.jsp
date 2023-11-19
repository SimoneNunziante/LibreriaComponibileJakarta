<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Login | Libreria Componibile</title>
		<link rel="icon" type="image/x-icon" href="https://img.icons8.com/ios-filled/50/ffffff/books.png">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
	</head>
	<body>
	
		<nav class="navbar navbar-expand-sm bg-light">
			<div class="container">
		    	<a class="navbar-brand" href="./index.jsp">Libreria Componibile</a>
		  	</div>
		</nav>
		
		<div class="container w-50 mx-auto mt-5">
		
			<h3 class="pb-3">Accedi</h3>
		
			<form action="./LoginServlet" method="post">
		  		<div class="mb-4">
		    		<label for="Email_User" class="form-label">E-mail</label>
		    		<input type="email" class="form-control" id="Email_User" name="Email_User" required>
		  		</div>
		  		<div class="mb-4">
		    		<label for="Psw_User" class="form-label">Password</label>
		    		<input type="password" class="form-control" id="Psw_User" name="Psw_User" required>
		  		</div>
		  		<button type="submit" class="btn btn-primary">Login <i class="fa-solid fa-arrow-right"></i></button>
			</form>
			<br>
			<small>Non hai un account?
			<a class="btn-primary" href="./register.jsp">Registrati ora!</a></small>
		
		</div>
	
	</body>
</html>