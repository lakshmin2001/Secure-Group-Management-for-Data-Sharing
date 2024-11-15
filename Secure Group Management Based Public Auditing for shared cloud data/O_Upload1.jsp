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
.style21 {font-size: 24px}
.style22 {color: #353c3e}
.style23 {color: #FF0000}
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
        <h1 class="style23 style21"><strong>Secure Group Management Based Public Auditing for shared cloud data</strong></h1>
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
          <p>&nbsp;</p>
          <div class="clr"></div>
          <span class="style23">
          <% try 
	{
      		String file=request.getParameter("tt");
      		String cont=request.getParameter("text");
      		String start=request.getParameter("start");
      		String keys = "ef50a0ef2c3e3a5f";
      		String h[]=new String[5];
      		String filename="filename";
			String filename1="filename1";
			String filename2="filename2";
			String filename3="filename3";
			String filename4="filename4";
			ResultSet rs=connection.createStatement().executeQuery("select * from cloudserver where fname='"+file+"' ");
			if(!rs.next())
			{
      		
			int sourceFileSize=cont.length();
			int s=sourceFileSize%4;
			int s1=sourceFileSize/4;
			int a1=s1;
			int a2=s1+s1;
			int a3=s1+s1+s1;
			int a4=s1+s1+s1+s1+s;
			
			String encryptedValue1="",encryptedValue2="",encryptedValue3="",encryptedValue4="";
			
			
		//	String keys = "ef50a0ef2c3e3a5f";
				byte[] keyValue = keys.getBytes();
      			Key key = new SecretKeySpec(keyValue, "AES");
      			Cipher c = Cipher.getInstance("AES");
      			c.init(Cipher.ENCRYPT_MODE, key);
				String encryptedValue = new String(Base64.encode(cont.getBytes()));
				
				encryptedValue1 = new String(Base64.encode(cont.substring(0,a1).getBytes()));
				encryptedValue2 = new String(Base64.encode(cont.substring(a1+1,a2).getBytes()));
				encryptedValue3 = new String(Base64.encode(cont.substring(a2+1,a3).getBytes()));
				encryptedValue4 = new String(Base64.encode(cont.substring(a3+1,a4).getBytes()));		
												
			
			%>
Source File Size = (<%=sourceFileSize %>), a1 = (<%=a1 %>), a2 = (<%=a2 %>), a3 = (<%=a3 %>), a4 = (<%=a4 %>), split : (<%=s %>)
<%
      	
      		PrintStream p1 = new PrintStream(new FileOutputStream(filename1+".txt"+"/"));
			p1.print(new String(encryptedValue1));
			PrintStream p2 = new PrintStream(new FileOutputStream(filename2+".txt"+"/"));
			p2.print(new String(encryptedValue2));
			PrintStream p3 = new PrintStream(new FileOutputStream(filename3+".txt"+"/"));
			p3.print(new String(encryptedValue3));
			PrintStream p4 = new PrintStream(new FileOutputStream(filename4+".txt"+"/"));
			p4.print(new String(encryptedValue4));
			
			for(int i=1;i<5;i++)
			{
				MessageDigest md = MessageDigest.getInstance("SHA1");
				FileInputStream fis11 = new FileInputStream(filename+i+".txt"+"/");
				DigestInputStream dis1 = new DigestInputStream(fis11, md);
				BufferedInputStream bis1 = new BufferedInputStream(dis1);
	 
				//Read the bis so SHA1 is auto calculated at dis
				while (true) 
				{
					int b1 = bis1.read();
					if (b1 == -1)
						break;
				}
	 
				BigInteger bi1 = new BigInteger(md.digest());
				String spl1 = bi1.toString();
				h[i] = bi1.toString(16);
			
			
			
			
      		}		
%>
          </span>
          <div class="clr"></div>
<form action="O_Upload2.jsp" method="post">
<input type="hidden" name="fsize" value="<%=sourceFileSize %>" />
  <table width="560" border="0" align="center">
    <tr><input type="hidden" name="start" value="<%=start%>" />
      <td width="143" height="39"><span class="style4 style22">File Name :- </span></td>
      <td width="407"><input name="t42" type="text" id="t42"
			value="<%= file %>" size="50" readonly="readonly" /></td>
    </tr>
    <tr>
      <td width="143" height="40"><span class="style4 style22">Block-1 </span></td>
      <td width="407"><span class="style4 style22">Size:<%=a1%>Bytes</span></td>
    </tr>
    <tr>
      <td height="145">&nbsp;</td>
      <td>
        <textarea name="text1" cols="50" rows="8" readonly="readonly"><%= encryptedValue1 %></textarea>
      </td>
    </tr>
    <tr>
      <td height="40"><span class="style4 style22">Digital Certificate-1: </span></td>
      <td><input name="t1" type="text" id="t4"
			value="<%= h[1] %>" size="50" readonly="readonly" /></td>
    </tr>
    <tr>
      <td width="143" height="41"><span class="style4 style22">Block-2 </span></td>
      <td width="407"><span class="style4 style22">Size:<%=(a2-a1)%>Bytes</span></td>
    </tr>
    <tr>
      <td>></td>
      <td>
        <textarea name="text2" cols="50" rows="8" readonly="readonly"><%= encryptedValue2 %></textarea>
      </td>
    </tr>
    <tr>
      <td height="37"><span class="style4 style22">Digital Certificate-2: </span></td>
      <td><input name="t2" type="text" id="t4"
			value="<%= h[2] %>" size="50" readonly="readonly" /></td>
    </tr>
    <tr>
      <td width="143" height="40"><span class="style4 style22">Block-3 </span></td>
      <td width="407"><span class="style4 style22">Size:<%=(a3-a2)%>Bytes</span></td>
    </tr>
    <tr>
      <td height="168"></td>
      <td>
        <textarea name="text3" cols="50" rows="8" readonly="readonly"><%= encryptedValue3 %></textarea>
      </td>
    </tr>
    <tr>
      <td height="41"><span class="style4 style22">Digital Certificate-3: </span></td>
      <td><input name="t3" type="text" id="t4"
			value="<%= h[3]%>" size="50" readonly="readonly" /></td>
    </tr>
    <tr>
      <td width="143" height="35"><span class="style4 style22">Block-4 </span></td>
      <td width="407"><span class="style4 style22">Size:<%=(a4-a3)%>Bytes</span></td>
    </tr>
    <tr>
      <td height="161"></td>
      <td>
        <textarea name="text4" cols="50" rows="8" readonly="readonly"><%= encryptedValue4 %></textarea>
      </td>
    </tr>
    <tr>
      <td height="42"><span class="style4 style22">Digital Certificate-4: </span></td>
      <td><input name="t4" type="text" id="t4"
			value="<%= h[4] %>" size="50" readonly="readonly" /></td>
    </tr>
    <tr>
      <td><span class="style22"></span></td>
      <td><span class="style22"></span></td>
    </tr>
    <tr>
      <td><div align="right"><span class="style22"></span></div></td>
      <td><input name="Submit2" type="submit" value="Upload" /></td>
    </tr>
  </table>
</form>
<%
}
else
{
%>
<h2 class="style21">File name already exist ! </h2>
<div align="right"><a href="O_Upload.jsp">Back</a>
    <%
}
	   

         connection.close();
          }
         
          catch(Exception e)
          {
            out.println(e.getMessage());
          }
%>
</div>
<p class="infopost">&nbsp;</p>
          <div class="style2"></div>
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
