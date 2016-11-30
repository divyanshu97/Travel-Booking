<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="ChangePassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
                body{
  font-family: sans-serif;
}

*{
  box-sizing: border-box;
}

.wrapper{
  display: flex;
  align-items: center;
  flex-direction: column;
  justify-content: center;
  width: 100%;
  height: 100%;
  padding: 20px;
  background: #f6f6f6;
}

.login{
  position: relative;
  border-radius: 5px;
  padding: 20px;
  width: 90%;
  max-width: 320px;
  box-shadow: rgba(0, 0, 0, .2);
}

.title {
  color: #444;
  font-size: 2em;
  font-weight: bold;
  margin: 10px 0 30px 0;
  border-bottom: 1px solid #eee;
  padding-bottom: 20px;
}

input{
  display: block;
  padding: 15px 10px;
  margin: 20px;
  border: 1px solid #d0cfcf;
  width:90%;
  box-shadow: 0pt 2px 2px rgba(105, 108, 109, 0.7),
              0px 0px 2px 2px rgba(208, 223, 226, 0.4)inset;
  transition: border-width .2s ease-in;
}

.input:focus, .input:active{
  outline: none;
  border: 1px solid rgba(91, 90, 90, 0.7);
  background: rgba(238, 236, 240, .2);
  box-shadow: 0px 1px 2px 0px rgba(168, 168, 168, 0.9)inset;
}

.icon{
  left: 10px;
  position: absolute;
  margin-top: -67px;
  opacity: 1;
  box-shadow: 0pt 2px 2px rgba(105, 108, 109, 0.7);
}

a {
 font-size: 0.8em;
  color: #2196F3;
  text-decoration: none;
}

footer {
  display: block;
  padding-top: 50px;
  text-align: center;
  color: #ddd;
  font-weight: normal;
  text-shadow: 0px -1px 0px rgba(0,0,0,0.2);
  font-size: 1em;
  a, a:link {
    color: #fff;
    text-decoration: none;
  }
}

button {
  width: 95%;
  height: 100%;
  padding: 10px 10px;
  background: #2196F3;
  color: #fff;
  display: block;
  border: none;
  margin-top: 40px;
  position: absolute;
  left: 0;
  bottom: -50px;
  max-height: 60px;
  border: 0px solid rgba(0,0,0,0.1);
border-radius: 0 0 2px 2px;
}

.state{
  font-size: 1.5em;
}

    </style>
</head>
<body onload="reform">
 <div class="wrapper">
        <form class="login" runat="server">
            <p class="title">Change Password</p>
            <asp:TextBox id="tbxEmail" type="email" placeholder="Email" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" ValidationGroup="ValidSignup" runat="server" controltovalidate="tbxEmail" ErrorMessage="* Required" ForeColor="red"></asp:RequiredFieldValidator>
            <span id="i1" class="icon"><img src="../Images/usericon.png" width="30em" height="47em"></span>
            <asp:TextBox id="tbxChangedPassword" runat="server" type="password" placeholder="New Password" ></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword" ValidationGroup="ValidSignup" runat="server" controltovalidate="tbxChangedPassword" ErrorMessage="* Required" ForeColor="red"></asp:RequiredFieldValidator>
            <span id="i2" class="icon"><img src="../Images/passwordicon.png" width="30em" height="47em"></span>
            <button>
                <%--<span class="state"  onclick="location.href = '../HomePage.aspx';">Log in</span>--%>
                 <asp:Button ID="btnChangePassword" ValidationGroup="ValidSignup" runat="server" Text="Submit" OnClick="btnChangePassword_Click" />        
            </button>
            <asp:Label ID="lblInfo" runat="server" ForeColor="Red"></asp:Label>
        </form>
        <script>
            function reform()
            {
                document.getElementById("tbxEmail") = "";
                document.getElementById("tbxChangePassword") = "";
            }
            </script>
</body>
</html>




 <%--   <div>
        <asp:TextBox ID="tbxEmail" runat="server" placeholder="e-Mail" /> 
        <asp:Textbox ID="tbxChangedPassword" runat="server" placeholder="New Password" />
    </div>
        <p>
        <asp:Button ID="btnChangePassword" runat="server"  Text="Submit" OnClick="btnChangePassword_Click"/>
        </p>--%>