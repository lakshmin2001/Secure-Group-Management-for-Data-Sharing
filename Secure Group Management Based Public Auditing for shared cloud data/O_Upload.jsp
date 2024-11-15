<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
	import="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream,java.math.*"%>
	<%@ page import="java.lang.management.ThreadMXBean,java.lang.management.ManagementFactory"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Owner </title>
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
.style3 {font-size: 36px; }
.style20 {color: #353c3e}
.style23 {
	color: #FF0000;
	font-size: 24px;
	font-weight: bold;
}
-->
</style>
<script language="javascript" type='text/javascript'>
function loadFileAsText()
{
	var fileToLoad = document.getElementById("file").files[0];

	var fileReader = new FileReader();
	fileReader.onload = function(fileLoadedEvent) 
	{
		var textFromFileLoaded = fileLoadedEvent.target.result;
		document.getElementById("textarea").value = textFromFileLoaded;
	};
	fileReader.readAsText(fileToLoad, "UTF-8");
}
</script>
</head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="menu_nav">
        <ul>
          <li class="active"><a href="O_Main.jsp">Hi <%=application.getAttribute("doname")%> !!</a></li>
          <li><a href="O_Login.jsp">Logout</a></li>
        </ul>
      </div>
      <div class="logo">
        <h1 class="style3 style23">Secure Group Management Based Public Auditing for shared cloud data</h1>
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
          <h2>Upload File</h2>
          <p class="infopost">&nbsp;</p>
          <div class="style2"></div>
          <div class="img">
            <div align="justify"></div>
          </div> <%	  
			  
			  
	
	String dname=(String)application.getAttribute("doname");
	String cloud="cloud";	
	
	try 
	{			
		
		
		
		
		
						ThreadMXBean threadBean= ManagementFactory.getThreadMXBean();
						long start= threadBean.getCurrentThreadCpuTime();
						
						%>
						<div class="post_content">
						<form id="form1" name="form1" method="post" action="O_Upload1.jsp">
						<table width="598" border="0" align="left">
						<tr><input type="hidden" name="start" value="<%=start%>" />
						<td width="286" height="35"><span class="style4 style20">Select File :- </span></td>
						<td width="356"><input required="required" type="file" name="t42" id="file"  onchange="loadFileAsText()" /></td>
						</tr>
						<tr>
						<td height="35" class="style4 style20">File Name :- </td>
						<td><input required="required" name="tt" type="text" id="t42" size="50"/></td>
						</tr>
						<tr>
						<td height="255"><span class="style20"></span></td>
						<td><textarea name="text" id="textarea" cols="50" rows="15"></textarea></td>
						</tr>
						<tr>
						<td><div align="right"></div></td>
						<td><input type="submit" name="Submit" value="Encrypt" /></td>
						</tr>
						</table>
						</form>
						<p align="justify">&nbsp;</p>
						<p align="justify">&nbsp;</p>
						<p align="justify">&nbsp;</p>
						<p align="justify">&nbsp;</p>
						<p align="justify">&nbsp;</p>
						<p align="justify">&nbsp;</p>
						<p align="justify">&nbsp;</p>
						<p align="justify">&nbsp;</p>
						<p align="justify">&nbsp;</p>
						<p align="justify">&nbsp;</p>
						<p align="justify">&nbsp;</p>
						<p align="justify">&nbsp;</p>
						</div>
						<%
					
		
	}
	
	catch(Exception e)
	{
	
	out.println(e.getMessage());
	
	}
%>        <div class="style2"></div>
		 <div align="right"><a href="O_Main.jsp">Back</a> </div>
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
          <h2 class="star"> Menu</h2>
          <div class="style2"></div>
          <ul class="sb_menu">
            <li><a href="O_Main.jsp">Home</a></li>
            <li><a href="O_Login.jsp">Logout</a></li>
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
