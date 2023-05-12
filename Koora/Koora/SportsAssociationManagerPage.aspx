<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SportsAssociationManagerPage.aspx.cs" Inherits="Koora.SportsAssociationManagerPage" %>

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
             <div style ="height:fit-content">
        <div class ="backimg">
            <h1>Sports Association Manager Page</h1>
            ADD NEW MATCH =&gt; HostClub Name

     

            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
&nbsp;GuestClub Name
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
&nbsp;start time
            <asp:TextBox ID="TextBox3" runat="server" TextMode="DateTimeLocal"></asp:TextBox>
&nbsp;end time
            <asp:TextBox ID="TextBox4" runat="server" TextMode="DateTimeLocal"></asp:TextBox>
&nbsp;<asp:Button ID="Button1" runat="server" onclick="addMatch" Text="ADD" style="height: 35px" />
&nbsp;&nbsp;

            <br>
            DELETE MATCH =&gt; HostClub Name
            <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
&nbsp;GuestClub Name
            <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
&nbsp;start time
            <asp:TextBox ID="TextBox7" runat="server" TextMode="DateTimeLocal"></asp:TextBox>
&nbsp;end time
            <asp:TextBox ID="TextBox8" runat="server" TextMode="DateTimeLocal"></asp:TextBox>
&nbsp;<asp:Button ID="Button2" runat="server" onclick="deleteMatch" Text="DELETE" style="height: 35px" />
&nbsp;&nbsp;

            <br>
            <br />
            <br>
            <asp:Label ID="SuccessfullMessage" runat="server" Font-Bold="True" Font-Names="Britannic Bold" Font-Size="Medium" ForeColor="#00CC00"></asp:Label>
            <br />
            <asp:Label ID="WarningMessage" runat="server" Font-Bold="True" Font-Names="Britannic Bold" Font-Size="Medium" ForeColor="Red"></asp:Label>
            <br>
            <br>
            <br>
            -All Upcoming Matches:
            <asp:GridView ID="AllUpcomingMatches" runat="server" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField DataField="Host_Club" HeaderText="HostClub Name" />
                    <asp:BoundField DataField="Guest_Club" HeaderText="GuestClub Name" />
                    <asp:BoundField DataField="StartTime" HeaderText="Start Time" />
                    <asp:BoundField DataField="EndTime" HeaderText="End Time" />
                </Columns>
            </asp:GridView>

            <br>
            <br>
            <br>
            <br>

            -All Already Played Matches:
            <asp:GridView ID="AllPlayedMatches" runat="server" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField DataField="Host_Club" HeaderText="HostClub Name" />
                    <asp:BoundField DataField="Guest_Club" HeaderText="GuestClub Name" />
                    <asp:BoundField DataField="StartTime" HeaderText="Start Time" />
                    <asp:BoundField DataField="EndTime" HeaderText="End Time" />
                </Columns>
            </asp:GridView>

            
            <br>
            <br>
            <br>
            <br>


            -Clubs Never Played with each other:
              <asp:GridView ID="ClubsNeverPlayed" runat="server" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField DataField="FirstClubName" HeaderText="FirstClub Name" />
                    <asp:BoundField DataField="SecondClubName" HeaderText="SecondClub Name" />
                </Columns>
            </asp:GridView>

            <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br>
             <br> <br> <br> <br> <br> <br> <br>

        </div>
        </div>
    </form>
</body>
</html>
