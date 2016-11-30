﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Travel way | Login</title>
    <link rel="stylesheet" href="login.css"/>
    <meta name="viewport" content="width=device width, initial scale=1.0,maximum-scale1,user-scalable=no"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="HandheldFriendly" content="true"/>
</head>
<body onload="resetForm()">
    <header>
        <div class="img">
              <img id="head" src="head.png" height="100px"/>
        </div>
    </header>
    <div class="wrapper">
        <form class="login" id="form1" runat="server">
        <p class="title">Login</p>
      
        <p>
            <asp:TextBox ID="tbxEnterEmail" runat="server" input type="email" placeholder="Email" style="margin-left: 23px" Width="270px"></asp:TextBox>
            <span id="i1" class="icon"><img src="usericon.png" style="width: 2.8em; height: 3.2em;"></span>
            <asp:TextBox ID="tbxEnterPassword" runat="server" input type="password" placeholder="Password" style="margin-left: 24px" Width="270px"></asp:TextBox>
            <span id="i2" class="icon"><img src="passwordicon.png" style="width: 2.8em; height: 3.2em;"></span>
            <asp:Label ID="lblEnterRole" runat="server" Text="Role : "></asp:Label>
            <asp:DropDownList ID="dropRoles" runat="server" style="margin-left: 50px; margin-top: 0px; margin-bottom: 0px;" Height="55px" Width="127px">
                <asp:ListItem Selected="True" Value="">Select</asp:ListItem>
                <asp:ListItem Value="1">Admin</asp:ListItem>
                <asp:ListItem Value="2">User</asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorRoles" runat="server" controltovalidate="dropRoles" OnClick="SelectDrop()" ForeColor="red">Choose your Role</asp:RequiredFieldValidator>
            <p style="height: 16px">
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" ControlToValidate="tbxEnterEmail" ErrorMessage="Incorrect Email" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="requiredFieldValidatorPassword" runat="server" ControlToValidate="tbxEnterEmail" ErrorMessage="Incorrect Password" ForeColor="Red"></asp:RequiredFieldValidator>
            </p>
            <%--Changes--%>
            <p style="height: 11px"><a href="Security.aspx">Forgot your password?</a></p>
            <asp:Button ID="btnLogin" runat="server" OnClick="btnLogin_Click" Text="Login" BackColor="#0066FF" CssClass="state" ForeColor="White" Width="100%" Height="55px"/>
            
    </form>
        <footer>
                Not Yet Registered?<a href="Registration.aspx">Click here</a>
                <p><a href="Home.aspx">Home</a></p>
        </footer>
    </div>
    </form>
    <script>
        function resetForm()
        {
            document.getElementById("tbxEnterEmail").value = "";
            document.getElementById("tbxEnterPassword").value = "";
            document.getElementById("dropQues").value = "";
        }
        function SelectDrop()
        {
            if (document.getElementById("dropRoles").value == "")
                document.getElementById("dropRoles").innerHTML = "Choose your Role";
        }
     </script>
           
</body>
</html>
