<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


		<%@ page import = "java.util.*" %>
		
	<% List<String> liste = (List) session.getAttribute("listeVilles");
	List<String> listeNoms = new ArrayList<>();
	for (String ville : liste){
		String[] listeAttributs = ville.split(",");
		listeNoms.add(listeAttributs[1].split("\"")[3]);
	}
			%>
	
	
	<form>
	<h2>Ville n°1 </h2>		
	<select id="ville1">
	<%for (int i=0;i<listeNoms.size();i++){ %>
		<option value="<%=i%>"><%=listeNoms.get(i)%></option>
	
	<%} %>
	</select> <br>
	
	<h2>Ville n°2  </h2>
	<select id="ville2">
	<%for (int i=0;i<listeNoms.size();i++){ %>
		<option value="<%=i%>"><%=listeNoms.get(i)%></option>
	
	<%} %>
	</select><br><br>
	 
	<input type="submit" id="Submit" value="Calculer la distance">
	
	</form>

</body>
</html>