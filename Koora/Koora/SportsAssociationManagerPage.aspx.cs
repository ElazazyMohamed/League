using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Koora
{
    public partial class SportsAssociationManagerPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Milestone_2;Integrated Security=True";
            SqlConnection conn = new SqlConnection(connStr);

            string username = Session["user"].ToString();
            NAME.Text = ("Hello " + username);


            conn.Open();
            SqlCommand generatetest = new SqlCommand("select * from allUpcomingMatches()", conn);
            SqlDataAdapter sda = new SqlDataAdapter(generatetest);
            DataTable dtb1 = new DataTable();
            sda.Fill(dtb1);
            AllUpcomingMatches.DataSource = dtb1;
            AllUpcomingMatches.DataBind();
            conn.Close();

            conn.Open();
            SqlCommand generatetest1 = new SqlCommand("select * from allPlayedMatches()", conn);
            SqlDataAdapter sda2 = new SqlDataAdapter(generatetest1);
            DataTable dtb2 = new DataTable();
            sda2.Fill(dtb2);
            AllPlayedMatches.DataSource = dtb2;
            AllPlayedMatches.DataBind();
            conn.Close();


            conn.Open();
            SqlCommand generatetest2 = new SqlCommand("select * from clubsNeverMatched", conn);
            SqlDataAdapter sda3 = new SqlDataAdapter(generatetest2);
            DataTable dtb3 = new DataTable();
            sda3.Fill(dtb3);
            ClubsNeverPlayed.DataSource = dtb3;
            ClubsNeverPlayed.DataBind();

            conn.Close();






        }

        protected void addMatch(object sender, EventArgs e) 

                
        {
            
            if (TextBox1.Text == "" || TextBox2.Text == "" || TextBox3.Text == "" || TextBox4.Text == "")
            {
                WarningMessage.Text = ("HostClub name, GuestClub Name, Start Time and End time are Required to add the match !!!");
                SuccessfullMessage.Text = "";
            }
            else
            {
                if(TextBox1.Text == TextBox2.Text)
                {
                    WarningMessage.Text = ("Cannot add a match between the same club !!!!");
                    SuccessfullMessage.Text = "";
                }
                else
                {
                    string connStr = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Milestone_2;Integrated Security=True";
                    SqlConnection conn = new SqlConnection(connStr);

                    SqlCommand MATCHadd = new SqlCommand("addNewMatch", conn);
                    MATCHadd.CommandType = CommandType.StoredProcedure;

                    SqlCommand CLUBcheck1 = new SqlCommand("checkClub", conn);
                    CLUBcheck1.CommandType = CommandType.StoredProcedure;

                    SqlCommand CLUBcheck2 = new SqlCommand("checkClub", conn);
                    CLUBcheck2.CommandType = CommandType.StoredProcedure;

                    string hostname = TextBox1.Text;
                    string guestname = TextBox2.Text;
                    DateTime starttime = DateTime.Parse(TextBox3.Text);
                    DateTime endtime = DateTime.Parse(TextBox4.Text);

                    CLUBcheck1.Parameters.Add(new SqlParameter("clubname", hostname));
                    SqlParameter foundclub1 = CLUBcheck1.Parameters.Add("@found", SqlDbType.Int);
                    foundclub1.Direction = ParameterDirection.Output;

                    CLUBcheck2.Parameters.Add(new SqlParameter("clubname", guestname));
                    SqlParameter foundclub2 = CLUBcheck2.Parameters.Add("@found", SqlDbType.Int);
                    foundclub2.Direction = ParameterDirection.Output;

                    conn.Open();
                    CLUBcheck1.ExecuteNonQuery();
                    CLUBcheck2.ExecuteNonQuery();
                    conn.Close();


                    if(foundclub1.Value.ToString() != "1" || foundclub2.Value.ToString() != "1")
                    {
                        if(foundclub1.Value.ToString() != "1")
                        {
                            WarningMessage.Text = ("HostClub does not exists");
                            SuccessfullMessage.Text = "";
                        }
                        else
                        {
                            WarningMessage.Text = ("GuestClub does not exists");
                            SuccessfullMessage.Text = "";
                        }
                    }
                    else
                    {
                        MATCHadd.Parameters.Add(new SqlParameter("hostclub", hostname));
                        MATCHadd.Parameters.Add(new SqlParameter("guestclub", guestname));
                        MATCHadd.Parameters.Add(new SqlParameter("starttime", starttime));
                        MATCHadd.Parameters.Add(new SqlParameter("endtime", endtime));

                        conn.Open();
                        MATCHadd.ExecuteNonQuery();
                        conn.Close();
                        
                        SuccessfullMessage.Text = "ALf mabrook match is added";
                        WarningMessage.Text = "";

                    }
                }
            }

            Page_Load(sender, e);
        }

        protected void deleteMatch(object sender, EventArgs e)
        {
                
            if (TextBox5.Text == "" || TextBox6.Text == "" || TextBox7.Text == "" || TextBox8.Text == "")
            {
                WarningMessage.Text= ("HostClub name, GuestClub Name, Start Time and End time are Required to delete the match !!!");
                SuccessfullMessage.Text = "";
            }
            else
            {
                string connStr = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Milestone_2;Integrated Security=True";
                SqlConnection conn = new SqlConnection(connStr);

                SqlCommand MATCHdelete = new SqlCommand("deleteMatch", conn);
                MATCHdelete.CommandType = CommandType.StoredProcedure;

                SqlCommand CLUBcheck1 = new SqlCommand("checkClub", conn);
                CLUBcheck1.CommandType = CommandType.StoredProcedure;

                SqlCommand CLUBcheck2 = new SqlCommand("checkClub", conn);
                CLUBcheck2.CommandType = CommandType.StoredProcedure;

                SqlCommand MATCHcheck = new SqlCommand("checkMatch", conn);
                MATCHcheck.CommandType = CommandType.StoredProcedure;

                string hostname = TextBox5.Text;
                string guestname = TextBox6.Text;
                DateTime starttime = DateTime.Parse(TextBox7.Text);
                DateTime endtime = DateTime.Parse(TextBox8.Text);

                CLUBcheck1.Parameters.Add(new SqlParameter("clubname", hostname));
                SqlParameter foundclub1 = CLUBcheck1.Parameters.Add("@found", SqlDbType.Int);
                foundclub1.Direction = ParameterDirection.Output;

                CLUBcheck2.Parameters.Add(new SqlParameter("clubname", guestname));
                SqlParameter foundclub2 = CLUBcheck2.Parameters.Add("@found", SqlDbType.Int);
                foundclub2.Direction = ParameterDirection.Output;

                conn.Open();
                CLUBcheck1.ExecuteNonQuery();
                CLUBcheck2.ExecuteNonQuery();
                conn.Close();

                if(foundclub1.Value.ToString() != "1" || foundclub2.Value.ToString() != "1")
                {
                    if(foundclub1.Value.ToString() != "1")
                    {
                        WarningMessage.Text = ("There is no such a HostClub");
                        SuccessfullMessage.Text = "";
                    }
                    else
                    {
                        WarningMessage.Text = ("There is no such a GuestClub");
                        SuccessfullMessage.Text = "";
                    }
                }
                else
                {

                    MATCHcheck.Parameters.Add(new SqlParameter("hostname", hostname));
                    MATCHcheck.Parameters.Add(new SqlParameter("guestname", guestname));
                    MATCHcheck.Parameters.Add(new SqlParameter("starttime", starttime));
                    MATCHcheck.Parameters.Add(new SqlParameter("endtime", endtime));
                    SqlParameter foundmatch = MATCHcheck.Parameters.Add("@found", SqlDbType.Int);
                    foundmatch.Direction = ParameterDirection.Output;

                    conn.Open();
                    MATCHcheck.ExecuteNonQuery();
                    conn.Close();

                    if (foundmatch.Value.ToString() != "1")
                    {

                        WarningMessage.Text = ("There is no such a match");
                        SuccessfullMessage.Text = "";
                    }
                    else
                    {
                        MATCHdelete.Parameters.Add(new SqlParameter("hostclub", hostname));
                        MATCHdelete.Parameters.Add(new SqlParameter("guestclub", guestname));
                        MATCHdelete.Parameters.Add(new SqlParameter("starttime", starttime));
                        MATCHdelete.Parameters.Add(new SqlParameter("endtime", endtime));

                        conn.Open();
                        MATCHdelete.ExecuteNonQuery();
                        conn.Close();

                        SuccessfullMessage.Text = "Alf mabrook, you deleted the match";
                        WarningMessage.Text = "";

                    }
                }
            }
            Page_Load(sender, e);
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}