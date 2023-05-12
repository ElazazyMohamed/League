<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegClubRepresentative.aspx.cs" Inherits="Koora.RegClubRepresentative" %>

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
             Create your Club Representative Profile

            <br />
            <br />
            Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="CRname" runat="server"></asp:TextBox>
            <br />
            Username:&nbsp;&nbsp; <asp:TextBox ID="CRuser" runat="server"></asp:TextBox>
            <br />
            Password:&nbsp;&nbsp; <asp:TextBox ID="CRpass" runat="server"></asp:TextBox>
             <br />
             Club Name :<asp:TextBox ID="CRclub" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="Button2" OnClick="CRreg" runat="server" Text="SUBMIT" />
            <br />

            
            <br><br><br><br><br><br><br><br><br>
            <br><br><br><br><br><br><br><br><br>
            <br><br><br><br><br><br><br><br><br>
            <br><br><br><br><br><br><br><br><br>
        </div>
        </div>
    </form>
</body>
</html>
