<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="mipk.beanDB"%>
<%@page import="java.sql.SQLException"%>

<%
String usuario = "";
try { //AQUI VA EL CONTROL DE SESION
	usuario = session.getAttribute("attributo2").toString();
	String acceso = session.getAttribute("tipo").toString();
	if (!acceso.equals("1") || !usuario.equals("admin"))
		response.sendRedirect("cerrarsesion.jsp");
} catch (Exception e) {
	response.sendRedirect("cerrarsesion.jsp");
}

beanDB db = new beanDB();
boolean okdb = false;
String resultado = "";

try {
	db.conectarBD();
	okdb = true;
} catch (Exception e) {
	okdb = false;
	//e.printStackTrace();
}
if (okdb) {
	String query = "select * from Usuarios";
	String[][] tablares = null;
	try {
		tablares = db.resConsultaSelectA3(query);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	if (tablares != null) {

		resultado = "<table style='margin-left: auto; margin-right: auto; border: solid 0.5px black;'>";
		resultado += "<thead>";
		resultado += "<th style ='border-bottom: solid 0.5px black;'>Id</th>";
		resultado += "<th style ='border-bottom: solid 0.5px black;'>Nombre</th>";
		resultado += "<th style ='border-bottom: solid 0.5px black;'>Apellidos</th>";
		resultado += "<th style ='border-bottom: solid 0.5px black;'>Correo</th>";
		resultado += "</thead>";
		for (int i = 0; i < tablares.length; i++) { //g es una variable tipo grupo que va recorriendo la lista
	resultado += "<tr>";
	resultado += "<td style ='border-right: solid 0.5px black;'>" + tablares[i][0] + "</td>";
	resultado += "<td style ='border-right: solid 0.5px black;'>" + tablares[i][1] + "</td>";
	resultado += "<td style ='border-right: solid 0.5px black;'>" + tablares[i][2] + "</td>";
	resultado += "<td style ='border-right: solid 0.5px black;'>" + tablares[i][3] + "</td>";
	resultado += "</tr>";
		}
		resultado += "</table>";

	}
	db.desconectarBD();
} else {
	resultado = "<div style='color: darkred; font-weight: bold;'>ERROR: No se pudo conectar con la BBDD</div>";
}
%>
<html>
<head>

<link rel="stylesheet" href="common/general.css">

</head>
<style>
</style>
<body>
	<h1><%=session.getAttribute("attributo2")%>: Estos son los datos
	</h1>
	<hr />
	<p>
		<a href="bienvenido.jsp">Página principal</a>
	</p>
	<p>
		<a href="cerrarsesion.jsp">Salir</a>
	</p>
	<hr />
	<%=resultado%>
	<div id="contenedor1"></div>

</body>
</html>