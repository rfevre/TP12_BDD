<!-- Home.jsp -->
<HEAD>
   <META http-equiv="Content-Type" content="text/html; charset=UTF-8">
   	<%@ page import="java.util.*" %>
    <%@ page errorPage="erreur.jsp" %>
    <%@ page session="true" %>
    <%@ page contentType="text/html; charset=UTF-8" %>
    <%@ taglib url="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib url="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
    <sql:setDataSource driver="org.postgresql.Driver" url="jdbc:postgresql://psqlserv/da2i" user="fevrer" password="moi" />
    <%
    	List<String> noms = new ArrayList<String>();
    	noms.add("Jean"); noms.add("Jacques"); noms.add("Ferror404");
    	pageContext.setAttribute("noms",noms); 
    %>
   <TITLE>Page EL expressions</TITLE>
</HEAD>
<BODY>

<center>
<h1>EL expressions</h1>
<strong>Recherche d’un objet avec scope:</strong> ${requestScope.personne}
<br><br>
<strong>Recherche d’un objet sans scope:</strong> ${personne}
<br><br>
<strong>Operateur [] :</strong> ${applicationScope["User.Cookie"]}
<br><br>
<strong>Usage du . en cascade:</strong> ${sessionScope.employe.adresse.adresse}
<br><br>
<strong>Elements d’une liste:</strong> ${noms[1]}
<br><br>
<strong>Entete HTTP:</strong> ${header["Accept-Encoding"]}
<br><br>
<strong>Cookie utilisateur:</strong> ${cookie["User.Cookie"].value}
<br><br>
<strong>Contexte de page:</strong> HTTP Method is ${pageContext.request.method}
<br><br>
<strong>Accès aux params du contexte:</strong> ${initParam.AppID}
<br><br>
<strong>Operateur arithmétique:</strong> ${initParam.AppID + 200}
<br><br>
<strong>Operateur de comparaison:</strong> ${initParam.AppID < 200}
<br><br>

<sql:query var="users" sql="select * from personne" />

<table border=1>
<c:forEach var="row" items="${users.row}">
<tr>
  <td><c:out value="${row.id}" /></td>
  <td><c:out value="${row.login}" /></td>
  <td><c:out value="${row.nom}" /></td>
  <td><c:out value="${row.prenom}" /></td>
  <td><c:out value="${row.datenaiss}" /></td>
</tr>
</c:forEach>
</table>

</center>

<br>
<br>

</BODY>
</HTML>
