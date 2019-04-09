<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
a:link, a:visited {
  background-color: #4CAF50;
  color: white;
  padding: 15px 25px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
}

a:hover, a:active {
  background-color: green;
}

</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


		<%@ page import = "java.util.*" %>
		
	<% List<String> liste = new ArrayList<>();
		liste = (List<String>) session.getAttribute("listeVilles");
		List<String> listeNoms = new ArrayList<>();
		for (String ville : liste){
			String[] listeAttributs = ville.split(",");
			listeNoms.add(listeAttributs[1].split("\"")[3]);
		}
			%>
	
	
	<form action="<%=request.getContextPath()%>/CalculDistanceServlet" method="post">
	<h2>Ville n°1 </h2>		
	<select id="ville1" onChange="javascript:document.getElementById('choix1').value = this.value;">
	<%for (int i=0;i<listeNoms.size();i++){ 
		if(request.getParameter("choix1")!=null && Integer.parseInt(request.getParameter("choix1"))==i){%>
			<option value="<%=i%>" selected><%=listeNoms.get(i) %></option>

		<%} else{%>
		<option value="<%=i%>"><%=listeNoms.get(i) %></option>
	  <%}
	  		}%>
	</select> <br>
	
	<h2>Ville n°2  </h2>
	<select id="ville2" onChange="javascript:document.getElementById('choix2').value = this.value;">
	<%for (int i=0;i<listeNoms.size();i++){ 
		if(request.getParameter("choix2")!=null && Integer.parseInt(request.getParameter("choix2"))==i){%>
			<option value="<%=i%>" selected><%=listeNoms.get(i) %></option>

		<%} else{%>
		<option value="<%=i%>"><%=listeNoms.get(i) %></option>
	  <%}
	  		}%>
	</select><br><br>
	
	<input type="hidden" id="choix1" name="choix1" value=""> 
	<input type="hidden" id="choix2" name="choix2" value=""> 
	<input type="hidden" id="liste" name="listeVilles">	
	<input type="submit" id="Submit" value="Calculer la distance">
	
	</form>
	
	<br> 
	<% if(request.getAttribute("distance")!=null){
		%>
	La distance entre les villes sélectionnées est : <%= request.getAttribute("distance") %> km.
	<%} %>
	
	<br>
	<br>
	
	<a href="index.jsp">Retour à l'accueil!</a>
	
	
	<script>
	 
	const req = new XMLHttpRequest();

	req.onreadystatechange = function(event) {
	    if (this.readyState === XMLHttpRequest.DONE) {
	        if (this.status === 200) {
	        	var response = this.responseText;
	        	document.getElementById('liste').value = response;
	        } else {
	       		log.error();
	        }
	    }
	};

	req.open('GET', "http://localhost:8181/get", true);
	req.send(null);

	</script>

</body>
</html>