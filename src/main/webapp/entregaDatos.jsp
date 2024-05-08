<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="mipk.beanDB"%>
<%@page import="java.sql.SQLException"%>

<%
try { //AQUI VA EL CONTROL DE SESION 
	String acceso = session.getAttribute("attributo1").toString();
	if (!acceso.equals("1"))
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
	String query = "select aoellidosUsuarios, nombresUsuarios from Usuarios";
	String[][] tablares = null;
	try {
		tablares = db.resConsultaSelectA3(query);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	if (tablares != null) {

	db.desconectarBD();
} else {
	resultado = "<div style='color: darkred; font-weight: bold;'>ERROR: No se pudo conectar con la BBDD</div>";
}
%>

<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insertar Datos</title>
<link rel="stylesheet" href="common/general.css">
</head>
<body>
	<h1>Insertar Datos</h1>
	<br>
	<form></form>

</body>
</html>