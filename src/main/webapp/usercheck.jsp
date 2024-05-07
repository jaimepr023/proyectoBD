<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "https://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
String usuario = "";
String mensaje = "";
try { //AQUI VA EL CONTROL DE SESION
	usuario = session.getAttribute("attributo2").toString();
	String acceso = session.getAttribute("attributo1").toString();
	mensaje = "La sesion esta abierta";
	if (!acceso.equals("1"))
	mensaje = "La sesion esta cerrada";
} catch (Exception e) {
	mensaje = "La sesion esta cerrada";
}
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Session checker</title>
<link rel="stylesheet" href="common/general.css">
</head>
<body>
	<h1>Session checker</h1>
	<h4>Se vera si su sesion esta iniciada o no</h4>
	<p><%=mensaje%>
</body>
</html>