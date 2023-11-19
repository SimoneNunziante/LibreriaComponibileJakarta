<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="db.DB" %>
<%@ page import="auth.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Lista Librerie | Libreria Componibile</title>
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
	
	ResultSet rsLb = null;
	int id_Libreria = 0;
	String nLibreria = null;
	HttpServletRequest req = (HttpServletRequest)request;
	User utente = auth.User.getUser(req.getSession());
	int utenteId = utente.getId();
	
	try {
		
		Statement st1 = db.DB.getStmt();
		rsLb = st1.executeQuery("SELECT * FROM libreria_componibile WHERE p_User =" + utenteId);
		
	} catch(Exception e) {
		e.printStackTrace();
	}
	
	%>
	
	<div class="container w-50 mx-auto mt-5">
		
		<h3 class="pb-3">Librerie</h3>
		
			<table class="table table-striped table-hover">
			  <thead>
			    <tr>
			      <th scope="col">ID</th>
			      <th scope="col">Nome</th>
			    </tr>
			  </thead>
		  		<tbody>
				    <%
				    while (rsLb.next()) {
				        id_Libreria = rsLb.getInt("ID_LIBRERIA");
				        nLibreria = rsLb.getString("Nome_Libreria");
				    %>
				    <tr>
				      <th scope="row" class="align-middle"><%= id_Libreria %></th>
				      <td class="align-middle"><%= nLibreria %></td>
				      <td class="align-middle"><a class="btn btn-secondary" href="./select-scaffali.jsp?param=<%= id_Libreria %>">Vai a <i class="fa-solid fa-arrow-right"></i></a></td>
				      <td class="align-middle"><a class="btn btn-danger" href="../CancellaLibreria?param=<%= id_Libreria %>"><i class="fa fa-times-circle" aria-hidden="true"></i> Cancella</a></td>
				    </tr>
				    <%
				    }
				    %>
		  		</tbody>
			</table>
			<a class="btn btn-primary" href="./form-libreria.jsp"><i class="fa fa-plus-circle" aria-hidden="true"></i> Nuova</a>

	</div>
		
</body>
</html>