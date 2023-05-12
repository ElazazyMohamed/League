<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegStadiumManager.aspx.cs" Inherits="Koora.RegStadiumManager" %>

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
             Create your StadiumNanager Profile

            <br />
            <br />
            Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="SMname" runat="server"></asp:TextBox>
            <br />
            Username:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; <asp:TextBox ID="SMuser" runat="server"></asp:TextBox>
            <br />
            Password:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; <asp:TextBox ID="SMpass" runat="server"></asp:TextBox>
             <br />
             Stadium Name :<asp:TextBox ID="SMstadium" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="Button2" OnClick="SMreg" runat="server" Text="SUBMIT" />
            <br />



             <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br>
             <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br>
            <br> <br> <br> <br> <br> 
        </div>
        </div>
    </form>
</body>
</html>
