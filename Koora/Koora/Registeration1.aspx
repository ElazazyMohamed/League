<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registeration1.aspx.cs" Inherits="Koora.Registeration1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
        <div style="height:fit-content">
        <div class="backimg">
            <h1>Choose your Registration Profile</h1>
            <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                <asp:ListItem Value="Sports Association Manager">Sports Association Manager</asp:ListItem>
                <asp:ListItem>Club Representative</asp:ListItem>
                <asp:ListItem>Stadium Manager</asp:ListItem>
                <asp:ListItem>Fan</asp:ListItem>
            </asp:RadioButtonList>
            <asp:Button ID="Button1" OnClick="Register1" runat="server" Text="Submit" />
            <br />
            <br />



            <br><br><br><br><br><br><br><br><br>
            <br><br><br><br><br><br><br><br><br>
            <br><br><br><br><br><br><br><br><br><br><br>
         
        </div>
        </div>
    </form>
</body>
</html>
