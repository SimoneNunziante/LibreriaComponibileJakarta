package servlet;

import java.io.IOException;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import auth.User;
import db.DB;

/**
 * Servlet implementation class AggiungiLibreria
 */
@WebServlet("/AggiungiLibreria")
public class AggiungiLibreria extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AggiungiLibreria() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String nome = request.getParameter("Nome_Libreria");
		HttpServletRequest req = (HttpServletRequest)request;
		User utente = auth.User.getUser(req.getSession());
		int utenteId = utente.getId();
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
				
				PreparedStatement st=DB.getDb().prepareStatement("INSERT INTO libreria_componibile (Nome_Libreria, p_User) VALUES (?,?)");
				st.setString(1, nome);
				st.setInt(2, utenteId);
				inseriti_dinamicamente=st.executeUpdate();
				
			}
		
			catch (Exception e){
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
