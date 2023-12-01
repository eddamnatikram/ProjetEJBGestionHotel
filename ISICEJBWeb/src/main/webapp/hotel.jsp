<%@page import="entities.Hotel"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Liste des Hôtels</title>

       <!-- Inclure les fichiers CSS de Bootstrap -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    
    <!-- Inclure les fichiers CSS de Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

    <!-- Inclure les fichiers CSS et JavaScript de DataTables -->
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.css">
    <script type="text/javascript" charset="utf8" src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.js"></script>
<script>
    console.log("hotel.jsp loaded");
    console.log(${hotels}); // Vérifiez si hotels est correctement défini
    console.log(${villes}); // Vérifiez si villes est correctement défini
</script>

    <script>
        $(document).ready(function() {
            // Initialiser le DataTable sur la table avec l'ID "hotelTable"
            $('#hotelTable').DataTable();
        });
    </script>
</head>
<body>
    <div class="container">

    <h1 class="text-center">Liste des hôtels :</h1>

    <!-- Utiliser la classe "table" de Bootstrap et "mx-auto" pour centrer la table -->
    <table id="hotelTable" class="table mx-auto">
            <thead>
            <tr>
                <th>ID</th>
                <th>Nom</th>
                <th>Adresse</th>
                <th>Téléphone</th>
                <th>Ville</th>
                <th>update</th>
                <th>delete</th>
            </tr>
        </thead>
        <tbody>
       <c:forEach items="${hotels}" var="hotel">
    <tr>
        <td>${hotel.id}</td>
        <td>${hotel.nom}</td>
        <td>${hotel.adresse}</td>
        <td>${hotel.telephone}</td>
        <td>${hotel.ville.nom}</td>
        <td>
            <Button href="HotelController?action=update&id=${hotel.id}" title="Mettre à jour" class="btn btn-warning">
                <i class="fas fa-edit"></i>
            </Button>
        </td>
        <td>
            <Button href="HotelController?action=delete&id=${hotel.id}" title="Supprimer" class="btn btn-danger">
                <i class="fas fa-trash-alt"></i>
            </Button>
        </td>
    </tr>
    <!-- Ajoutez une ligne pour le formulaire d'édition -->
    <c:if test="${param.action eq 'update' && param.id eq hotel.id}">
        <tr>
            <td colspan="5">
                <form action="HotelController" method="post">
                    <input type="hidden" name="action" value="updateHotel">
                    <input type="hidden" name="hotelId" value="${hotel.id}">
                    Nom : <input type="text" name="nom" class="form-control" value="${hotel.nom}" required/> <br>
                    Adresse : <input type="text" name="adresse" class="form-control" value="${hotel.adresse}" required/> <br>
                    Téléphone : <input type="text" name="telephone" class="form-control" value="${hotel.telephone}" required/> <br>
                    Ville :
                    <select name="villeId" class="form-control" required>
                        <!-- Liste des villes -->
                        <c:forEach items="${villes}" var="ville">
                            <option value="${ville.id}" ${hotel.ville.id eq ville.id ? 'selected' : ''}>${ville.nom}</option>
                        </c:forEach>
                    </select>
                    <br>
                    <button class="btn btn-primary">Mettre à jour</button>
                </form>
            </td>
        </tr>
    </c:if>
</c:forEach>

        </tbody>
    </table>
<h2 class="text-center">Ajouter un hôtel :</h2>
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
</div>

    <!-- Inclure le fichier JavaScript de Bootstrap à la fin du document -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
