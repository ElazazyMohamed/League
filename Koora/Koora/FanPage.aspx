<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FanPage.aspx.cs" Inherits="Koora.FanPage" %>

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
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="STATUS" runat="server" Font-Names="Tw Cen MT Condensed" Font-Size="XX-Large"></asp:Label>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Log Out" />
            </h1>
        <div style="height:fit-content">
        <div class="backimg">
            <h1>Fan Page</h1>

            <br />
            <br />
            <br />            -View available matches starting from:&nbsp; Start Time&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="TextBox2" runat="server" TextMode="DateTimeLocal"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button1" runat="server" Text="SEND REQUEST" OnClick="SendRequestBtn" />
            <br />
            <br />
            <br /><asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false"  >
                <Columns>
                    <asp:BoundField DataField="HostClubName" HeaderText="Host Club Name" />
                    <asp:BoundField DataField="GuestClubName" HeaderText="Guest Club Name" />
                    <asp:BoundField DataField="StadiumName" HeaderText="Stadium Name" />
                    <asp:BoundField DataField="StadiumLocation" HeaderText="Stadium Location" />

                    <asp:TemplateField>
                        <ItemTemplate>

                            <asp:LinkButton ID="purchase" Text="Purchase" runat="server" CommandArgument='<%# Eval("MatchID") %>' OnClick="PurchaseEvent" >


                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>
            </asp:GridView>
            <br />
            <br />

            <br /> <asp:Label ID="SuccessfullMessage" runat="server" Font-Bold="True" Font-Names="Britannic Bold" Font-Size="Medium" ForeColor="#00CC00"></asp:Label> <br />
            <asp:Label ID="WarningMessage" runat="server" Font-Bold="True" Font-Names="Britannic Bold" Font-Size="Medium" ForeColor="Red"></asp:Label>

            <br />

            <br><br><br><br><br><br><br><br><br><br><br><br><br><br>
            <br><br><br><br><br><br><br><br><br><br><br>
        </div>
        </div>
    </form>
</body>
</html>
