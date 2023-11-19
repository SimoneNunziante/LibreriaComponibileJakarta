<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="auth.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Nuovo Scaffale | Libreria Componibile</title>
		<link rel="icon" type="image/x-icon" href="https://img.icons8.com/ios-filled/50/ffffff/books.png">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
	</head>
	<body>

		<nav class="navbar navbar-expand-sm bg-light">
			<div class="container">
		    	<a class="navbar-brand" href="./libreria.jsp">Libreria Componibile</a>
		      	<ul class="navbar-nav ms-auto">
			        <li>
			        	<a class="nav-link text-danger" href="./../logout.jsp">Esci <i class="fa-solid fa-right-from-bracket ps-1"></i></a>
			        </li>
		      	</ul>
		  	</div>
		</nav>
		
		<%
		
			ResultSet rsLibrerie = null;
			HttpServletRequest req = (HttpServletRequest)request;
			User utente = auth.User.getUser(req.getSession());
			int utenteId = utente.getId();
	
			try {
				
				Statement nomeLibreria = db.DB.getStmt();
				
				
				rsLibrerie = nomeLibreria.executeQuery("SELECT * FROM libreria_componibile WHERE p_User=" + utenteId );			
					
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		%>
		
		<div class="container w-50 mx-auto mt-5">
	
			<h3 class="pb-3">Nuovo Scaffale</h3>
	
			<form action="../GestioneScaffali" method="post">
		  		<div class="mb-4">
		    		<label for="Nome_Scaffale" class="form-label">Scaffale</label>
		    		<input type="text" class="form-control" id="Nome_Scaffale" name="Nome_Scaffale" required>
		  		</div>
		  		<div class="mb-4">
					<label for="p_Libreria" class="form-label">Libreria</label>
					<select class="form-select" name="p_Libreria" required>
			  			<option selected disabled>Scegli...</option>
			  			<% while(rsLibrerie.next()){ %>
			  			<option value="<%= rsLibrerie.getString("ID_LIBRERIA")%>"><%=rsLibrerie.getString("Nome_Libreria")%></option>
			  			<% } %>
					</select>
				</div>
		  		<button type="submit" class="btn btn-primary"><i class="fa fa-plus-circle" aria-hidden="true"></i> Crea</button>
			</form>
			
		</div>

</body>
</html>