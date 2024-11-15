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

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Attacker::Secure Group Management Based Public Auditing for shared cloud data</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/coin-slider.css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/cufon-georgia.js"></script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/coin-slider.min.js"></script>
<style type="text/css">
<!--
.style1 {font-size: 24}
.style2 {padding:0; margin:0; width:100%; line-height:0; clear: both;}
.style5 {padding: 0; margin: 0; width: 100%; line-height: 0; clear: both; color: #FF0000; }
.style6 {
	color: #FF0000;
	font-weight: bold;
}
.style7 {color: #FF0000; font-size: 24px;}
-->
</style>
</head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="menu_nav">
        <ul>
          <li class="active"><a href="index.html"><span>HOME </span></a></li>
          <li><a href="U_Login.jsp">USER</a></li>
          <li><a href="O_Login.jsp"><span>OWNER</span></a></li>
          <li><a href="D_Login.jsp"><span>TPA</span></a></li>
		  <li><a href="Kgc_Login.jsp"><span>KGC</span></a></li>
          <li><a href="C_Login.jsp">CLOUD</a></li>
        </ul>
      </div>
      <div class="logo">
        <h1 class="style7">Secure Group Management Based Public Auditing for shared cloud data</h1>
      </div>
      <div class="clr style1"></div>
      <div class="slider style1">
        <div id="coin-slider"> <a href="#"><img src="images/slide1.jpg" width="960" height="360" alt="" /> </a> <a href="#"><img src="images/slide2.jpg" width="960" height="360" alt="" /> </a> <a href="#"><img src="images/slide3.jpg" width="960" height="360" alt="" /> </a> </div>
        <div class="style2"></div>
      </div>
      <div class="clr style1"></div>
    </div>
  </div>
  <div class="content style1">
    <div class="content_resize">
      <div class="mainbar">
        <div class="article">
          <h2>Attacker</h2>
          <p class="infopost">&nbsp;</p>
         <%
String aname=request.getParameter("aname");
String file=request.getParameter("fname");
String block=request.getParameter("block");

String owner=request.getParameter("owner");

try
{
String keys = "ef50a0ef2c3e3a5f";
			String query2="";
			String cont="";
			if(block.equalsIgnoreCase("Block-1"))
			{
			
			query2="select ct1 from cloudserver where fname='"+file+"' and ownername='"+owner+"' "; 
			}
			if(block.equalsIgnoreCase("Block-2"))
			{
			
			query2="select ct2 from cloudserver where fname='"+file+"' and ownername='"+owner+"' "; 
			}
			if(block.equalsIgnoreCase("Block-3"))
			{
			
			query2="select ct3 from cloudserver where fname='"+file+"' and ownername='"+owner+"'"; 
			}
			if(block.equalsIgnoreCase("Block-4"))
			{
			
					query2="select ct4 from cloudserver where fname='"+file+"' and ownername='"+owner+"' "; 
			}
			Statement st1=connection.createStatement();
            ResultSet rs1=st1.executeQuery(query2);
				if(query2.equalsIgnoreCase("query2"))
				{
				%>
			<h1>invalid Query</h1>
			<%
				}
			ResultSet rs=connection.createStatement().executeQuery("select * from attacker where user='"+aname+"' and attacktype='External' ");
			if(rs.next())
			{
			%>
			<h1>Sorry You are Blocked</h1>
			<%
			}
			else
			{
			if(rs1.next())
			{
			cont=rs1.getString(1);
			
			}
			else
			{
			%>
			<h2>File Not Exist<h2>
			<%
			}
			byte[] keyValue = keys.getBytes();
      			Key key = new SecretKeySpec(keyValue, "AES");
      			Cipher c = Cipher.getInstance("AES");
      			c.init(Cipher.DECRYPT_MODE, key);
      			String decryptedValue = new String(Base64.decode(cont.getBytes()));

%>
<form method="post" action="Attack2.jsp">
<table width="553" border="1" align="center" >
<tr><td align="center">User Name</td><td><input type="text" value="<%=aname%>"  name="aname"/> </td></tr>
<tr><td align="center">File Name</td><td><input type="text"  value="<%=file%>" name="fname"/> </td></tr>
<tr><td align="center">Select Block</td><td> <input type="text"  value="<%=block%>" name="block"/></td></tr>
<tr><td align="center">Owner Name</td><td> <input type="text"  value="<%=owner%>" name="owner"/></td></tr>

<tr> <td align="center">File Contents</td><td><textarea name="cont" id="textarea" cols="70" rows="15"><%=decryptedValue%></textarea></td></tr>


<tr> <td colspan="2" align="center"><input type="submit" value="Attack"/></td></table>
<%
}
}
catch(Exception e)
{
e.printStackTrace();

}
%>
          <div class="img">
            <div align="justify"></div>
          </div>
          <div class="style2"></div>
        </div>
        </div>
      <div class="sidebar">
        <div class="searchform">
          <form id="formsearch" name="formsearch" method="post" action="#">
            
            <input name="editbox_search" class="editbox_search" id="editbox_search" maxlength="80" value="Search our ste:" type="text" />
            
            <input name="button_search" src="images/search.gif" class="button_search" type="image" />
          </form>
    </div>
        <div class="gadget">
          <h2 class="star"> Home Menu</h2>
          <div class="style5"></div>
          <ul class="sb_menu">
            <li class="style6"><a href="U_Login.jsp">User</a></li>
            <li class="style6"><a href="C_Login.jsp">Cloud</a></li>
            <li class="style6"><a href="O_Login.jsp">Owner</a></li>
            <li><span class="style6"><a href="D_Login.jsp">TPA</a></span></li>
          </ul>
        </div>
        <div class="gadget">
          <h2 class="star">Concepts</h2>
          <div class="style2"></div>
          <ul class="ex_menu">
            <li><a href="">Cloud Storage,</a></li>
            <li><a href=""> Data Integrity,</a></li>
            <li><a href=""> Fuzzy Identity,</a></li>
            <li><a href=""> Threshold Secret Sharing.</a><a href=""></a><br />
            </li>
          </ul>
        </div>
      </div>
      <div class="style2"></div>
    </div>
  </div>
  <div class="fbg style1">
    <div class="fbg_resize">
      <div class="style2"></div>
    </div>
  </div>
  <div class="footer style1">
    <div class="footer_resize">
      <div style="clear:both;"></div>
    </div>
  </div>
</div>
<div align=center class="style1"></div>
</body>
</html>
