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
 * Servlet implementation class GestioneScaffali
 */
@WebServlet("/GestioneScaffali")
public class GestioneScaffali extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GestioneScaffali() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String nome = request.getParameter("Nome_Scaffale");
		int scaffale = Integer.parseInt(request.getParameter("p_Libreria"));
		int inseriti_dinamicamente=0;
		
		if(nome == null) {
			try {
				throw new Exception("Inserimento dei dati errato!");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			try{
				
				PreparedStatement st=DB.getDb().prepareStatement("INSERT INTO scaffale (Nome_Scaffale, Capienza_Massima, p_Libreria) VALUES (?,?,?)");
				st.setString(1, nome);
				st.setInt(2, 255);
				st.setInt(3, scaffale);
				inseriti_dinamicamente=st.executeUpdate();
				
			}
		
			catch (Exception e){
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		response.sendRedirect(request.getContextPath() + "/app/select-scaffali.jsp?param=" + scaffale);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
