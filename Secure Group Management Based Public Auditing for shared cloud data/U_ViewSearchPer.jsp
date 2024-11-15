<title>Search Token Request</title>
<%@ page import="java.util.Date" %>
<%@page import ="java.util.*"%>
<%@page import ="java.sql.*"%>
<%@page import ="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
<%@ page import="java.sql.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream" %>
<%@ page import ="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
<%@page import ="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>
<%@ include file="connect.jsp" %>
<%
   	String name=(String)application.getAttribute("uname");
	String msg="";
	try
	{
		
		String sql = "SELECT * FROM user where name='" + name+ "' and search_per!='null' ";
		Statement stmt = connection.createStatement();
		ResultSet rs1 = stmt.executeQuery(sql);
		if (rs1.next())
		{
			 msg=rs1.getString(13);
				if (msg.equalsIgnoreCase("Requested"))
				{
					msg="Search Permission Not Granted !!";
					application.setAttribute("msg",msg);
					response.sendRedirect("U_SearchPermissionRes.jsp");
				}
				if (msg.equalsIgnoreCase("No"))
				{
					msg="Search Permission Not Requested !!";
					response.sendRedirect("U_SearchPermissionRes.jsp");
					application.setAttribute("msg",msg);
				}
				else 
				{
					response.sendRedirect("U_SearchPermissionRes.jsp");
					application.setAttribute("msg",msg);
				}
			
			
		}
	}
	catch(Exception e)
	{
	out.print(e);
	}
%>