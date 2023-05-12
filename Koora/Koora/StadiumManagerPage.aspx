<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StadiumManagerPage.aspx.cs" Inherits="Koora.StadiumManagerPage" %>

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
              <h1>Stadium Manager Page</h1>
            ALL RELATED INFORMATION OF THE STADIUM YOU ARE MANAGING: 
            <br>
            <br>
            StadiumID :<asp:Label ID="Label1" runat="server" Text="Label" ForeColor="#996600"></asp:Label>
            <br>
            Stadium Name:<asp:Label ID="Label2" runat="server" Text="Label" ForeColor="#996600"></asp:Label>
            <br>
            Stadium Capacity:<asp:Label ID="Label3" runat="server" Text="Label" ForeColor="#996600"></asp:Label>
            <br>
            Stadium Location:<asp:Label ID="Label4" runat="server" Text="Label" ForeColor="#996600"></asp:Label>
            <br>
            Stadium Status:<asp:Label ID="Label5" runat="server" Text="Label" ForeColor="#996600"></asp:Label>


            <br>
            <br>
            <br>
            <br>
            
            -All Received Requests:
            <br>
            <br>
             <asp:GridView ID="AllRequests" runat="server" AutoGenerateColumns="false" >
                <Columns>
                    <asp:BoundField DataField="ClubRepresentative" HeaderText="Name of the Sending Club Representative" />
                    <asp:BoundField DataField="HostClub" HeaderText="Requesting Host CLub Name" />
                    <asp:BoundField DataField="GuestClub" HeaderText="Guest Club Name" />
                    <asp:BoundField DataField="StartTime" HeaderText="Start Time" />
                    <asp:BoundField DataField="EndTime" HeaderText="End Time" />
                    <asp:BoundField DataField="Status" HeaderText="Status" />


     

                </Columns>
            </asp:GridView>



              <br />
              <br />                        <asp:Label ID="SuccessfullMessage" runat="server" Font-Bold="True" Font-Names="Britannic Bold" Font-Size="Medium" ForeColor="#00CC00"></asp:Label>
            <br />
              <br />
              <br />            -Unhandled Requests:
            <br>
            <br>
             <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" >
                <Columns>
                    <asp:BoundField DataField="ClubRepresentative" HeaderText="Name of the Sending Club Representative" />
                    <asp:BoundField DataField="HostClub" HeaderText="Requesting Host CLub Name" />
                    <asp:BoundField DataField="GuestClub" HeaderText="Guest Club Name" />
                    <asp:BoundField DataField="StartTime" HeaderText="Start Time" />
                    <asp:BoundField DataField="EndTime" HeaderText="End Time" />
                    <asp:BoundField DataField="Status" HeaderText="Status" />


                    <asp:TemplateField>
                        <ItemTemplate>

                            <asp:LinkButton ID="Accept" Text="Accept" runat="server" CommandArgument='<%# Eval("HostRequestID") %>' OnClick="AcceptEvent" >


                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>

                            <asp:LinkButton ID="Reject" Text="Reject" runat="server" CommandArgument='<%# Eval("HostRequestID") %>' OnClick="RejecttEvent" >


                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>
            </asp:GridView>
              <br />


            <br><br><br><br><br><br><br><br><br><br><br>
            <br><br><br><br><br><br><br><br><br>

        </div>
        </div>
    </form>
</body>
</html>
