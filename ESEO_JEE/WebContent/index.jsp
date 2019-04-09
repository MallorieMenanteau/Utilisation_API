<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
.bouton {color:#FFFFFF;background-color:green;font-size:30px;text-align:center}

</style>
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

	
	<form style="text-align:center" action="<%=request.getContextPath()%>/AffichageServlet" method="post" >
		<input type="hidden" id="liste" name="listeVilles" style="font-size:20px">
		<h2> Que souhaitez-vous faire?</h2>
		<label style="font-size:20px">Calculer une distance
		<input type="radio" name="radio1" value="radio1" >
		</label><br>
		<label style="font-size:20px">Afficher toutes les villes
		<input type="radio" name="radio1" value="radio2">
		</label><br><br>
		<input type="submit" name="Submit" value="Valider" class="bouton">
	</form>

</body>
</html>