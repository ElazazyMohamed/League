<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SystemAdminPage.aspx.cs" Inherits="Koora.systemAdminPage" %>

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
       
                        <h1>
                <asp:Label ID="NAME" runat="server" Font-Names="Tw Cen MT Condensed" Font-Size="XX-Large"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button6" runat="server" OnClick="Button3_Click" Text="Log Out" />
            </h1>
         <div style="height:fit-content">
        <div class="backimg">
            <h1> System Admin Page </h1>
            ADD NEW CLUB => ClubName
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            Location
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" Text="ADD" OnClick="AddClubBtn" />   
            <br>
            <br>
            <br> 
            <br>
            <br>

        DELETE CLUB => ClubName
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            <asp:Button ID="Button2" runat="server" Text="DELETE" OnClick="DeleteClubBtn" />
            <br>
            <br> 
            <br>
            <br>

            ADD NEW STADIUM =>Stadium Name
            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            Location
           <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
            Capacity
            <asp:TextBox ID="TextBox6" runat="server" TextMode="Number"></asp:TextBox>
            <asp:Button ID="Button3" runat="server" Text="ADD" OnClick="AddStadiumBtn" />

            <br>
            <br> 
            <br>
            <br>

            DELETE STADIUM => Stadium Name
            <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
            <asp:Button ID="Button4" runat="server" Text="DELETE" OnClick="DeleteStadiumBtn" />
            <br>
            <br> 
            <br>
            <br>

            BLOCK FAN => Fan NationalID
            <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
            <asp:Button ID="Button5" runat="server" Text="BLOCK" OnClick="BlockFanBtn" />
          
        
            <br> <br> <br> <br> <br> <br>
             <br> <br> <br> <br> <br> <br> <br> <br>
        
        </div>
        </div>
    </form>
</body>
</html>
