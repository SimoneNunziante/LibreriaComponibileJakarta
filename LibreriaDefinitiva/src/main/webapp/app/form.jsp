<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="db.DB" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Nuovo Libro | Libreria Componibile</title>
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
	
		<%
		
			ResultSet rsAutori = null;
			ResultSet rsCategorie = null;
			ResultSet rsScaffali = null;
			int id_Libreria = Integer.parseInt(request.getParameter("param2"));
	
			try {
				
				Statement nomeAutore = db.DB.getStmt();
				Statement categoriaLibro = db.DB.getStmt();
				Statement scaffaleLibro = db.DB.getStmt();
				
				
				rsAutori = nomeAutore.executeQuery("SELECT * FROM autore INNER JOIN libreria_componibile ON ID_LIBRERIA =" + id_Libreria + " ORDER BY ID_AUTORE");			
				rsCategorie = categoriaLibro.executeQuery("SELECT * FROM categoria INNER JOIN libreria_componibile ON ID_LIBRERIA =" + id_Libreria + " ORDER BY ID_GENERE");
				rsScaffali = scaffaleLibro.executeQuery("SELECT * FROM scaffale WHERE p_Libreria=" + id_Libreria);
					
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		%>
		
		<div class="container w-50 mx-auto mt-5">
		
			<h3 class="pb-3">Nuovo Libro</h3>
		
			<form action="../GestioneLibreria" method="post">
		  		<div class="mb-3">
		    		<label for="Titolo_Libro" class="form-label">Titolo</label>
		    		<input type="text" class="form-control" id="Titolo_Libro" name="Titolo_Libro" required>
		  		</div>
		  		<div class="mb-3">
		    		<label for="Anno_pubblicazione" class="form-label">Anno di pubblicazione</label>
		    		<input type="text" class="form-control" id="Anno_pubblicazione" name="Anno_pubblicazione" required>
		  		</div>
		  		<div class="mb-3">
			  		<label for="p_Autore" class="form-label">Autore</label>
			  		<select class="form-select" name="p_Autore" required>
			  			<option selected disabled>Scegli...</option>
			  			<% while(rsAutori.next()){ %>
			  			<option value="<%= rsAutori.getString("ID_AUTORE")%>"><%=rsAutori.getString("Nome_Autore")%>&nbsp;<%=rsAutori.getString("Cognome_Autore")%></option>
			  			<% } %>
					</select>
					<small>Non trovi l'autore?
					<a class="btn-primary" href="form-autore.jsp">Aggiungi nuovo!</a></small>
				</div>
				<div class="mb-3">
					<label for="p_Categoria" class="form-label">Categoria</label>
					<select class="form-select" name="p_Categoria" required>
			  			<option selected disabled>Scegli...</option>
			  			<% while(rsCategorie.next()){ %>
			  			<option value="<%= rsCategorie.getString("ID_GENERE")%>"><%=rsCategorie.getString("Nome_Genere")%></option>
			  			<% } %>
					</select>
					<small>Non trovi la categoria?
					<a class="btn-primary" href="form-categoria.jsp">Aggiungi nuova!</a></small>
				</div>
				<div class="mb-4">
					<label for="p_Scaffale" class="form-label">Scaffale</label>
					<select class="form-select" name="p_Scaffale" required>
			  			<option selected disabled>Scegli...</option>
			  			<% while(rsScaffali.next()){ %>
			  			<option value="<%= rsScaffali.getString("ID_SCAFFALE")%>"><%=rsScaffali.getString("Nome_Scaffale")%></option>
			  			<% } %>
					</select>
				</div>
		  		<button type="submit" class="btn btn-primary"><i class="fa fa-plus-circle" aria-hidden="true"></i> Crea</button>
			</form>
			
		</div>
		
	</body>
</html>