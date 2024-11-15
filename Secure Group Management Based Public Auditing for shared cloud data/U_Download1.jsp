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
.style24 {font-size: 24px}
.style25 {
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
        <h1 class="style3 style25">Secure Group Management Based Public Auditing for shared cloud data</h1>
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
            <h2>Download  Files  </h2>
            <p class="infopost">&nbsp;</p>
            <%
		  
	try 
	{
		String file = request.getParameter("t1");
		String un=(String)application.getAttribute("uname");
		
		
		
		String query1 = "select * from request  where user='"+un+"' and fname='" + file+ "' ";
		Statement st1 = connection.createStatement();
		ResultSet rs1 = st1.executeQuery(query1);
		if (rs1.next()) 
		{
			String per=rs1.getString(5);
			if(per.equalsIgnoreCase("Requested"))
			{
				%>
				<h3 class="style24">Wait For Cloud To Grant Download Permission !!!</h3>
				<%
			}
			if(per.equalsIgnoreCase("Permitted"))
			{
				String mac1="";
				String mac2="";
				String mac3="";
				String mac4="";
				String sk="";
				String strQuery = "select * from cloudserver where fname='"+file+"' ";
				ResultSet rs = connection.createStatement().executeQuery(strQuery);
				if(rs.next()==true)
				{
					mac1=rs.getString(6);

					if(mac1.equalsIgnoreCase("Shared"))
					{
					
						String ct1=rs.getString(5);
						
						String keys = "ef50a0ef2c3e3a5f";
						byte[] keyValue = keys.getBytes();
						Key key = new SecretKeySpec(keyValue, "AES");
						Cipher c = Cipher.getInstance("AES");
						c.init(Cipher.DECRYPT_MODE, key);
						String fn = new String(Base64.decode(ct1.getBytes()));
					
						String strQuery1 = "select * from cloudserver where fname='"+fn+"' ";
						ResultSet rs2 = connection.createStatement().executeQuery(strQuery1);
						if(rs2.next()==true)
						{
							String oname1=rs.getString(3);
							String mac11=rs2.getString(6);
							String  mac22=rs2.getString(8);
							String  mac33=rs2.getString(10);
							String  mac44=rs2.getString(12);
							String  sk1=rs2.getString(13);
							String Siz1=rs2.getString(15);
							
							
							SimpleDateFormat sdfDate = new SimpleDateFormat(
							"dd/MM/yyyy");
							SimpleDateFormat sdfTime = new SimpleDateFormat(
							"HH:mm:ss");
							
							Date now = new Date();
							
							String strDate = sdfDate.format(now);
							String strTime = sdfTime.format(now);
							String dt = strDate + "   " + strTime;	
							String task="Download";
							String user=(String) application.getAttribute("uname");
							String strQuery2 = "insert into transaction(user,fname,task,dt,fsize) values('"+user+"','"+file+"','"+task+"','"+dt+"','"+Siz1+"')";
							connection.createStatement().executeUpdate(strQuery2);
							String strQuery21 = "insert into transaction(user,fname,task,dt,fsize) values('"+oname1+"','"+file+"','"+task+"','"+dt+"','"+Siz1+"')";
							connection.createStatement().executeUpdate(strQuery21);
							
							%>
							<form action="U_Download2.jsp" method="post" name="form1" id="form1">
							<table width="478" border="0" align="center">
							<tr>
							<td width="223"><span class="style23 style1"><strong>Enter File Name :</strong></span></td>
							<td width="245"><label>
							<input required="required" name="t1"
							type="text"  size="40" value="<%=file%>"/>
							</label></td>
							</tr>
							<tr>
							<td height="34"><span class="style23 style1"><strong>Enter Owner Name :</strong></span></td>
							<td><input name="oname" type="text" size="40" value="<%=oname1%>" /></td>
							</tr>
							<tr>
							<td height="34"><span class="style23 style1"><strong>MAC 1 :</strong></span></td>
							<td><input name="t12" type="text" size="40" value="<%=mac11%>" /></td>
							</tr>
							<tr>
							<td height="34"><span class="style23 style1"><strong>MAC 2 :</strong></span></td>
							<td><input name="t122" type="text" size="40" value="<%=mac22%>" /></td>
							</tr>
							<tr>
							<td height="34"><span class="style23 style1"><strong>MAC 3 :</strong></span></td>
							<td><input name="t123" type="text" size="40" value="<%=mac33%>" /></td>
							</tr>
							<tr>
							<td height="34"><span class="style23 style1"><strong>MAC 4 :</strong></span></td>
							<td><input name="t124" type="text" size="40"value="<%=mac44%>" /></td>
							</tr>
							<tr>
							<td><span class="style23 style1"><strong>Secret Key :</strong></span></td>
							<td><input name="t13" type="text" size="40" value="<%=sk1%>" /></td>
							</tr>
							<tr>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							</tr>
							<tr>
							<td><div align="right">
							<input type="submit" name="Submit"
							value="Download" />
							</div></td>
							</tr>
							</table>
							</form>
							<%	
						}
					}
					else
					{
						String oname=rs.getString(3);
						mac2=rs.getString(8);
						mac3=rs.getString(10);
						mac4=rs.getString(12);
						sk=rs.getString(13);
						String Siz=rs.getString(15);
						
						
						SimpleDateFormat sdfDate = new SimpleDateFormat(
						"dd/MM/yyyy");
						SimpleDateFormat sdfTime = new SimpleDateFormat(
						"HH:mm:ss");
						
						Date now = new Date();
						
						String strDate = sdfDate.format(now);
						String strTime = sdfTime.format(now);
						String dt = strDate + "   " + strTime;	
						String task="Download";
						String user=(String) application.getAttribute("uname");
						String strQuery2 = "insert into transaction(user,fname,task,dt,fsize) values('"+user+"','"+file+"','"+task+"','"+dt+"','"+Siz+"')";
						connection.createStatement().executeUpdate(strQuery2);
						String strQuery21 = "insert into transaction(user,fname,task,dt,fsize) values('"+oname+"','"+file+"','"+task+"','"+dt+"','"+Siz+"')";
						connection.createStatement().executeUpdate(strQuery21);
						
						%>
						<form action="U_Download2.jsp" method="post" name="form1" id="form1">
						<table width="478" border="0" align="center">
						<tr>
						<td width="223"><span class="style23 style1"><strong>Enter File Name :</strong></span></td>
						<td width="245"><label>
						<input required="required" name="t1"
						type="text"  size="40" value="<%=file%>"/>
						</label></td>
						</tr>
						<tr>
						<td height="34"><span class="style23 style1"><strong>Enter Owner Name :</strong></span></td>
						<td><input name="oname" type="text" size="40" value="<%=oname%>" /></td>
						</tr>
						<tr>
						<td height="34"><span class="style23 style1"><strong>MAC 1 :</strong></span></td>
						<td><input name="t12" type="text" size="40" value="<%=mac1%>" /></td>
						</tr>
						<tr>
						<td height="34"><span class="style23 style1"><strong>MAC 2 :</strong></span></td>
						<td><input name="t122" type="text" size="40" value="<%=mac2%>" /></td>
						</tr>
						<tr>
						<td height="34"><span class="style23 style1"><strong>MAC 3 :</strong></span></td>
						<td><input name="t123" type="text" size="40" value="<%=mac3%>" /></td>
						</tr>
						<tr>
						<td height="34"><span class="style23 style1"><strong>MAC 4 :</strong></span></td>
						<td><input name="t124" type="text" size="40"value="<%=mac4%>" /></td>
						</tr>
						<tr>
						<td><span class="style23 style1"><strong>Secret Key :</strong></span></td>
						<td><input name="t13" type="text" size="40" value="<%=sk%>" /></td>
						</tr>
						<tr>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						</tr>
						<tr>
						<td><div align="right">
						<input type="submit" name="Submit"
						value="Download" />
						</div></td>
						</tr>
						</table>
						</form>
						<%	
					}
				}
				else
				{
				
					out.println("File Doesn't Exist !!!");
					%>
					<p align="right">&nbsp;</p>
					<%
				}	
			}	
		} 
		else
		{
			%>
			<h3 class="style24">You Have Not Requested For Download Permission<br /> <a href="U_Download_Req.jsp">Click Here</a> To Request !!!</h3>
			<%
		}
		
		connection.close();
	}
	catch(Exception e)
	{
	out.println(e.getMessage());
	}
%>
            <div class="style2"></div>
            <div class="img">
              <div align="justify"></div>
            </div>
            <div class="post_content">
              <p align="right"><a href="U_Download.jsp">Back</a></p>
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
