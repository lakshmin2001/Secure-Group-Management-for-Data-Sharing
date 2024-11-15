<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%@page import ="java.util.*"%>
<%@ include file="connect.jsp" %>
    <%@page import ="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
    <%@ page import="java.sql.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream" %>
<%@ page import ="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
 <%@page import ="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Cloud </title>
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
.style25 {color: #3f3f3f;
	font-weight: bold;
}
.style31 {color: #6d6d6d; }
.style32 {color: #515455}
.style33 {color: #515455; font-weight: bold; }
.style34 {
	color: #FF0000;
	font-size: 24px;
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
          <li class="active"><a href="C_Main.jsp">CLOUD</a></li>
          <li><a href="C_Login.jsp">LOGOUT</a></li>
        </ul>
      </div>
      <div class="logo">
        <h1 class="style3 style34">Secure Group Management Based Public Auditing for shared cloud data</h1>
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
          <h2>Authorize  Owner </h2>
          <p class="infopost">&nbsp;</p>
          <div class="style2"></div>
          <div class="img">
            <div align="justify"></div>
          </div>
          <div class="post_content">
            <p>&nbsp;</p>
            <table width="510" height="311" border="1" align="center"  cellpadding="0" cellspacing="0"  style="border-collapse: collapse;  margin:10px 10px 10px 10px; font-family:Verdana, Arial, Helvetica, sans-serif; font-size:14px;">
              <%
						String doname = request.getParameter("name");
						//int uid = Integer.parseInt(mid);
						String s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12,s13;
						int i=0;
						try 
						{
						   	String query="select * from downer where name='"+doname+"'"; 
						   	Statement st=connection.createStatement();
						   	ResultSet rs=st.executeQuery(query);
					   		while ( rs.next() )
					   		{
								i=rs.getInt(1);
								s1=rs.getString(2);
								s2=rs.getString(4);
								s3=rs.getString(5);
								s4=rs.getString(6);
								s5=rs.getString(7);
								//s6=rs.getString(8);
								//s7=rs.getString(9);
								//s8=rs.getString(8);
								
								
								
								
								
					%>
              <tr>
                <td rowspan="8" ><div style="margin:10px 13px 10px 13px;" >
                    <input  name="image" type="image" src="ownprofileimage.jsp?imgid=<%=i%>" style="width:200px; height:230px;" />
                </div></td>
              </tr>
              <tr>
                <td  width="150" valign="middle" height="40" style="color: #2c83b0;"><div align="left" class="style25 style32" style="margin-left:20px;">Name:</div></td>
                <td  width="300" valign="middle" height="40" style="color:#000000;"><div align="left" class="style31" style="margin-left:20px;">
                    <%out.println(s1);%>
                </div></td>
              </tr>
              <tr>
                <td  width="120" valign="middle" height="40" style="color: #2c83b0;"><div align="left" class="style33" style="margin-left:20px;">E-Mail:</div></td>
                <td  width="72" valign="middle" height="40" style="color:#000000;"><div align="left" class="style31" style="margin-left:20px;">
                    <%out.println(s2);%>
                </div></td>
              </tr>
              <tr>
                <td  width="100" valign="middle" height="40" style="color: #2c83b0;"><div align="left" class="style33" style="margin-left:20px;">Mobile:</div></td>
                <td  width="82" valign="middle" height="40"><div align="left" class="style31" style="margin-left:20px;">
                    <%out.println(s3);%>
                </div></td>
              </tr>
              <tr>
                <td  width="100" align="left" valign="middle" height="40" style="color: #2c83b0;"><div align="left" class="style33" style="margin-left:20px;">Date Of Birth:</div></td>
                <td  width="82" align="left" valign="middle" height="40"><div align="left" class="style31" style="margin-left:20px;">
                    <%out.println(s5);%>
                </div></td>
              </tr>
              <tr>
                <td  width="100" align="left" valign="middle" height="40" style="color: #2c83b0;"><div align="left " class="style33" style="margin-left:20px;">Address:</div></td>
                <td  width="82" align="left" valign="middle" height="40"><div align="left" class="style31" style="margin-left:20px;">
                    <%out.println(s4);%>
                </div></td>
              </tr>
              <%
						}
						connection.close();
					}
					catch(Exception e)
					{
						out.println(e.getMessage());
					}
					%>
            </table>
            <p align="right">&nbsp;</p>
            <p align="right"><a href="C_Main.jsp">Back</a></p>
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
            <li><a href="C_Main.jsp">Home</a></li>
            <li><a href="C_Login.jsp">Logout</a></li>
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
