<%@ page import="java.sql.*,java.util.Random,java.security.KeyPair,java.security.KeyPairGenerator,java.security.NoSuchAlgorithmException,java.security.PublicKey,javax.crypto.Cipher,javax.crypto.NoSuchPaddingException" %>
<%@page import ="java.util.*"%>
<%@ page import="java.sql.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream" %>
<%@ page import ="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
<%@page import ="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>
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

int uid = Integer.parseInt(request.getParameter("uid"));
String fname=request.getParameter("fname");
Statement st1 = connection.createStatement();

try 

{	

			KeyPairGenerator kg = KeyPairGenerator.getInstance("RSA"); 
			Cipher encoder = Cipher.getInstance("RSA"); 
			KeyPair kp = kg.generateKeyPair(); 
			PublicKey pubKey = kp.getPublic(); 
			// RSA produces 1024 bits Key
			byte[] pub = pubKey.getEncoded();
			String s = pub.toString();
			
			
			
			String query3 ="update tpadata set sk='"+s+"' where fname='"+fname+"' ";
			st1.executeUpdate (query3);
			
			String query4 ="update cloudserver set sk='"+s+"'  where id='"+uid+"' ";
			st1.executeUpdate (query4);
			
			String query5 ="update backupcloudserver set sk='"+s+"'  where fname='"+fname+"' ";
			st1.executeUpdate (query5);
		


}
catch(Exception e)
{
out.println(e.getMessage());
}
response.sendRedirect("D_ViewFiles1.jsp");
%>
</body></html>