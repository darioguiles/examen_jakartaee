<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="estilos.css" />

    <title>Detalle</title>
</head>
<body>
<h1>Detalle cliente</h1>
<%
    //CARGA DEL DRIVER Y PREPARACIÓN DE LA CONEXIÓN CON LA BBDD
    //						v---------UTILIZAMOS LA VERSIÓN MODERNA DE LLAMADA AL DRIVER, no deprecado
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/tienda","user", "user");

    int detalle = 0;

    if(request.getParameter("codigoCliente")!=null) {
        detalle = Integer.parseInt(request.getParameter("codigoCliente"));
    }

    //UTILIZAR STATEMENT SÓLO EN QUERIES NO PARAMETRIZADAS.
    Statement s = conexion.createStatement();
    ResultSet listado = s.executeQuery ("SELECT * FROM tienda.cliente where cliente.codigo_cliente = " + detalle);

    while (listado.next()) {
        out.println("<tr><td>");
        out.println(listado.getString("codigo_cliente") + "</td>");
        out.println("<td>" + listado.getString("nombre_cliente") + "</td>");
        out.println("<td>" + listado.getString("nombre_contacto") + "</td>");
        out.println("<td>" + listado.getString("apellido_contacto") + "</td>");
        out.println("<td>" + listado.getString("telefono") + "</td>");
        out.println("<td>" + listado.getString("linea_direccion") + "</td>");
        out.println("<td>" + listado.getString("ciudad") + "</td>");
        out.println("<td>" + listado.getString("region") + "</td>");
        out.println("<td>" + listado.getString("pais") + "</td>");
        out.println("<td>" + listado.getString("codigo_postal") + "</td>");
        out.println("<td>" + listado.getString("limite_credito") + "</td>");
    }
    listado.close();
    s.close();
    conexion.close();
%>
</body>
</html>