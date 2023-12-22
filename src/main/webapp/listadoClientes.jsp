<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="estilos.css" />
</head>
<body>
<a href="index.jsp">Volver atrás</a>

<%
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/tienda","user", "user");
    Statement s = conexion.createStatement();

    ResultSet listado = s.executeQuery ("SELECT * FROM tienda.cliente");
%>
<table>
    <tr><th>ID</th><th>Nombre</th><th>Tlf</th><th>ciudad</th><th>pais</th><th>CP</th><th>limite_credito</th></tr>
    <%
        while (listado.next()) {
            out.println("<tr><td>");
            out.println(listado.getString("codigo_cliente") + "</td>");
            out.println("<td>" + listado.getString("nombre_cliente") + "</td>");
            out.println("<td>" + listado.getString("telefono") + "</td>");
            out.println("<td>" + listado.getString("ciudad") + "</td>");
            out.println("<td>" + listado.getString("pais") + "</td>");
            out.println("<td>" + listado.getString("codigo_postal") + "</td>");
            out.println("<td>" + listado.getString("limite_credito") + "</td>");

    %>
    <td>
        <form method="get" action="borraClientes.jsp">
            <input type="hidden" name="codigoCliente" value="<%=listado.getString("codigo_cliente") %>"/>
            <input type="submit" value="borrar">
        </form>
        <form method="post" action="detalleCliente.jsp">
            <input type="hidden" name="codigoCliente" value="<%=listado.getString("codigo_cliente") %>"/>
            <input type="submit" value="detalles">
        </form>
    </td></tr>
    <%
        } // while
        conexion.close();
    %>
</table>
</body>
</html>