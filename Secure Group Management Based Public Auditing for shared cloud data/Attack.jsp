<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Attacker::Secure Group Management Based Public Auditing for shared cloud data</title>
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
.style5 {padding: 0; margin: 0; width: 100%; line-height: 0; clear: both; color: #FF0000; }
.style6 {
	color: #FF0000;
	font-weight: bold;
}
.style7 {color: #FF0000; font-size: 24px;}
-->
</style>
</head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="menu_nav">
        <ul>
          <li class="active"><a href="index.html"><span>HOME </span></a></li>
          <li><a href="U_Login.jsp">USER</a></li>
          <li><a href="O_Login.jsp"><span>OWNER</span></a></li>
          <li><a href="D_Login.jsp"><span>TPA</span></a></li>
		  <li><a href="Kgc_Login.jsp"><span>KGC</span></a></li>
          <li><a href="C_Login.jsp">CLOUD</a></li>
        </ul>
      </div>
      <div class="logo">
        <h1 class="style7">Secure Group Management Based Public Auditing for shared cloud data</h1>
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
          <h2>Attacker</h2>
          <p class="infopost">&nbsp;</p>
          <%
try
{

%>
<form method="post" action="Attack1.jsp">
<table width="459" border="1" align="center" >
<tr><td align="center"><strong>User Name</strong></td>
<td><input type="text" placeholder="Enter Your Name" name="aname"/> </td></tr>
<tr><td align="center"><strong>File Name</strong></td>
<td><input type="text" placeholder="Enter File Name to Attack" name="fname"/> </td></tr>
<tr><td align="center"><strong>Select Block</strong></td>
<td><select name="block" ><option>--Select--</option>
<option>Block-1</option>
<option>Block-2</option>
<option>Block-3</option>
<option>Block-4</option>
</select> </td></tr>
<tr><td align="center"><strong>Owner Name</strong></td>
<td><input type="text" placeholder="Enter Owner Name" name="owner"/> </td></tr>



<tr> <td colspan="2" align="center"><input type="submit" value="Attack"/></td></table>
<%
}
catch(Exception e)
{
e.printStackTrace();

}
%>
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
          <h2 class="star"> Home Menu</h2>
          <div class="style5"></div>
          <ul class="sb_menu">
            <li class="style6"><a href="U_Login.jsp">User</a></li>
            <li class="style6"><a href="C_Login.jsp">Cloud</a></li>
            <li class="style6"><a href="O_Login.jsp">Owner</a></li>
            <li><span class="style6"><a href="D_Login.jsp">TPA</a></span></li>
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
