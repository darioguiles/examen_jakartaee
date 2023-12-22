
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>Introduzca los datos del nuevo Pedido:</h2>
<form method="get" action="grabaPedido.jsp">
    ID <input type="text" name="id" required/></br>
    fechaPedido <input type="date" name="fechaP"/>
    </br>
    fechaEsperada <input type="date" name="fechaEsp"/>
    </br>
    fechaEntrega <input type="date" name="fechaEnt"/>
    </br>
    Estado <input type="text" name="estado"/></br>
    comentarios <input type="text" name="comentarios"/></br>
    codigoCliente <input type="text" name="codCliente" required/></br>
    <input type="submit" value="Aceptar">
</form>
<%
    String error = (String) session.getAttribute("errorPedido");
    if (error!=null)
    {

%>
<span style="color:red"><%=error%><span>
        <%
    session.removeAttribute("errorPedido"); //
      }
  %>
</body>
</html>
