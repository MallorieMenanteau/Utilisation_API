<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>
.pagination a {
  color: black;
  float: left;
  padding: 8px 16px;
  text-decoration: none;
  transition: background-color .3s;
}

.pagination a.active {
  background-color: dodgerblue;
  color: white;
}

.pagination a:hover:not(.active) {background-color: #ddd;}
</style>
</head>
<body>


<title>Insert title here</title>
</head>
<body>

	Affichage
	
	<%@ page import = "java.util.*" %>
		
	<% List<String> liste = (List) session.getAttribute("listeVilles"); 
		int nbPages = (liste.size())/50;
		if(liste.size()%50 >0){
			nbPages++;
		}
			%>
	<div class="pagination">
	<% for (int i=1;i<nbPages;i++){
		%>
		<button onclick="myFunction(<%=i%>)"><%=i%></button>
		
	<%} %>

	</div>
	
	
	<% for (int i=1;i<nbPages;i++){
		%>
		
	<div id="affListe<%=i%>" style="display: none" >
		<table> 
	    <tr>
	    	<th scope="col">code commune</th>
	    	<th scope="col">nom</th>
	    	<th scope="col">code postal</th>
	    	<th scope="col">libelle acheminement</th>
	    	<th scope="col">latitude</th>
	    	<th scope="col">longitude</th>
	    </tr>
	    
	    
	    <%for (int j=(i-1)*50;j<(i*50);j++){ 
		String[] listeAttributs = liste.get(j).split(",");%>
		<tr>
	        <td><%= listeAttributs[0].split("\"")[3] %></td>
	        <td><%= listeAttributs[1].split("\"")[3] %></td>
	        <td><%= listeAttributs[2].split("\"")[3] %></td>
	        <td><%= listeAttributs[3].split("\"")[3] %></td>
	        <td><%= listeAttributs[5].split("\"")[3] %></td>
	        <td><%= listeAttributs[6].split("\"")[3] %></td>
	    </tr>
		<%} %>
		</table>
	</div>
	<%} %>
	
	<script>
		
		var actuel =1;
	
		function myFunction(i) {
			document.getElementById("affListe"+actuel).style = "display:none";
			actuel = i;
			console.log("fonction appelée");
		  	document.getElementById("affListe"+i).style = "display:block";
		}
	</script>

</body>
</html>