<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Nuova Categoria | Libreria Componibile</title>
		<link rel="icon" type="image/x-icon" href="https://img.icons8.com/ios-filled/50/ffffff/books.png">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
	</head>
	<body>

		<nav class="navbar navbar-expand-sm bg-light">
			<div class="container">
		    	<a class="navbar-brand" href="./libreria.jsp">Libreria Componibile</a>
		      	<ul class="navbar-nav ms-auto">
			        <li class="nav-item">
			          	<a class="nav-link" href="./select-autori.jsp">Autori</a>
			        </li>
			        <li class="nav-item">
			          	<a class="nav-link" href="./select-categorie.jsp">Categorie</a>
			        </li>
			        <li>
			        	<a class="nav-link text-danger" href="./../logout.jsp"><i class="fa-solid fa-right-from-bracket"></i></a>
			        </li>
		      	</ul>
		  	</div>
		</nav>

		<div class="container w-50 mx-auto mt-5">
	
			<h3 class="pb-3">Nuova Categoria</h3>
	
			<form action="../GestioneCategoria" method="post">
		  		<div class="mb-4">
		    		<label for="Nome_Genere" class="form-label">Genere</label>
		    		<input type="text" class="form-control" id="Nome_Genere" name="Nome_Genere" required>
		  		</div>
		  		<button type="submit" class="btn btn-primary"><i class="fa fa-plus-circle" aria-hidden="true"></i> Crea</button>
			</form>
			
		</div>
		
	</body>
</html>