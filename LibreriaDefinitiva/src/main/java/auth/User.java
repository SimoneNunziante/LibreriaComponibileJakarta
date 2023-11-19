package auth;

import javax.servlet.http.HttpSession;

public class User {

	public static String sessionKey = "THE_USER";
	private final int id;
	private String nome;
	private String cognome;
	private String email;
	
	public User(int id, String nome, String cognome, String email) {
		super();
		this.id = id;
		this.nome = nome;
		this.cognome = cognome;
		this.email = email;
	}
	
	public static boolean isLogged(HttpSession session) {
		return getUser(session) != null;
	}
	
	public static User getUser(HttpSession session) {
		try {
			User u = (User)session.getAttribute(sessionKey);
			return u;
		} catch (ClassCastException e) {
			return null;
		}

	}
	
	public String getNome() {
		return nome;
	}
	
	public void setNome(String nome) {
		this.nome = nome;
	}
	
	public String getCognome() {
		return cognome;
	}
	
	public void setCognome(String cognome) {
		this.nome = cognome;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public int getId() {
		return id;
	}
	
}
