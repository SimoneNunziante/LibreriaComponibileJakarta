package auth;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
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
		
		String nome = request.getParameter("Nome_User");
		String cognome = request.getParameter("Cognome_User");
		String email = request.getParameter("Email_User");
		String password = request.getParameter("Psw_User");
		
		Pattern pattern = Pattern.compile(email, Pattern.CASE_INSENSITIVE);
	    Matcher matcher = pattern.matcher("\"^(?=.{1,64}@)[A-Za-z0-9_-]+(\\\\.[A-Za-z0-9_-]+)*@\" \n"
	    		+ "        + \"[^-][A-Za-z0-9-]+(\\\\.[A-Za-z0-9-]+)*(\\\\.[A-Za-z]{2,})$\";");
	    boolean matchFound = matcher.find();
	    if(matchFound) {
	      System.out.println("Match found");
		
			try {
				
				PreparedStatement stmt = db.DB.getPreparedStatement("INSERT INTO user (Nome, Cognome, Email, Password)"
						+ "VALUES(?,?,?,?)");
				
				stmt.setString(1, nome);
				stmt.setString(2, cognome);
				stmt.setString(3, email);
				stmt.setString(4, Authentication.MD5(password));
				
				int r = stmt.executeUpdate();
				if(r != 1) {
					throw new Exception();
				}
				
				response.sendRedirect(request.getContextPath() + "/index.jsp");
				
			} catch(Exception e) {
				response.sendRedirect(request.getContextPath() + "/register.jsp");
				return;
			}

	    } else {
		      System.out.println("Match not found");
				response.sendRedirect(request.getContextPath() + "/register.jsp");
				return;
		}
		
		// TODO Auto-generated method stub
		doGet(request, response);
	
	}

}
