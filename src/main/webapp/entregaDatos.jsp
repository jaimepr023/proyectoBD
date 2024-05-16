<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="mipk.beanDB"%>
<%@page import="java.sql.SQLException"%>

<%
try { //AQUI VA EL CONTROL DE SESION 
	String acceso = session.getAttribute("tipo").toString();
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
	try {
		String nombre = request.getParameter("nombresUsuarios");
		String apellidos = request.getParameter("aoellidosUsuarios");
		String correo = request.getParameter("correoElectronico");
		if (nombre != null && apellidos != null && correo != null) {
	String insertar = "insert into Usuarios(nombresUsuarios,aoellidosUsuarios,correoElectronico) values(+'"
			+ nombre + " ',' " + apellidos + " ', ' " + correo + " ')";
	db.insert(insertar);
		}
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
}
db.desconectarBD();
%>

<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insertar Datos</title>
<link rel="stylesheet" href="common/general.css">
</head>
<body>
	<h1><%=session.getAttribute("attributo2")%>: Aqui puedes
		introducir datos
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


	<div class=" login-container">

		<form method="post" class="form-login" onsubmit="return validar()">

			<label for="login-input-user" class="login__label"> Establece
				el nombre del usuario </label> <input class="login__input" type="text"
				name="nombresUsuarios" /><br> <label for="login-input-user"
				class="login__label"> Establece el apellido del usuario </label> <input
				class="login__input" type="text" name="aoellidosUsuarios" /><br>
			<label for="login-input-user" class="login__label"> Establece
				el apellido del usuario </label> <input class="login__input" type="text"
				name="correoElectronico" /><br> <label for="login-sign-up"
				class="login__label--checkbox"> <input id="sip"
				type="checkbox" class="login__input--checkbox" required /> Aceptar
				terminos

			</label> <br> <br>

			<button class="login__submit text-white bg-primary ">Registrarse
			</button>

		</form>



	</div>

</body>
</html>