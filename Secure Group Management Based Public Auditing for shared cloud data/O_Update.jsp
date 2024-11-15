<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
.style3 {font-size: 36px; }
.style4 {font-size: 14px}
.style7 {color: #353c3e}
.style9 {font-size: 14px; color: #353c3e; font-weight: bold; }
.style10 {
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
          <li class="active"><a href="O_Main.jsp">Hi <%=application.getAttribute("doname")%> !!</a></li>
          <li><a href="O_Login.jsp">Logout</a></li>
        </ul>
      </div>
      <div class="logo">
        <h1 class="style3 style10">Secure Group Management Based Public Auditing for shared cloud data</h1>
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
          <h2> Update File </h2>
          <p class="infopost style4"><em><strong>Select blocks of perticular files and update its contents. </strong></em></p>
          <form id="form1" name="form1" method="post" action="O_Update1.jsp">
            <p>&nbsp;</p>
            <table width="576" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td width="183" height="38"><span class="style9">Enter File Name :</span></td>
                <td width="415"><input name="file" type="text" id="file" size="50" required="required" /></td>
              </tr>
              <tr>
                <td height="38" class="style9">Select The Block : </td>
                <td><span class="style7">
                  <select name="block"  >
                    <option>--Select--</option>
                    <option>Block1</option>
                    <option>Block2</option>
                    <option>Block3</option>
                    <option>Block4</option>
                  </select>
                </span></td>
              </tr>
              <tr>
                <td height="40"><div align="right"><span class="style7"></span></div></td>
                <td><input name="Submit" type="submit" value="View Block" /></td>
              </tr>
            </table>
          </form>
          <p class="infopost style4">&nbsp;</p>
          <div class="style2"></div>
          <div class="img">
            <div align="justify"></div>
          </div>
          <div class="post_content">
            <p align="right"><a href="O_Main.jsp">Back</a> </p>
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
            <li><a href="O_ViewFiles.jsp">View Files</a></li>
            <li><a href="O_Upload.jsp">Upload File</a></li>
            <li><a href="O_Update.jsp">Update File</a></li>
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
