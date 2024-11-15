
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>
<%@ include file="connect.jsp"%>
<%@page
	import="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
<%@ page
	import="java.sql.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream"%>
<%@ page
	import="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
<%@page
	import="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>
	<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*" %>

<%@ page import="java.sql.*"%>

<%@ page import="java.util.*"%>
<html>
<%
String owner=request.getParameter("owner");
String file=request.getParameter("file");
String block=request.getParameter("block");


String strQuery2="";
String strQuery3="";
String encryptedValue="";
	String		h1="";
	String		pk="";

try
{
String keys = "ef50a0ef2c3e3a5f";
			String query2="";
			
	
				if(block.equalsIgnoreCase("Block1"))
			{
			
			 strQuery3 = "select mac1,ct1,sk from  backupcloudserver where fname='" + file + "'  and ownername='"+owner+"' ";
			}
				if(block.equalsIgnoreCase("Block2"))
			{
			
				 strQuery3 = "select mac2,ct2,sk from  backupcloudserver where fname='" + file + "'  and ownername='"+owner+"' ";
			}
				if(block.equalsIgnoreCase("Block3"))
			{
			
				 strQuery3 = "select mac3,ct3,sk from  backupcloudserver where fname='" + file + "'  and ownername='"+owner+"' ";
			}
				if(block.equalsIgnoreCase("Block4"))
			{
			
				 strQuery3 = "select mac4,ct4,sk from  backupcloudserver where fname='" + file + "'  and ownername='"+owner+"' ";
			}
	
			ResultSet rs=connection.createStatement().executeQuery(strQuery3);
			if(rs.next())
			{
			encryptedValue=rs.getString(2);
			h1=rs.getString(1);
			pk=rs.getString(3);
			}
			
			
				if(block.equalsIgnoreCase("Block1"))
			{
			
				 strQuery2 = "update cloudserver set ct1='"
						+ encryptedValue + "', mac1='" + h1 + "',sk='" + pk
						+ "' where fname='" + file + "'  and ownername='"+owner+"' ";
			}
				if(block.equalsIgnoreCase("Block2"))
			{
			
				 strQuery2 = "update cloudserver set ct2='"
						+ encryptedValue + "', mac2='" + h1 + "',sk='" + pk
						+ "' where fname='" + file + "'  and ownername='"+owner+"' ";
			}
				if(block.equalsIgnoreCase("Block3"))
			{
			
				 strQuery2 = "update cloudserver set ct3='"
						+ encryptedValue + "', mac3='" + h1 + "',sk='" + pk
						+ "' where fname='" + file + "'  and ownername='"+owner+"' ";
			}
				if(block.equalsIgnoreCase("Block4"))
			{
			
				 strQuery2 = "update cloudserver set ct4='"
						+ encryptedValue + "', mac4='" + h1 + "',sk='" + pk
						+ "' where fname='" + file + "'  and ownername='"+owner+"' ";
			}
			
				connection.createStatement().executeUpdate(strQuery2);
				
			

			
%>






<p>
<h1 >Recovered Success Fully!!!<a href="O_VerifyBlock.jsp">Back</a></h1>
</p>
<br />

<%
}
catch(Exception e)
{
e.printStackTrace();

}
%>
</html>
