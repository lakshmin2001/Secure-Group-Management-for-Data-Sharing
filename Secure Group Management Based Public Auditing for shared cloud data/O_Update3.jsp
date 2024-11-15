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
.style4 {font-size: 14px}
.style10 {font-size: 24px}
.style11 {
	color: #FF0000;
	font-size: 24px;
	font-weight: bold;
}
-->
</style>
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
        <h1 class="style3 style11">Secure Group Management Based Public Auditing for shared cloud data</h1>
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
          <h2> Update <strong>Status</strong> </h2>
          <p class="infopost style4">
            <% 
						
						try
						 
	{
      		String s1 = "", s2 = "", s3 = "", s4 = "", s5 = "", s6 = "", s7 = "", s8, s9 = "", s10, s11, s12, s13;
	
		String file = request.getParameter("file");
		String cont = request.getParameter("cont");
			String block = request.getParameter("block");
		String query1="",query2="";
		String mac = request.getParameter("mac");
			String owner = (String)application.getAttribute("doname");
				
								
		String cloud = "cloud";
			
      		SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
		SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");

		Date now = new Date();
		String strDate = sdfDate.format(now);
		String strTime = sdfTime.format(now);
		String dt = strDate + "   " + strTime;

		

		String user = owner;
		String task = "Update";
					Statement st211 = connection.createStatement();
		Statement st21 = connection.createStatement();
		if(block.equalsIgnoreCase("Block1"))
		{
		query1="update cloudserver set mac1='"+mac+"',ct1='"+cont+"' where fname='"+file+"' and ownername='"+owner+"' ";
		query2="update backupcloudserver  set mac1='"+mac+"',ct1='"+cont+"' where fname='"+file+"' and ownername='"+owner+"' ";
		}
		if(block.equalsIgnoreCase("Block2"))
		{
		query1="update cloudserver set mac2='"+mac+"',ct2='"+cont+"' where fname='"+file+"' and ownername='"+owner+"' ";
		query2="update backupcloudserver  set mac2='"+mac+"',ct2='"+cont+"' where fname='"+file+"' and ownername='"+owner+"' ";
		}
		if(block.equalsIgnoreCase("Block3"))
		{
		query1="update cloudserver set mac3='"+mac+"',ct3='"+cont+"' where fname='"+file+"' and ownername='"+owner+"' ";
		query2="update backupcloudserver  set mac3='"+mac+"',ct3='"+cont+"' where fname='"+file+"' and ownername='"+owner+"' ";
		}
		if(block.equalsIgnoreCase("Block4"))
		{
		query1="update cloudserver set mac4='"+mac+"',ct4='"+cont+"' where fname='"+file+"' and ownername='"+owner+"' ";
		query2="update backupcloudserver  set mac4='"+mac+"',ct4='"+cont+"' where fname='"+file+"' and ownername='"+owner+"' ";
		}
	int x =	st21.executeUpdate(query1);
		int y = st211.executeUpdate(query2);
	
	if(x>0 )
	{
	%>
</p>
          <h3 class="style10">Data Updated Successfully !!!</h3>
          <%
	}

        
          }
         
          catch(Exception e)
          {
          e.printStackTrace();
          }
%>
          </p>
<div class="post_content">
            <p align="right"><a href="O_Main.jsp">Back</a> </p>
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
          <h2 class="star"> Menu</h2>
          <div class="style2"></div>
          <ul class="sb_menu">
            <li><a href="O_Main.jsp">Home</a></li>
            <li><a href="O_ViewFiles.jsp">View Files</a></li>
            <li><a href="O_Upload.jsp">Upload File</a></li>
            <li><a href="O_Update.jsp">Update File</a></li>
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
