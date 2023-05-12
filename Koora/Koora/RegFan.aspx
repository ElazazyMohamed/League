<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegFan.aspx.cs" Inherits="Koora.RegFan" %>

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
             Create your Fan Profile

            <br />
            <br />
            Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="FANname" runat="server"></asp:TextBox>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Name Required" ControlToValidate="FANname" Font-Names="Bahnschrift SemiBold Condensed" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            Username:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; <asp:TextBox ID="FANuser" runat="server"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="FANuser" ErrorMessage="Username Required" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            Password:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; <asp:TextBox ID="FANpass" runat="server" TextMode="Password"></asp:TextBox>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="FANpass" ErrorMessage="Password Required" ForeColor="Red"></asp:RequiredFieldValidator>
             <br />
            National ID number :<asp:TextBox ID="FANnational" runat="server"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;
              <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="FANnational" ErrorMessage="National ID Number Required" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            Phone Number: <asp:TextBox ID="FANphone" runat="server" TextMode="Phone"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="FANphone" ErrorMessage="Phone Number Required" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            Birthdate: <asp:TextBox ID="FANbirthdate" runat="server" TextMode="DateTimeLocal"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="FANbirthdate" ErrorMessage="Birthdate Required" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            Address: <asp:TextBox ID="FANaddress" runat="server"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="FANaddress" ErrorMessage="Address Required" ForeColor="Red"></asp:RequiredFieldValidator>
              <br />

            <asp:Button ID="Button2" OnClick="FANreg" runat="server" Text="SUBMIT" />
            <br />


            <br><br><br><br><br><br><br><br><br>
            <br><br><br><br><br><br><br><br><br>
            <br><br><br><br><br><br><br><br><br>
            <br><br>
        </div>
        </div>
    </form>
</body>
</html>
