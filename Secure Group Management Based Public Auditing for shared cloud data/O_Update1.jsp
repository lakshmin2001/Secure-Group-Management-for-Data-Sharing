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
.style7 {color: #353c3e}
.style8 {
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
        <h1 class="style3 style8">Secure Group Management Based Public Auditing for shared cloud data</h1>
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
          <h2> Update File </h2>
          <p class="infopost style4"><em><strong>Edit  block Contents  and update. </strong></em></p>
          <%
				
					String owner=(String)application.getAttribute("doname");
	
  		String file = request.getParameter("file");
		String block = request.getParameter("block");
   		try {
	   	  
		   	String keys = "ef50a0ef2c3e3a5f";
			String query2="";
			String cont="";
			if(block.equalsIgnoreCase("Block1"))
			{
			
			query2="select ct1 from cloudserver where fname='"+file+"' and ownername='"+owner+"'"; 
			}
			if(block.equalsIgnoreCase("Block2"))
			{
			
			query2="select ct2 from cloudserver where fname='"+file+"' and ownername='"+owner+"'";
			}
			if(block.equalsIgnoreCase("Block3"))
			{
			
			query2="select ct3 from cloudserver where fname='"+file+"' and ownername='"+owner+"'"; 
			}
			if(block.equalsIgnoreCase("Block4"))
			{
			
						query2="select ct4 from cloudserver where fname='"+file+"' and ownername='"+owner+"'"; 
			}
			Statement st1=connection.createStatement();
            ResultSet rs1=st1.executeQuery(query2);
			
			if(rs1.next())
			{
			cont=rs1.getString(1);
			
			}
			byte[] keyValue = keys.getBytes();
      			Key key = new SecretKeySpec(keyValue, "AES");
      			Cipher c = Cipher.getInstance("AES");
      			c.init(Cipher.DECRYPT_MODE, key);
      			String decryptedValue = new String(Base64.decode(cont.getBytes()));
					%>
          <form id="form1" name="form1" method="post" action="O_Update2.jsp">
            <table width="598" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td width="286" height="31"><span class="style7 style4"><strong> File Name :</strong></span></td>
                <td width="356"><input required="required" type="text" name="file" id="file" value="<%=file%>" size="50" /></td>
              </tr>
              <tr>
                <td height="38" class="style7 style4"><strong>  Block : </strong></td>
                <td width="356"><input required="required" type="text" name="block" id="file" value="<%=block%>" size="50" /></td>
              </tr>
              <tr>
                <td height="257" class="style7 style4"><strong>Block Contents : </strong></td>
                <td><textarea name="cont" id="textarea"  cols="50" rows="15"><%=decryptedValue%></textarea></td>
              </tr>
              <tr>
                <td height="37"><div align="right"></div></td>
                <td><input type="submit" name="Submit" value="Update Block" /></td>
              </tr>
            </table>
          </form>
          <%
  }
  catch(Exception e)
  {
  e.printStackTrace();
  }%>
          <div class="post_content">
            <p align="right"><a href="O_Update.jsp">Back</a> </p>
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
