<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Koora.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title> NYA Football Website</title>
    <style>
        .backimg{
            background-image:url(img/background1.jpg);
            width:100%;
            height:100%
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div  style="height:fit-content" >
        <div class ="backimg">
            <h1>NYA Football Website</h1>
            <br>
            <h2> Log In </h2>
         
            <asp:Label ID="WarningMessage" runat="server" Font-Bold="True" Font-Names="Britannic Bold" Font-Size="Medium" ForeColor="Red"></asp:Label>
            <br>
            </asp:Label><asp:Label runat="server" Text="username"></asp:Label>
            <asp:TextBox ID ="TextBox1" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label runat="server" Text="password"></asp:Label>   
            <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
            <br />
            <br>
            <asp:Button runat="server" OnClick="login" Text ="SUBMIT"></asp:Button>
            <br />
            <br>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Registeration1.aspx">New Here? Register New Account</asp:HyperLink>
            <br />
            <br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
            <br /><br /><br /><br /><br /><br /><br /><br /><br />
            <br /><br /><br /><br />
           

        </div>
        </div>
    </form>
</body>
</html>
