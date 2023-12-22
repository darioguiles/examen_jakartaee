<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<%
  //CÓDIGO DE VALIDACIÓN
  boolean valida = true;
  int codigo = -1;
  try {
    codigo = Integer.parseInt(request.getParameter("codigo"));
  } catch (NumberFormatException nfe) {
    nfe.printStackTrace();
    valida = false;
  }
  //FIN CÓDIGO DE VALIDACIÓN


  if (valida) {


    Connection conn = null;
    PreparedStatement ps = null;
// 	ResultSet rs = null;

    try {

      Class.forName("com.mysql.cj.jdbc.Driver");
      conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/tienda","user", "user");

      String sql = "DELETE FROM tienda.pedido where codigo_pedido = ?";
      //CREO EL OBJETO PreparedStatement
      ps = conn.prepareStatement(sql);

      //A LA HORA DE ESTABLECER EL VALOR DEL PARÁMETRO PARA PODER EJECUTAR
      //LA QUERY DEBEMOS INDICAR LA POSICIÓN Y UTILIZAR EL SETTER DE TIPO ADECUADO
      ps.setInt(1, codigo);

      //CUANDO EJECUTAS SENTENCIAS DML, INSERT, UPDATE, DELETE SE EMPLEA ps.executeUpdate()
      int filasAfectadas = ps.executeUpdate();

      System.out.println("Pedidos BORRADOS:  " + filasAfectadas);

    } catch (Exception ex) {
      ex.printStackTrace();
    } finally {
      //BLOQUE FINALLY PARA CERRAR LA CONEXIÓN CON PROTECCIÓN DE try-catch
      //SIEMPRE HAY QUE CERRAR LOS ELEMENTOS DE LA  CONEXIÓN DESPUÉS DE UTILIZARLOS
      //try { rs.close(); } catch (Exception e) { /* Ignored */ }
      try { ps.close(); } catch (Exception e) { /* Ignored */ }
      try { conn.close(); } catch (Exception e) { /* Ignored */ }
    }

  }
%>

<!-- REDIRECCIÓN POR JavaScript EN EL CLIENTE  -->
<script>document.location = "listadoPedidos.jsp"</script>
</body>
</html>