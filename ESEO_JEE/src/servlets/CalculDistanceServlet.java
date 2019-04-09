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

/**
 * Servlet implementation class CalculDistanceServlet
 */
@WebServlet("/CalculDistanceServlet")
public class CalculDistanceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CalculDistanceServlet() {
        super();
        // TODO Auto-generated constructor stub
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

		int ville1 = Integer.parseInt(request.getParameter("choix1"));
		int ville2 = Integer.parseInt(request.getParameter("choix2"));
		String villes = request.getParameter("listeVilles");
		
		String [] liste = villes.split("}");
		
		
		List<String> listeVilles = new ArrayList<>();
		
		for(int i=0; i<liste.length-1;i++) {
			listeVilles.add(liste[i].substring(2));
		}
		
		double latVille1 = Double.parseDouble(listeVilles.get(ville1).split(",")[5].split("\"")[3]);
		double latVille2 = Double.parseDouble(listeVilles.get(ville2).split(",")[5].split("\"")[3]);
		
		double longVille1 = Double.parseDouble(listeVilles.get(ville1).split(",")[6].split("\"")[3]);
		double longVille2 = Double.parseDouble(listeVilles.get(ville2).split(",")[6].split("\"")[3]);
		
		double distance = Math.acos(Math.sin(latVille1*Math.PI/180)*Math.sin(latVille2*Math.PI/180)+Math.cos(latVille1*Math.PI/180)*Math.cos(latVille2*Math.PI/180)*Math.cos(longVille2*Math.PI/180-longVille1*Math.PI/180))*6371;
		
		request.setAttribute("distance", distance);
		
		RequestDispatcher dispat = request.getRequestDispatcher("choixVilles.jsp");
		
		dispat.forward(request, response);	
	}

}
