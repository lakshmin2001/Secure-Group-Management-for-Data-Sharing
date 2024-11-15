<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>User Login</title>
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
	color: #FF0000;
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
          <li><a href="index.html"><span>HOME </span></a></li>
          <li class="active"><a href="U_Login.jsp">USER</a></li>
          <li><a href="O_Login.jsp"><span>OWNER</span></a></li>
          <li><a href="D_Login.jsp"><span>TPA</span></a></li>
          <li><a href="C_Login.jsp">CLOUD</a></li>
        </ul>
      </div>
      <div class="logo">
        <h1 class="style3">Secure Group Management Based Public Auditing for shared cloud data</h1>
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
          <h2>User Register </h2>
          <p class="infopost">&nbsp;</p>
          <div class="style2"></div>
          <form action="U_RegisterAuthentication.jsp" method="post" id="" enctype="multipart/form-data">
            <label for="name"> <br />
              User Name (required)<br />
            </label>
            <p>
              <input id="name" name="userid" class="text" />
            </p>
            <label for="password">Password (required)<br />
            </label>
            <p>
              <input type="password" id="password" name="pass" class="text" />
            </p>
            <label for="email">Email Address (required)<br />
            </label>
            <p>
              <input id="email" name="email" class="text" />
            </p>
            <label for="mobile">Mobile Number (required)<br />
            </label>
            <p>
              <input id="mobile" name="mobile" class="text" />
            </p>
            <label for="address">Your Address<br />
            </label>
            <p>
              <textarea name="address" cols="50" id="address"></textarea>
            </p>
            <label for="dob">Date of Birth (required)<br />
            </label>
            <p>
              <input id="dob" name="dob" class="text" />
            </p>
            <label for="gender">Select Gender (required)<br />
            </label>
            <p>
              <select id="s1" name="gender" class="text">
                <option>-Select-</option>
                <option>Male</option>
                <option>Female</option>
              </select>
            </p>
            <label for="pincode">Enter Pincode (required)<br />
            </label>
            <p>
              <input id="pincode" name="pincode" class="text" />
            </p>
            <label for="location">Enter Location (required)<br />
            </label>
            <p>
              <input id="loc" name="location" class="text" />
            </p>
            <label for="pic">Select Profile Picture (required)<br />
            </label>
            <p>
              <input type="file" id="pic" name="pic" class="text" />
            </p>
            <p>
              <input name="submit" type="submit" value="REGISTER" />
            </p>
            <p align="right"><a href="U_Login.jsp">Back</a></p>
          </form>
          <div class="post_content"><p align="justify">&nbsp;</p>
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
            <li><a href="U_Login.jsp">User</a></li>
            <li><a href="C_Login.jsp">Cloud</a></li>
            <li><a href="O_Login.jsp">Owner</a></li>
            <li><a href="D_Login.jsp">Deduplicator</a></li>
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
