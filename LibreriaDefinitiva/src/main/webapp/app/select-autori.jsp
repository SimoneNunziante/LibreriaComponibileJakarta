<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="db.DB" %>
<%@ page import="auth.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Lista Autori | Libreria Componibile</title>
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
			          	<a class="nav-link" href="./select-categorie.jsp">Categorie</a>
			        </li>
			        <li>
			        	<a class="nav-link text-danger" href="./../logout.jsp"><i class="fa-solid fa-right-from-bracket"></i></a>
			        </li>
		      	</ul>
		  	</div>
		</nav>
	
		<%
			
		ResultSet rsID = null;
		ResultSet autoriPresenti=null;
		String totaleAutori=null;
		
			try{
				
				Statement st1 = db.DB.getStmt();
			    rsID = st1.executeQuery("SELECT * FROM autore;");
			    
			    Statement st2 = db.DB.getStmt();
			    autoriPresenti = st2.executeQuery("SELECT COUNT(ID_AUTORE) FROM autore");
			    
			    ResultSetMetaData rsmd2 = autoriPresenti.getMetaData();
			    int columnNumberA = rsmd2.getColumnCount();
			    while(autoriPresenti.next()){
			    	for(int i=1; i<=columnNumberA; i++){
			    		String columnValue2 = autoriPresenti.getString(i);
			    		/* System.out.println("Hai inserito" + columnValue2); */
			    		totaleAutori=columnValue2;
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
		
		<h3 class="pb-3">Autori</h3>
		
			<table class="table table-striped table-hover">
			  <thead>
			    <tr>
			      <th scope="col">ID</th>
			      <th scope="col">Nome</th>
			      <th scope="col">Cognome</th>
			    </tr>
			  </thead>
		  		<tbody>
				    <%
				    while (rsID.next()) {
				        int id_Autore = rsID.getInt("ID_AUTORE");
				        String nAutore = rsID.getString("Nome_Autore");
				        String cAutore = rsID.getString("Cognome_Autore");
				    %>
				    <tr>
				      <th scope="row" class="align-middle"><%= id_Autore %></th>
				      <td class="align-middle"><%= nAutore %></td>
				      <td class="align-middle"><%= cAutore %></td>
				      <td class="align-middle"><a class="btn btn-danger" href="../CancellaAutore?param=<%= id_Autore %>"><i class="fa fa-times-circle" aria-hidden="true"></i> Cancella</a></td>
				    </tr>
				    <%
				    }
				    %>
		  		</tbody>
			</table>
			<a class="btn btn-primary" href="./form-autore.jsp"><i class="fa fa-plus-circle" aria-hidden="true"></i> Nuovo</a>
			
			<!-- <div class="d-flex text-muted pt-5">
				<h5>Record trovati:</h5>
				<h5 class="px-1"><i><%= totaleAutori %></i></h5>
			</div> -->

		</div>

	</body>
</html>