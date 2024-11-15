<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import ="java.util.*"%>
<%@page import ="java.sql.*"%>
<%@page import ="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
<%@ page import="java.sql.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream" %>
<%@ page import ="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
<%@page import ="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>
<%@ include file="connect.jsp" %>

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
.style3 {
	font-size: 24px;
	font-weight: bold;
}
.style23 {color: #353c3e}
.style24 {color: #FF0000}
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
        <h1 class="style3 style24">Secure Group Management Based Public Auditing for shared cloud data</h1>
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
          <h2>File Details   </h2>
          <p class="infopost">&nbsp;</p>
          <%	  
			  
			  
	String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8,s9="",s10,s11,s12,s13,s14;
	int i=0,j=0,k=0;
try 
	{		
		
				String query="Select *from cloudserver  "; 
				Statement st=connection.createStatement();
				ResultSet rs=st.executeQuery(query);
				while ( rs.next() )
				{
					i=rs.getInt(1);
					s2=rs.getString(2);
					s8=rs.getString(5);
					s3=rs.getString(6);
					s4=rs.getString(8);
					s5=rs.getString(10);
					s6=rs.getString(12);
					s7=rs.getString(14);
					
					
					String keys = "ef50a0ef2c3e3a5f";
					byte[] keyValue = keys.getBytes();
					Key key = new SecretKeySpec(keyValue, "AES");
					Cipher c = Cipher.getInstance("AES");
					c.init(Cipher.DECRYPT_MODE, key);
					String dt1 = new String(Base64.decode(s7.getBytes()));
					
						if(s3.equalsIgnoreCase("Shared"))
						{
							byte[] keyValue1 = keys.getBytes();
				Key key1 = new SecretKeySpec(keyValue1,"AES");
				Cipher c1 = Cipher.getInstance("AES");
				c1.init(Cipher.DECRYPT_MODE, key1);
							String fn = new String(Base64.decode(s8.getBytes()));
								
							String quey1="select * from cloudserver  where fname='"+s8+"' "; 
							Statement st1=connection.createStatement();
							ResultSet rs1=st1.executeQuery(quey1);
							if ( rs1.next())
							{
										j=rs1.getInt(1);
								s8=rs1.getString(2);
								s14=rs1.getString(3);
								s9=rs1.getString(6);
								s10=rs1.getString(8);
								s11=rs1.getString(10);
								s12=rs1.getString(12);
								s13=rs1.getString(14);
							
							%>
          <table width="586" border="1" style="border-collapse:collapse" cellspacing="0" cellpadding="0">
            <tr>
              <th width="137" height="30" scope="row"><span class="style23">Id : </span></th>
              <td width="443"><div align="center" class="style23">
                <h4 class="style34 style24"><strong>File Shared From <%=s14%> With File : &quot; <%=s8%>&quot;</strong></h4>
                <strong><%=j%></strong></div></td>
            </tr>
            <tr>
              <th height="30" scope="row"><span class="style23">File Name : </span></th>
              <td><div align="center" class="style23"><%=s2%></div></td>
            </tr>
            <tr>
              <th height="30" scope="row"><span class="style23">Block1(Digital Sign): </span></th>
              <td><div align="center" class="style23"><%=s9%></div></td>
            </tr>
            <tr>
              <th height="30" scope="row"><span class="style23">Block2(Digital Sign): </span></th>
              <td><div align="center" class="style23"><%=s10%></div></td>
            </tr>
            <tr>
              <th height="30" scope="row"><span class="style23">Block3(Digital Sign): </span></th>
              <td><div align="center" class="style23"><%=s11%></div></td>
            </tr>
            <tr>
              <th height="30" scope="row"><span class="style23">Block4(Digital Sign): </span></th>
              <td><div align="center" class="style23"><%=s12%></div></td>
            </tr>
            <tr>
              <th height="30" scope="row"><span class="style23">Date &amp; Time : </span></th>
              <td><div align="center" class="style23"><%=s13%></div></td>
            </tr>
            <tr>
              <th height="30" scope="row"><span class="style23">Detailed View : </span></th>
              <td><div align="center" class="style23"><a href="C_FileDetails.jsp?usid=<%=i%>">
                <input name="Input" type="button" value="View" />
              </a></div></td>
            </tr>
          </table>
          <p>
            <%
							
							}
						}
						else
						{	
					
					%>
          </p>
          <table width="586" border="1" style="border-collapse:collapse" cellspacing="0" cellpadding="0">
            <tr>
              <th width="137" height="30" scope="row"><span class="style23">Id : </span></th>
              <td width="443"><div align="center" class="style23"><strong><%=i%></strong></div></td>
            </tr>
            <tr>
              <th height="30" scope="row"><span class="style23">File Name : </span></th>
              <td><div align="center" class="style23"><%=s2%></div></td>
            </tr>
            <tr>
              <th height="30" scope="row"><span class="style23">Block1(Digital Sign): </span></th>
              <td><div align="center" class="style23"><%=s3%></div></td>
            </tr>
            <tr>
              <th height="30" scope="row"><span class="style23">Block2(Digital Sign): </span></th>
              <td><div align="center" class="style23"><%=s4%></div></td>
            </tr>
            <tr>
              <th height="30" scope="row"><span class="style23">Block3(Digital Sign): </span></th>
              <td><div align="center" class="style23"><%=s5%></div></td>
            </tr>
            <tr>
              <th height="30" scope="row"><span class="style23">Block4(Digital Sign): </span></th>
              <td><div align="center" class="style23"><%=s6%></div></td>
            </tr>
            <tr>
              <th height="30" scope="row"><span class="style23">Date &amp; Time : </span></th>
              <td><div align="center" class="style23"><%=s7%></div></td>
            </tr>
            <tr>
              <th height="30" scope="row"><span class="style23">Detailed View : </span></th>
              <td><div align="center" class="style23"><a href="O_FileDetails.jsp?usid=<%=i%>">
                <input name="Input" type="button" value="View" />
              </a></div></td>
            </tr>
          </table>
          <p>
            <%
			  
				}
				}
	connection.close();
	}
	catch(Exception e)
	{
	out.println(e.getMessage());
	}
%>
          </p>
          <p></p>
          <div class="style2"></div>
          <div class="img">
            <div align="justify"></div>
          </div>
          <div class="post_content">
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
