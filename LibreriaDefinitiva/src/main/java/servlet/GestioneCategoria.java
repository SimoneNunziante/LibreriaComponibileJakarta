package servlet;

import java.io.IOException;

import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.DB;

/**
 * Servlet implementation class GestioneCategoria
 */
@WebServlet("/GestioneCategoria")
public class GestioneCategoria extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GestioneCategoria() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String nome = request.getParameter("Nome_Genere");
		@SuppressWarnings("unused") int inseriti_dinamicamente=0;
		
		if(nome == null) {
			try {
				throw new Exception("Inserimento dei dati errato!");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			try{
				
				PreparedStatement st=DB.getDb().prepareStatement("INSERT INTO categoria (Nome_Genere) VALUES (?)");
				st.setString(1, nome);
				inseriti_dinamicamente=st.executeUpdate();
				
				PreparedStatement st2=DB.getDb().prepareStatement("INSERT INTO scaffale (Nome_Scaffale, Capienza_Massima, p_CategoriaScaffale, p_Libreria) VALUES(?,50,LAST_INSERT_ID(),1)");
				st2.setString(1, nome);
				inseriti_dinamicamente=st2.executeUpdate();
				
			}
		
			catch (Exception e){
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		response.sendRedirect(request.getContextPath() + "/app/select-categorie.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
