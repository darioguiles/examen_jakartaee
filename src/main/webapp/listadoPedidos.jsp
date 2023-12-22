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
<a href="formNuevoPedido.jsp">Crear nuevo Pedido</a>

<%
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/tienda","user", "user");
    Statement s = conexion.createStatement();

    ResultSet listado = s.executeQuery ("SELECT * FROM tienda.pedido");
%>
<table>
    <tr><th>ID</th><th>fPedido</th><th>fEsperada</th><th>fEntrega</th><th>estado</th><th>Coment</th><th>Codigo cliente</th></tr>
    <%
        while (listado.next()) {
            out.println("<tr><td>");
            out.println(listado.getString("codigo_pedido") + "</td>");
            out.println("<td>" + listado.getString("fecha_pedido") + "</td>");
            out.println("<td>" + listado.getString("fecha_esperada") + "</td>");
            out.println("<td>" + listado.getString("fecha_entrega") + "</td>");
            out.println("<td>" + listado.getString("estado") + "</td>");
            out.println("<td>" + listado.getString("comentarios") + "</td>");
            out.println("<td>" + listado.getString("codigo_cliente") + "</td>");

    %>
    <td>
        <form method="get" action="borraPedidos.jsp">
            <input type="hidden" name="codigo" value="<%=listado.getString("codigo_pedido") %>"/>
            <input type="submit" value="borrar">
        </form>
        <form method="post" action="formEditarPedido.jsp">
            <input type="hidden" name="codigo" value="<%=listado.getString("codigo_pedido") %>"/>
            <input type="submit" value="editar">
        </form>
    </td></tr>
    <%
        } // while
        conexion.close();
    %>
</table>
</body>
</html>