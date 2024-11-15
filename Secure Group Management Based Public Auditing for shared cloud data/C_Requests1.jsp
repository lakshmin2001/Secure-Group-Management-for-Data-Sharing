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
.style3 {font-size: 36px; }
.style24 {
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
          <h2> Cloud Requests </h2>
          <p class="infopost">&nbsp;</p>
          <%
			
			
				int uid = Integer.parseInt(request.getParameter("usid"));
				String cloud=request.getParameter("cloud");
				String dname=request.getParameter("dname");
					String memory="";
				//String cost=request.getParameter("cost");
			int cost = Integer.parseInt(request.getParameter("cost"));

				if((cost>=1)&&(cost<=1000))
				{
					memory="55500";
				}if((cost>=1001)&&(cost<=2000))
				{
					memory="111000";
				}if((cost>=2001)&&(cost<=3000))
				{
					memory="222000";
				}if((cost>=3001)&&(cost<=4000))
				{
					memory="333000";
				}if((cost>=4001)&&(cost<=5000))
				{
					memory="444000";
				}if((cost>=5001)&&(cost<=6000))
				{
					memory="555000";
				}if((cost>=6001)&&(cost<=7000))
				{
					memory="666000";
				}if((cost>=7001)&&(cost<=8000))
				{
					memory="777000";
				}if((cost>=8001)&&(cost<=9000))
				{
					memory="888000";
				}if((cost>=9001)&&(cost<=10000))
				{
					memory="999000";
				}if((cost>=10001)&&(cost<=11000))
				{
					memory="1110000";
				}
					
			%>
          <form id="form1" name="form1" method="post" action="C_assign.jsp?usid=<%=uid%>">
            <table width="596" border="0" align="center" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
              <tr>
                <th height="40" scope="row"><div align="left"> Data Owner: </div></th>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input  readonly="<%=dname%>" name="dname" type="text" size="10" value="<%=dname%>" maxlength="8" />
                </td>
              </tr>
              <tr>
                <th height="40" scope="row"><div align="left">Cost Paid: </div></th>
                <td><label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      <input  readonly="<%=cost%>" name="cost" type="text" size="10" value="<%=cost%>" maxlength="8" />
                  </label>
                </td>
              </tr>
              <tr>
                <th height="40" scope="row"><div align="left">Assigned Memory: </div></th>
                <td><label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      <input name="memory" readonly="<%=memory%>" type="text" size="10" value="<%=memory%>" maxlength="8" />
                </label></td>
              </tr>
              <tr>
                <th width="141" height="40" scope="row"><div align="left">Enter SLA: </div></th>
                <td width="286"><label> From
                  <input name="slafrom" type="date" size="10" maxlength="10" />
                  </label>
                  To
                  <input name="slato" type="date" size="10" maxlength="10" /></td>
              </tr>
              <tr>
                <th height="89" scope="row">&nbsp;</th>
                <td><label>
                  <input type="submit" name="Submit" value="Assign" />
                  </label>
                </td>
              </tr>
            </table>
          </form>
          <p align="right">&nbsp;</p>
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
