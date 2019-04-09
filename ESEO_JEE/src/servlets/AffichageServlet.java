package servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AffichageServlet
 */
@WebServlet("/AffichageServlet")
public class AffichageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AffichageServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String villes = request.getParameter("listeVilles");
		String action = request.getParameter("radio1");
		
		String [] liste = villes.split("}");
		
		
		List<String> listeVilles = new ArrayList<>();
		
		for(int i=0; i<liste.length-1;i++) {
			listeVilles.add(liste[i].substring(2));
		}
		
		HttpSession session = request.getSession();
		
		session.setAttribute("villes", villes);
		session.setAttribute("listeVilles", listeVilles);
		
		RequestDispatcher dispat;
		
		if("radio1".equals(action)) {
			dispat = request.getRequestDispatcher("choixVilles.jsp");
		} else {
			dispat = request.getRequestDispatcher("affichage.jsp");
		}
		
		
		dispat.forward(request, response);		
		
	}

}
