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
 * Servlet implementation class GestioneAutore
 */
@WebServlet("/GestioneAutore")
public class GestioneAutore extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GestioneAutore() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String nome = request.getParameter("Nome_Autore");
		String cognome = request.getParameter("Cognome_Autore");
		int inseriti_dinamicamente=0;
		
		if(nome == null || cognome == null) {
			try {
				throw new Exception("Inserimento dei dati errato!");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			try{
				PreparedStatement st=DB.getDb().prepareStatement(
							"INSERT INTO autore (Nome_Autore, Cognome_Autore) VALUES (?,?)"
						);
				
				st.setString(1, nome);
				st.setString(2, cognome);
				inseriti_dinamicamente=st.executeUpdate();
				
			}
		
			catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		response.sendRedirect(request.getContextPath() + "/app/select-autori.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
