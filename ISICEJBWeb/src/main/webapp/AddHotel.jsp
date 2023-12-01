<%@page import="entities.Ville"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>Ajouter un hôtel :</h2>

<form action="HotelController" method="post">
    <input type="hidden" name="action" value="add"> <!-- Ajoutez un champ caché pour l'action -->
    Nom : <input type="text" name="nom" class="form-control" required/> <br>
    Adresse : <input type="text" name="adresse" class="form-control" required/> <br>
    Téléphone : <input type="text" name="telephone" class="form-control" required/> <br>
    Ville :
    <select name="villeId" class="form-control" required>
        <!-- Liste des villes -->
        <c:forEach items="${villes}" var="ville">
            <option value="${ville.id}">${ville.nom}</option>
        </c:forEach>
    </select>
    <br>
    <button class="btn btn-primary">Ajouter</button>
</form>

</body>
</html>