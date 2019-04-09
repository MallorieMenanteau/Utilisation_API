<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ page import = "java.util.*" %>
	<% int ind =Integer.parseInt(request.getParameter("indice")); %>
	
	<% List<String> liste = new ArrayList<>();
		liste = (List<String>) session.getAttribute("listeVilles");
		String[] listeAttribut = liste.get(ind).split(",");
		listeAttribut[4]="\"ligne_5\":\" \"";
		%>
		
	<table id="tableauVilles"> 
	    <tr>
	    	<th scope="col">Nouvelle valeur</th>
	    	<th scope="col">Editer</th>
	    	<th scope="col">Paramètre</th>
	    	<th scope="col">Valeur</th>
	    </tr>
	    
	    <%for(int i=0;i<listeAttribut.length;i++){ %>
	 
	    <tr>
	    <td><input id="parametre<%=i%>" type="text" name="nouvelleValeur"> </td>
		<td><button onClick="put(<%=i%>)">Editer</button></td>
	    <td><%=listeAttribut[i].split("\"")[1]%></td>
	    <td><%=listeAttribut[i].split("\"")[3]%> </td>
		</tr>

		<%} %>
				
	</table>
	
	<br>
	
	<a href="index.jsp">Retour à l'accueil!</a>
	
	<script type="text/javascript">
	
	function put(i){
		
		var url = "http://localhost:8181/";
		var code = <%=listeAttribut[0].split("\"")[3]%>;
		var xhr = new XMLHttpRequest();
		
		xhr.open("PUT", url+'put?codeC=<%=listeAttribut[0].split("\"")[3]%>&aChanger='+i+'&param='+document.getElementById('parametre'+i).value, true);
		xhr.onload = function () {
			if (xhr.readyState == 4 && xhr.status != "200") {
				console.error();
			}
		xhr.send();
	}
	
	</script>
	
</body>
</html>