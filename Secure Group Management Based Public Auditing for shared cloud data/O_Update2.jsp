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
          <h2> Update <strong>Block</strong> </h2>
          <p class="infopost style4"><em><strong> update Block. </strong></em></p>
          <% try 
	{
      		String file=request.getParameter("file");
			String block=request.getParameter("block");
      		String cont=request.getParameter("cont");
      		String keys = "ef50a0ef2c3e3a5f";
      		String h="";
      			String filename="filename";
			String filename1="filename1";
			String filename2="filename2";
			String filename3="filename3";
			String filename4="filename4";
			
      		
      		
			
      		
			
			String encryptedValue3="",encryptedValue2="",encryptedValue1="",encryptedValue4="";
			
			
		//	String keys = "ef50a0ef2c3e3a5f";
										byte[] keyValue = keys.getBytes();
      			Key key = new SecretKeySpec(keyValue, "AES");
      			Cipher c = Cipher.getInstance("AES");
      			c.init(Cipher.ENCRYPT_MODE, key);
      			String encryptedValue = new String(Base64.encode(cont.getBytes()));
				 	
												
			
			
			
			
			
			
      	
			PrintStream p1 = new PrintStream(new FileOutputStream(filename1+".txt"+"/"));
			p1.print(new String(encryptedValue));
			
			
		
			MessageDigest md = MessageDigest.getInstance("SHA1");
			FileInputStream fis11 = new FileInputStream(filename1+".txt"+"/");
			DigestInputStream dis1 = new DigestInputStream(fis11, md);
			BufferedInputStream bis1 = new BufferedInputStream(dis1);
 
			//Read the bis so SHA1 is auto calculated at dis
			while (true) {
				int b1 = bis1.read();
				if (b1 == -1)
					break;
			}
 
			BigInteger bi1 = new BigInteger(md.digest());
			String spl1 = bi1.toString();
			h = bi1.toString(16);
			
			
			
			
      	
	
%>
          <div class="clr"></div>
          <form action="O_Update3.jsp" method="post">
            <table width="598" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td width="286" height="34"><span class="style7 style4"><strong>File Name :- </strong></span></td>
                <td width="356"><input name="file" type="text" id="t42" size="35"
			value="<%= file %>" readonly="readonly" /></td>
              </tr>
              <tr>
                <td width="286" height="32"><span class="style7 style4"><strong>
Block                  :</strong></span></td>
                <td width="286"><span class="style4"><strong>
                  <input name="block" type="text" id="block" size="35"
			value="<%= block %>" readonly="readonly" />
                </strong></span></td>
              </tr>
              <tr>
                <td height="257">&nbsp;</td>
                <td><textarea name="cont" cols="50" rows="15" readonly="readonly"><%= encryptedValue%></textarea></td>
              </tr>
              <tr>
                <td height="35"><span class="style7 style4"><strong>MAC: </strong></span></td>
                <td><input name="mac" type="text" id="t4" size="50"
			value="<%= h %>" readonly="readonly" /></td>
              </tr>
              <tr>
                <td height="35"><div align="right"></div></td>
                <td><input type="submit" name="Submit2" value="Update" /></td>
              </tr>
            </table>
          </form>
          <%

	   

         connection.close();
          }
         
          catch(Exception e)
          {
            out.println(e.getMessage());
          }
%>
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
