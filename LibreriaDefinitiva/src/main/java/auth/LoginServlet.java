package auth;

import java.io.IOException;
import java.util.regex.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String email = request.getParameter("Email_User");
			String psw = request.getParameter("Psw_User");
			
			PreparedStatement stmt = db.DB.getPrepareStatement("SELECT ID_USER, Nome, Cognome, Email FROM user WHERE Email = ? AND Password = ?" );
			stmt.setString(1, email);
			stmt.setString(2, Authentication.MD5(psw));
			ResultSet rs = stmt.executeQuery();
			
			if(rs.next()) {
				User user = new User(
					rs.getInt("ID_USER"),
					rs.getString("Nome"),
					rs.getString("Cognome"),
					rs.getString("Email")
				);
				
				HttpSession session = request.getSession();
				session.setAttribute(User.sessionKey, user);
				
				response.sendRedirect(request.getContextPath() + "/app/libreria.jsp");
				
			} else {
				response.sendRedirect(request.getContextPath() + "/login.jsp");
			}
			
		} catch (Exception e) {
			response.sendRedirect(request.getContextPath() + "/login.jsp");
		}
		
		// TODO Auto-generated method stub
		doGet(request, response);
	
	}

}
