<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>
#tableauVilles {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

#tableauVilles td, #tableauVilles th {
  border: 1px solid #ddd;
  padding: 8px;
}

#tableauVilles tr:nth-child(even){background-color: #f2f2f2;}

#tableauVilles tr:hover {background-color: #ddd;}

#tableauVilles th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #4CAF50;
  color: white;
}

#pagination a {
  color: black;
  float: left;
  padding: 8px 16px;
  text-decoration: none;
  transition: background-color .3s;
}

#pagination a.active {
  background-color: dodgerblue;
  color: white;
}

#pagination a:hover:not(.active) {background-color: #ddd;}
</style>
</head>
<body>
 
<title>Insert title here</title>
</head>
<body>
	
	<%@ page import = "java.util.*" %>
		
		
	
	<a href="index.jsp">Retour à l'accueil!</a>
	
	<br>
	
	<% List<String> liste = (List) session.getAttribute("listeVilles"); 
		int nbPages = (liste.size())/50;
		if(liste.size()%50 >0){
			nbPages++;
		}
			%>

	
	<% for (int i=1;i<nbPages;i++){
		%>
		
	<div id="affListe<%=i%>" style="display: none ; margin-left : 100px" >
		<br/>
		<table id="tableauVilles"> 
	    <tr>
	    	<th scope="col">Editer</th>
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
			<td> <form action="<%=request.getContextPath()%>/editerDonnees.jsp" method="post">
				<input type="hidden" name="indice" value="<%=j%>">
				<input type="submit" name="submit<%=j%>" value="Editer">
				</form> </td>
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
	
	<div id="pagination">
	<% for (int i=1;i<nbPages;i++){
		%>
		<a onclick="myFunction(<%=i%>)"><%=i%></a>
		
	<%} %>
	</div>
	
	
	<script>
		
		var actuel =1;
		
		document.getElementById("affListe1").style = "display:block";
	
		function myFunction(i) {
			document.getElementById("affListe"+actuel).style = "display:none";
			actuel = i;
		  	document.getElementById("affListe"+i).style = "display:block";
		}

	</script>

</body>
</html>