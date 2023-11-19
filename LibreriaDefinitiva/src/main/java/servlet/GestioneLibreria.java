package servlet;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.DB;

/**
 * Servlet implementation class GestioneLibreria
 */
@WebServlet("/GestioneLibreria")
public class GestioneLibreria extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GestioneLibreria() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String titolo = request.getParameter("Titolo_Libro");
		int anno_pubblicazione = Integer.parseInt(request.getParameter("Anno_pubblicazione"));
		int autore = Integer.parseInt(request.getParameter("p_Autore"));
		int categoria = Integer.parseInt(request.getParameter("p_Categoria"));
		int scaffale = Integer.parseInt(request.getParameter("p_Scaffale"));
		@SuppressWarnings("unused") int inseriti_dinamicamente=0;
		
		if(titolo == null || anno_pubblicazione == 0 || autore == 0 || categoria == 0 || scaffale == 0) {
			try {
				throw new Exception("Inserimento dei dati errato!");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			try{
				PreparedStatement st=DB.getDb().prepareStatement(
							"INSERT INTO libro (Titolo_Libro, Anno_pubblicazione, p_Autore, p_Categoria, p_Scaffale) VALUES (?,?,?,?,?)"
						);
				
				st.setString(1, titolo);
				st.setInt(2, anno_pubblicazione);
				st.setInt(3, autore);
				st.setInt(4, categoria);
				st.setInt(5, scaffale);
				inseriti_dinamicamente=st.executeUpdate();
				
			}
		
			catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		response.sendRedirect(request.getContextPath() + "/app/libreria.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
