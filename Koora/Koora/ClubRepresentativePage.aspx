<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ClubRepresentativePage.aspx.cs" Inherits="Koora.ClubRepresentativePage" %>

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
                <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Log Out" />
            </h1>
        <div style="height:fit-content">
        <div class="backimg">
            <h1>Club Representative Page</h1>
            -ALL RELATED INFORMATION OF THE CLUB YOU ARE REPRESENTING: 
            <br>
            <br>
            ClubID :<asp:Label ID="Label1" runat="server" Text="Label" ForeColor="#996600"></asp:Label>
            <br>
            Club Name:<asp:Label ID="Label2" runat="server" Text="Label" ForeColor="#996600"></asp:Label>
            <br>
            Club Location:<asp:Label ID="Label3" runat="server" Text="Label" ForeColor="#996600"></asp:Label>
            <br>
            <br>

            -Upcoming Matches:
            <asp:GridView ID="UpcominMatches" runat="server" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField DataField="Host" HeaderText="Host Club Name" />
                    <asp:BoundField DataField="Guest" HeaderText="Guest Club Name" />
                    <asp:BoundField DataField="StartTime" HeaderText="Start Time" />
                    <asp:BoundField DataField="EndTime" HeaderText="End Time" />
                    <asp:BoundField DataField="StadiumName" HeaderText="Stadium Name" />
                </Columns>
            </asp:GridView>

            <br>
            <br>
            -All available stadiums starting from 
            <asp:TextBox ID="TextBox3" runat="server" TextMode="DateTimeLocal" ></asp:TextBox>
            <asp:Button ID="GetStadiumsBtn" runat="server" Text="SHOW" OnClick="GetStadiumsBtn_Click" />

            <asp:GridView ID="AvailableStadiums" runat="server" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField DataField="Name" HeaderText="Stadium Name" />
                    <asp:BoundField DataField="Capacity" HeaderText="Capacity" />
                    <asp:BoundField DataField="Location" HeaderText="Location" />
                </Columns>
            </asp:GridView>

            <br>
            <br>
            <br>
            <br>

            -SEND REQUEST TO HOST A MATCH: Stadium Name <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            Start Time<asp:TextBox ID="TextBox2" runat="server" TextMode="DateTimeLocal"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" Text="SEND REQUEST" OnClick="SendRequestBtn" />

            <br />
                        <asp:Label ID="SuccessfullMessage" runat="server" Font-Bold="True" Font-Names="Britannic Bold" Font-Size="Medium" ForeColor="#00CC00"></asp:Label>
            <br />
            <asp:Label ID="WarningMessage" runat="server" Font-Bold="True" Font-Names="Britannic Bold" Font-Size="Medium" ForeColor="Red"></asp:Label>
        
            <br><br><br><br><br><br><br>
            <br><br><br><br><br><br><br><br>
        </div>
        </div>
    </form>
</body>
</html>
