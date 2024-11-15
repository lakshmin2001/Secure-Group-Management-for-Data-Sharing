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
.style15 {color: #fff;
	font-weight: bold;
}
.style16 {font-size: 12px;
	color: #6d6d6d;
}
.style20 {font-size: 12px}
.style21 {
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
        <h1 class="style3 style21">Secure Group Management Based Public Auditing for shared cloud data</h1>
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
            <p class="infopost">
              <%
				String name=(String)application.getAttribute("uname");
				
				String query="select * from user where name='"+name+"' ";//and status!='Requested'";
				Statement st = connection.createStatement();
				ResultSet rs1 =st.executeQuery(query);
				if(rs1.next())
				{
					String stat=rs1.getString(13);
					if(stat.equalsIgnoreCase("Requested"))
					{
						%>
</p>
            <h3 >&nbsp;</h3>
            <h3 >Please Wait For Cloud To Grant Search Permission <a href="U_Search_Req.jsp">Click Here </a>To View Response !!</h3>
            <p class="style30">&nbsp;</p>
            <%

					}
					if(stat.equalsIgnoreCase("No"))
					{
					%>
            </p>
            <h3 >&nbsp;</h3>
            <h3 >You Have Not Requested Search Permission <a href="U_Search_Req.jsp">Click Here </a>To Request !!</h3>
            <p class="style30">&nbsp;</p>
            </p>
            <%
				  }
					
					else
					{
						%>
            <form id="form1" method="post" action="U_Search1.jsp">
              <p>&nbsp;</p>
              <table width="487" border="0" align="center" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
                <tr>
                  <th width="236" height="40" scope="row"><div align="left"><span class="style15"><span class="odd  style16">Enter  Keyword  : </span></span></div></th>
                  <td width="320"><span class="style15">
                    <input required="required" name="t14" type="text" value="" size="30" />
                  </span></td>
                </tr>
              </table>
              <p align="center" class="style15">&nbsp;</p>
              <p align="center">
                <input type="submit" name="Submit2" value="Submit" />
              </p>
              <p align="left"> <a href="U_Search_Req.jsp" class="style20"> View Search Permission Response</a></p>
            </form>
            <%
				 	}
				}
				
				  
				  %>
            <p></p>
            <div class="style2"></div>
            <div class="img">
              <div align="justify"></div>
            </div>
            <div class="post_content">
              <p align="right"><a href="U_Main.jsp">Back</a></p>
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
