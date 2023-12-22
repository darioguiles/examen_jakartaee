<%@page import="java.sql.*" %>
<%@page import="java.util.Objects" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<%
    //CÓDIGO DE VALIDACIÓN
    boolean valida = true;
    int numero = -1;

    boolean flagValidaNum = false;


    try {
        numero = Integer.parseInt(request.getParameter("id"));
        flagValidaNum = true;



    } catch (Exception ex) {
        ex.printStackTrace();
        valida = false;

        if (!flagValidaNum)
        {
            session.setAttribute("errorPartido","Error en ID");
        }



    }
    //FIN CÓDIGO DE VALIDACIÓN

    if (valida) {

        Connection conn = null;
        PreparedStatement ps = null;
// 	ResultSet rs = null;

        try {

            //CARGA DEL DRIVER Y PREPARACIÓN DE LA CONEXIÓN CON LA BBDD
            //						v---------UTILIZAMOS LA VERSIÓN MODERNA DE LLAMADA AL DRIVER, no deprecado
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/tienda", "user", "user");


            String sql = "INSERT INTO tienda.pedido ValUES ( " +
                    "?) "; //tipo partido

            ps = conn.prepareStatement(sql);
            int idx = 1;
            ps.setInt(idx++, numero);


            int filasAfectadas = ps.executeUpdate();
            System.out.println("Pedido GRABADO:  " + filasAfectadas);


        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                ps.close();
            } catch (Exception e) { /* Ignored */ }
            try {
                conn.close();
            } catch (Exception e) { /* Ignored */ }
        }

        out.println("Pedido creado.");
        out.println("<a href=\"index.jsp\">Volver atrás</a>");
    } else {
        //out.println("Error de validación!");
        //Mandamos la redirección
        response.sendRedirect("formNuevoPedido.jsp");
    }
%>

</body>
</html>
