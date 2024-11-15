<%@ page import="java.sql.*,java.util.Random,java.security.KeyPair,java.security.KeyPairGenerator,java.security.NoSuchAlgorithmException,java.security.PublicKey,javax.crypto.Cipher,javax.crypto.NoSuchPaddingException" %>
<%@ include file="connect.jsp" %>
<html><style type="text/css">
<!--
body {
	background-color: #FFFFFF;
}
-->
</style>
<body>
<%
int uid = Integer.parseInt(request.getParameter("usid"));
try {

Statement st1 = connection.createStatement();
String query1 ="update request set download_per='Permitted' where id='"+uid+"' ";
st1.executeUpdate (query1);
connection.close();
}
catch(Exception e)
{
out.println(e.getMessage());
}
response.sendRedirect("C_DownloadReq.jsp");
%>
</body></html>