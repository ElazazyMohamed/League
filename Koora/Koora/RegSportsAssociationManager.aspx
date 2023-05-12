<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegSportsAssociationManager.aspx.cs" Inherits="Koora.RegSportsAssociationManager" %>

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
            Create your Sports Association Manager Profile

            <br />
            <br />
            Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="SAMname" runat="server"></asp:TextBox>
            <br />
            Username:
            <asp:TextBox ID="SAMuser" runat="server"></asp:TextBox>
            <br />
            Password:
            <asp:TextBox ID="SAMpass" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="Button1" OnClick="SAMreg" runat="server" Text="SUBMIT" />
            <br />


            <br><br><br><br><br><br><br><br><br><br><br>
            <br><br><br><br><br><br><br><br><br><br>
            <br><br><br><br><br><br><br><br><br><br>
            <br><br><br>
           
            

        </div>
        </div>
    </form>
</body>
</html>
