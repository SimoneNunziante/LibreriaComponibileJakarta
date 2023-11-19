<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="db.DB" %>
<%@ page import="auth.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Lista Categorie | Libreria Componibile</title>
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
			        <li>
			        	<a class="nav-link text-danger" href="./../logout.jsp"><i class="fa-solid fa-right-from-bracket"></i></a>
			        </li>
		      	</ul>
		  	</div>
		</nav>
	
		<%
			
		ResultSet rsID = null;
		ResultSet categoriePresenti=null;
		String totaleCategorie=null;
		
			try{
				
				Statement st1 = db.DB.getStmt();
			    rsID = st1.executeQuery("SELECT * FROM categoria;");
			    
			    Statement st2 = db.DB.getStmt();
			    categoriePresenti = st2.executeQuery("SELECT COUNT(ID_GENERE) FROM categoria");
			    
			    ResultSetMetaData rsmd2 = categoriePresenti.getMetaData();
			    int columnNumberA = rsmd2.getColumnCount();
			    while(categoriePresenti.next()){
			    	for(int i=1; i<=columnNumberA; i++){
			    		String columnValue2 = categoriePresenti.getString(i);
			    		/* System.out.println("Hai inserito" + columnValue2); */
			    		totaleCategorie=columnValue2;
			    	}
			    }
			    
			}
		
			catch(ClassNotFoundException e){
						System.out.println("ERRORE CLASS FORNAME");
						System.out.println(e.getMessage());
					}
		
			catch (SQLException e){
				System.out.println("ERRORE DI CONNESSIONE");
				System.out.println(e.getMessage());
			}
		%>
		
		<div class="container w-50 mx-auto mt-5">
		
		<h3 class="pb-3">Categorie</h3>
		
			<table class="table table-striped table-hover">
			  <thead>
			    <tr>
			      <th scope="col">ID</th>
			      <th scope="col">Genere</th>
			    </tr>
			  </thead>
		  		<tbody>
				    <%
				    while (rsID.next()) {
				        int id_Categoria = rsID.getInt("ID_GENERE");
				        String nCategoria = rsID.getString("Nome_Genere");
				    %>
				    <tr>
				      <th scope="row" class="align-middle"><%= id_Categoria %></th>
				      <td class="align-middle"><%= nCategoria %></td>
				      <td class="align-middle"><a class="btn btn-danger" href="../CancellaCategoria?param=<%= id_Categoria %>"><i class="fa fa-times-circle" aria-hidden="true"></i> Cancella</a></td>
				    </tr>
				    <%
				    }
				    %>
		  		</tbody>
			</table>
			<a class="btn btn-primary" href="./form-categoria.jsp"><i class="fa fa-plus-circle" aria-hidden="true"></i> Nuova</a>
			
			<!-- <div class="d-flex text-muted pt-5">
				<h5>Record trovati:</h5>
				<h5 class="px-1"><i><%= totaleCategorie %></i></h5>
			</div> -->

		</div>

	</body>
</html>