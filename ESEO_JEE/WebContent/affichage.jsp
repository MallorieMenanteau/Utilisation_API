<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	Affichage
	
	<%@ page import = "java.util.*" %>
	
		
		<table>
		    <tr>
		    	<th scope="col">code commune</th>
		    	<th scope="col">nom</th>
		    	<th scope="col">code postal</th>
		    	<th scope="col">libelle acheminement</th>
		    	<th scope="col">latitude</th>
		    	<th scope="col">longitude</th>
		    </tr>
		
		<% List<String> liste = (List) session.getAttribute("listeVilles"); 
		int max = liste.size();
		if(liste.size()>50){
			max=50;
		}
		
		for (int i=0;i<50;i++){ 
			String[] listeAttributs = liste.get(i).split(",");
			%>
		    <tr>
		        <td><%= listeAttributs[0].split("\"")[3] %></td>
		        <td><%= listeAttributs[1].split("\"")[3] %></td>
		        <td><%= listeAttributs[2].split("\"")[3] %></td>
		        <td><%= listeAttributs[3].split("\"")[3] %></td>
		        <td><%= listeAttributs[5].split("\"")[3] %></td>
		        <td><%= listeAttributs[6].split("\"")[3] %></td>
		    </tr>
		   <% } %>
		</table>
		
		
		
		

</body>
</html>