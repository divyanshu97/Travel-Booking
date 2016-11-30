<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserHomePage.aspx.cs" Inherits="UserHomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
  <title>User</title>
  <link rel="stylesheet" href="../css/user.css">
  <meta name="viewport" content="width=device width, initial scale=1.0,maximum-scale1,user-scalable=no">
  <meta charset="UTF-8">
</head>
<body>
    <form id="form1" runat="server">
<header>
  <img id="head" src="../Images/head.png">
</header>
<article>
  <div>
    <img src="../Images/imgg.jpg">
  </div>
  <div id="text">
    <asp:Label id="h1" runat="server">Hello user</asp:Label>
    <p>Have an amazing experience in your travel planning...</p>
</article>
<div class="bar">
<nav class="left">
    <p>Navigate to...</p>
  <ul class="list1">
    <li><a href="../LoggedinUserHome.aspx">Home</a></li>  <%--Removing login signup option with log out--%>
    <li><a href="../Explore.aspx">Explore</a></li>
    <li><a href="../About.aspx">About</a></li>
    <li><a href="../Contact.aspx">Contact</a></li>
  </ul>
</nav>
<nav class="right" id="Side">
    <p>Profile options</p>
  <ul class="list" id="listes">
    <li><a href="../Personals.aspx">View Profile</a></li>
    <li><a href="../ChangeUserDetails.aspx">Edit Profile</a></li>
    <li><a runat="server" id="linkUpdateEvent" href="#" onserverclick="UpdateEvent" class="icon">Update Event</a></li>
    <li><a href="#" onServerClick="logout"  runat="server">Logout</a></li>
  </ul>
</nav>
</div>
<div class="main">
  <p>Want to have a journey planned for you?</p>
<button class="button">
        <div class="state"><a href="../Plan.aspx" style="color:darkgrey;text-decoration:none" >Plan</a></div>
      </button>
</div>
        </form>
    <script>
        //function logout()
        //{
        //    Session["LastPage"]=
        //}
    </script>
</body>
</html>

