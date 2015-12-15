import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;
import java.util.Properties;
import modele.*; 

@WebServlet("/servlet/homeServlet")
public class HomeServlet extends HttpServlet
{
    public void service( HttpServletRequest req, HttpServletResponse res ) 
	throws ServletException, IOException
    {
		Personne personne = new Employe();
		personne.setNom("Paul");
		req.setAttribute("personne", personne);

		Employe emp = new Employe();
		Adresse add = new Adresse();
		add.setAdresse("Lille");
		emp.setAdresse(add);
		emp.setId(1);
		emp.setNom("Pierre");
		HttpSession session = req.getSession();
		session.setAttribute("employe", emp);

		res.addCookie(new Cookie("User.Cookie","Chez l’utilisateur"));

		getServletContext().setAttribute("User.Cookie","dans le contexte");

		RequestDispatcher rd = getServletContext().getRequestDispatcher("/Home.jsp");
		rd.forward(req, res);
	}
}
