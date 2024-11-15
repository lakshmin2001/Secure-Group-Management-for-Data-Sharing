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
.style27 {font-size: 18px}
.style28 {font-size: 12px; }
.style29 {
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
        <h1 class="style3 style29">Secure Group Management Based Public Auditing for shared cloud data</h1>
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
            <h2>Request Download Permission  </h2>
            <p class="infopost">&nbsp;</p>
            <p>
              <%
			  
			  try 
			  {

				String owner = request.getParameter("t142");
				String fname = request.getParameter("t14");
				String uname=(String)application.getAttribute("uname");
				
				SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
				SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");
				
				Date now = new Date();
				
				String strDate = sdfDate.format(now);
				String strTime = sdfTime.format(now);
				String dt = strDate + "   " + strTime;

				String query1="select * from request where user='"+uname+"' and owner='"+owner+"' and fname='"+fname+"' "; 
				Statement st1=connection.createStatement();
				ResultSet rs1=st1.executeQuery(query1);
				if ( rs1.next())
				{
					String download_per=rs1.getString(5);
					if(download_per.equalsIgnoreCase("Requested"))
					{
						%>
						</p>
						<p class="style27">Request Already Sent To Cloud !! </p>
						<p><a href="U_Main.jsp" class="style28">Back</a></p>
						<p>
						<%	
					}
					else if(download_per.equalsIgnoreCase("Permitted"))
					{
						%>
						</p>
						<p class="style27">Request Already Sent To Cloud !! </p>
						<p><a href="U_Main.jsp" class="style28">Back</a></p>
						<p>
						<%	
					}else{}
				}
				else
				{
					
					String query2="select * from cloudserver  where fname='"+fname+"' and ownername='"+owner+"'"; 
					Statement st2=connection.createStatement();
					ResultSet rs2=st2.executeQuery(query2);
					if ( rs2.next())
					{
						String query4="select * from request where user='"+uname+"' and  fname='"+fname+"' and owner='"+owner+"'";
						ResultSet rs4 = connection.createStatement().executeQuery(query4);
						if(rs4.next())
						{
							String query5="update request set download_per='Requested' where user='"+uname+"' and owner='"+owner+"' and fname='"+fname+"'";
							connection.createStatement().executeUpdate(query5);
							%>
							</p>
							<p class="style27">Request Sent To Cloud !! </p>
							<p><a href="U_Main.jsp" class="style28">Back</a></p>
							<p>
							<%
						}
						else
						{
							String query3="insert into request(user,owner,fname,download_per) values('"+uname+"','"+owner+"','"+fname+"','Requested')";
							connection.createStatement().executeUpdate(query3);
							%>
							</p>
							<p class="style27">Request Sent To Cloud !! </p>
							<p><a href="U_Main.jsp" class="style28">Back</a></p>
							<p>
							<%
						}
					}
					else
					{
						%>
						</p>
						<p class="style27">File Doesn't Exist !! </p>
						<p><a href="U_Main.jsp" class="style28">Back</a></p>
						<p>
						<%
					}
				   	
				}
			connection.close();
	}
	catch (Exception e)
	{
		out.print(e);
	}
		
  %>
            </p>
            <p class="infopost">&nbsp;</p>
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
