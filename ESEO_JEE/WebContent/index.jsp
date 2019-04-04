<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Choix villes</title>
</head>
<body>

	<script>
	 
	const req = new XMLHttpRequest();

	req.onreadystatechange = function(event) {
	    // XMLHttpRequest.DONE === 4
	    if (this.readyState === XMLHttpRequest.DONE) {
	        if (this.status === 200) {
	        	var response = this.responseText;
	        	document.getElementById('liste').value = response;
	            //document.write("Réponse reçue: %s", this.responseText);
	        } else {
	        	//document.write("Status de la réponse: %d (%s)", this.status, this.statusText);
	        }
	    }
	};

	req.open('GET', "http://localhost:8181/get", true);
	req.send(null);

	</script>

	
	<form action="<%=request.getContextPath()%>/AffichageServlet" method="post" >
		<input type="hidden" id="liste" name="listeVilles">
		<h2> Que souhaitez-vous faire?</h2>
		<label>Calculer une distance
		<input type="radio" name="radio1" value="radio1">
		</label><br>
		<label>Afficher toutes les villes
		<input type="radio" name="radio1" value="radio2">
		</label>
		<input type="submit" name="Submit" value="Valider">
	</form>

</body>
</html>