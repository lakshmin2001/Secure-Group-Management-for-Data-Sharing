<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page import="java.util.Date" %>
<%@page import ="java.util.*"%>
<%@page import ="java.sql.*"%>
<%@page import ="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
<%@ page import="java.sql.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream" %>
<%@ page import ="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
<%@page import ="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>
<%@ include file="connect.jsp" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>User </title>
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
.style23 {color: #353c3e}
.style24 {color: #353c3e; font-weight: bold; font-size: 24; }
.style26 {font-size: 24; color: #353c3e; }
.style27 {
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
          <li class="active"><a href="U_Main.jsp">Hi <%=application.getAttribute("uname")%> !!</a></li>
          <li><a href="U_Login.jsp">Logout</a></li>
        </ul>
      </div>
      <div class="logo">
        <h1 class="style3 style27">Secure Group Management Based Public Auditing for shared cloud data</h1>
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
        <div class="mainbar">
          <div class="article">
            <h2>Search Files  </h2>
            <p class="infopost">&nbsp;</p>
            <table width="605" border="1.5" cellpadding="0" cellspacing="0" align="center">
              <tr>
                <td width="60" height="29"><div align="center" class="style23"><span class="style24">Id </span></div></td>
                <td width="101"><div align="center" class="style23"><span class="style24">File  Name </span></div></td>
                <td width="123"><div align="center" class="style23"><span class="style24">Owner </span></div></td>
                <td width="173"><div align="center" class="style23"><span class="style24">Download Related File </span></div></td>
                <td width="136"><div align="center" class="style23"><span class="style24">Rank</span></div></td>
                <%	  
			  
			  
	String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8,s9="",s10,s11,s12,s13;
	int i=0,j=0,k=0;
    String user=(String)application.getAttribute("uname");
try 
  {
            String keyword = request.getParameter("t14");
      		String keys = "ef50a0ef2c3e3a5f";
      		String h1="";
      		String filename="filename.txt";
      		
			SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
			SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");

			Date now = new Date();
		
			String strDate = sdfDate.format(now);
			String strTime = sdfTime.format(now);
			String dt = strDate + "   " + strTime;
			
      		byte[] keyValue = keys.getBytes();
      		Key key = new SecretKeySpec(keyValue, "AES");
      		Cipher c = Cipher.getInstance("AES");
      		c.init(Cipher.ENCRYPT_MODE, key);
      		String search = new String(Base64.encode(keyword.getBytes()));
			
			String task1="Search";
			
			String strQuery21 ="insert into transaction(user,fname,task,dt,fsize) values('"+user+"','"+keyword+"','"+task1+"','"+dt+"','-----')";
			connection.createStatement().executeUpdate(strQuery21);
			

			String strQuery22 ="insert into search(user,keyword,dt) values('"+user+"','"+keyword+"','"+dt+"')";
			connection.createStatement().executeUpdate(strQuery22);
	
				int found=0,total=0;
				String query4="select * from cloudserver where (status='Verified'||status='Shared')"; 
				Statement st4=connection.createStatement();
				ResultSet rs=st4.executeQuery(query4);
				while ( rs.next() )
				{
					i=rs.getInt(1);
					String fname=rs.getString(2);
					String owner=rs.getString(3);
					String ct1 =rs.getString(5);
					String ct2 =rs.getString(7);
					String ct3 =rs.getString(9);
					String ct4 =rs.getString(11);
					String date=rs.getString(14);
					String ra=rs.getString(17);

					total=total+1;
					
					
					c.init(Cipher.DECRYPT_MODE,key);
					String decryptedValue1 = new String(Base64.decode(ct1.getBytes()));
					String decryptedValue2 = new String(Base64.decode(ct2.getBytes()));
					String decryptedValue3 = new String(Base64.decode(ct3.getBytes()));
					String decryptedValue4 = new String(Base64.decode(ct4.getBytes()));
					
if((decryptedValue1.contains(keyword))||(decryptedValue2.contains(keyword))||(decryptedValue3.contains(keyword))||(decryptedValue4.contains(keyword))||(fname.contains(keyword)))
					{
						found=found+1;
						String strQuery1 = "select * from cloudserver where fname='"+fname+"'";
						ResultSet rs11 = connection.createStatement().executeQuery(strQuery1);
							if(rs11.next()==true)
							{
								String rank=rs11.getString(17);
								int updaterank = Integer.parseInt(rank)+1;
								String strQuery2 = "update cloudserver set rank='"+updaterank+"' where fname='"+fname+"'";
								connection.createStatement().executeUpdate(strQuery2);
								%>
              </tr>
              <tr>
                <td height="28"><div align="center" class="style26"><%=i%></div></td>
                <td><div align="center" class="style26"><%=fname%></div></td>
                <td><div align="center" class="style26"><%=owner%></div></td>
                <td><div align="center" class="style26"><a href="U_DownloadSearch.jsp?fname=<%=fname%>"> Download </a></div></td>
                <td><div align="center" class="style26"><%=ra%></div></td>
              </tr>
              <%
					
							}
							else
							{ 
								%>
              <h2>File Not Found !!!</h2>
              <%
							}
					
			  		  }
			    }
			 
			connection.close();
	}
	catch(Exception e)
	{
	out.println(e.getMessage());
	}
%>
            </table>
            <p class="infopost">&nbsp;</p>
            <p></p>
            <div class="style2"></div>
            <div class="img">
              <div align="justify"></div>
            </div>
            <div class="post_content">
              <p align="justify">&nbsp;</p>
            </div>
            <div class="style2"></div>
          </div>
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
            <li><a href="U_Main.jsp">Home</a></li>
            <li><a href="U_ViewFiles.jsp">View Files</a></li>
            <li><a href="U_Login.jsp">Logout</a></li>
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
