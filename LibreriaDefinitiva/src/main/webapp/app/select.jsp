<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="db.DB" %>
<%@ page import="auth.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Lista Libri | Libreria Componibile</title>
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
			
		ResultSet rsID = null;
		ResultSet libriPresenti = null;
		String totaleLibri=null;
		ResultSet autoriPresenti=null;
		String totaleAutori=null;
		ResultSet categoriePresenti=null;
		String totaleCategorie=null;
		ResultSet scaffaliPresenti=null;
		String totaleScaffali=null;
		Connection connection = null;
		int id_Scaffale = Integer.parseInt(request.getParameter("param"));
		int id_Libreria = Integer.parseInt(request.getParameter("param2"));
		
			try{
				
				Statement st1 = db.DB.getStmt();
			    rsID = st1.executeQuery("SELECT * FROM libro WHERE p_Scaffale=" + id_Scaffale );
			    
			    Statement st2 = db.DB.getStmt();
			    libriPresenti = st2.executeQuery("SELECT COUNT(ID_LIBRO) FROM libro");
			    
			    Statement st3 = db.DB.getStmt();
			    autoriPresenti = st3.executeQuery("SELECT COUNT(ID_AUTORE) FROM autore");
			    
			    Statement st4 = db.DB.getStmt();
			    categoriePresenti = st4.executeQuery("SELECT COUNT(ID_GENERE) FROM categoria");
			    
			    Statement st5 = db.DB.getStmt();
			    scaffaliPresenti = st5.executeQuery("SELECT COUNT(ID_SCAFFALE) FROM scaffale");
			    
			    ResultSetMetaData rsmd = libriPresenti.getMetaData();
			    int columnNumber = rsmd.getColumnCount();
			    while(libriPresenti.next()){
			    	for(int i=1; i<=columnNumber; i++){
			    		String columnValue = libriPresenti.getString(i);
			    		/* System.out.println("Hai inserito" + columnValue); */
			    		totaleLibri=columnValue;
			    	}
			    }
			    
			    ResultSetMetaData rsmd2 = autoriPresenti.getMetaData();
			    int columnNumberA = rsmd2.getColumnCount();
			    while(autoriPresenti.next()){
			    	for(int i=1; i<=columnNumberA; i++){
			    		String columnValue2 = autoriPresenti.getString(i);
			    		/* System.out.println("Hai inserito" + columnValue2); */
			    		totaleAutori=columnValue2;
			    	}
			    }
			     
			    ResultSetMetaData rsmd3 = categoriePresenti.getMetaData();
			    int columnNumberC = rsmd3.getColumnCount();
			    while(categoriePresenti.next()){
			    	for(int i=1; i<=columnNumberC; i++){
			    		String columnValue3 = categoriePresenti.getString(i);
			    		/* System.out.println("Hai inserito" + columnValue3); */
			    		totaleCategorie=columnValue3;
			    	}
			    }
			    
			    ResultSetMetaData rsmd4 = scaffaliPresenti.getMetaData();
			    int columnNumberS = rsmd4.getColumnCount();
			    while(scaffaliPresenti.next()){
			    	for(int i=1; i<=columnNumberS; i++){
			    		String columnValue4 = scaffaliPresenti.getString(i);
			    		/* System.out.println("Hai inserito" + columnValue4); */
			    		totaleScaffali=columnValue4;
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
		
		<div class="container w-75 mx-auto mt-5">
		
			<h3 class="pb-3">Libri</h3>
		
			<table class="table table-striped table-hover">
			  <thead>
			    <tr>
			      <th scope="col">ID</th>
			      <th scope="col">Titolo</th>
			      <th scope="col">Anno</th>
			      <th scope="col">Autore</th>
			      <th scope="col">Categoria</th>
			      <th scope="col">Scaffale</th>
			    </tr>
			  </thead>
		  		<tbody>
				    <%
				    while (rsID.next()) {
				        int id_Libro = rsID.getInt("ID_LIBRO");
				        String titolo = rsID.getString("Titolo_Libro");
				        int anno_pubblicazione = rsID.getInt("Anno_pubblicazione");
				        int autore = rsID.getInt("p_Autore");
				        int categoria = rsID.getInt("p_Categoria");
				        int scaffale = rsID.getInt("p_Scaffale");
				        /* System.out.println(libriPresenti); */
				        
				        Statement stAutore = db.DB.getStmt();
						ResultSet autoreResultSet = stAutore.executeQuery("SELECT * FROM autore WHERE ID_AUTORE = " + autore);
	
						String nomeAutore = "";
						String cognomeAutore = "";
						if (autoreResultSet.next()) {
						    nomeAutore = autoreResultSet.getString("Nome_Autore");
						    cognomeAutore = autoreResultSet.getString("Cognome_Autore");
						}
						
				        Statement stCategoria = db.DB.getStmt();
						ResultSet categoriaeResultSet = stAutore.executeQuery("SELECT * FROM categoria WHERE ID_GENERE = " + categoria);
	
						String nomeCategoria = "";
						if (categoriaeResultSet.next()) {
							nomeCategoria = categoriaeResultSet.getString("Nome_Genere");
						}
						
				        Statement stScaffale = db.DB.getStmt();
						ResultSet scaffaliResultSet = stScaffale.executeQuery("SELECT * FROM scaffale WHERE ID_SCAFFALE = " + scaffale);
	
						String nomeScaffale = "";
						if (scaffaliResultSet.next()) {
							nomeScaffale = scaffaliResultSet.getString("Nome_Scaffale");
						}
				        
				    %>
				    <tr>
				      <th scope="row" class="align-middle"><%= id_Libro %></th>
				      <td class="align-middle"><%= titolo %></td>
				      <td class="align-middle"><%= anno_pubblicazione %></td>
				      <td class="align-middle"><%= nomeAutore %> <%= cognomeAutore %></td>
				      <td class="align-middle"><%= nomeCategoria %></td>
				      <td class="align-middle"><%= nomeScaffale %></td>
				      <td class="align-middle"><a class="btn btn-danger" href="../CancellaLibro?param=<%= id_Libro %>"><i class="fa fa-times-circle" aria-hidden="true"></i> Cancella</a></td>
				    </tr>
				    <%
				    }
				    %>
		  		</tbody>
			</table>
			<a class="btn btn-primary" href="./form.jsp?param2=<%= id_Libreria %>"><i class="fa fa-plus-circle" aria-hidden="true"></i> Nuovo</a>
			
			<!-- <div class="d-flex text-muted pt-5">
				<h5>Record trovati:</h5><br>
				<h5 class="px-2"><i><%= totaleLibri %></i> libri</h5>|
				<h5 class="px-2"><i><%= totaleAutori %></i> autori</h5>|
				<h5 class="px-2"><i><%= totaleCategorie %></i> categorie</h5>|
				<h5 class="px-2"><i><%= totaleScaffali %></i> scaffali</h5>
			</div> -->
			
		</div>
		
	</body>
</html>