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
    public partial class ClubRepresentativePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Milestone_2;Integrated Security=True";
            SqlConnection conn = new SqlConnection(connStr);

            string username = Session["user"].ToString();
            NAME.Text = ("Hello " + username);

            SqlCommand clubinformationproc = new SqlCommand("clubInformation", conn);
            clubinformationproc.CommandType = CommandType.StoredProcedure;

            clubinformationproc.Parameters.Add(new SqlParameter("clubrepresentative", username));
            SqlParameter clubid = clubinformationproc.Parameters.Add("@clubid", SqlDbType.Int);
            SqlParameter clubname = clubinformationproc.Parameters.Add("@clubname", SqlDbType.VarChar,20);
            SqlParameter clublocation = clubinformationproc.Parameters.Add("@clublocation", SqlDbType.VarChar,20);

            clubid.Direction = ParameterDirection.Output;
            clubname.Direction = ParameterDirection.Output;
            clublocation.Direction = ParameterDirection.Output;



            conn.Open();
            clubinformationproc.ExecuteNonQuery();
            SqlCommand generatetest = new SqlCommand("select * from upcomingMatchesOfClub(@clubname)", conn);
            generatetest.Parameters.AddWithValue("@clubname", clubname.Value.ToString());
            SqlDataAdapter sda = new SqlDataAdapter(generatetest);
            DataTable dtb2 = new DataTable();
            sda.Fill(dtb2);
            UpcominMatches.DataSource = dtb2;
            UpcominMatches.DataBind();
            conn.Close();

          

            Label1.Text = clubid.Value.ToString();
            Label2.Text = clubname.Value.ToString();
            Label3.Text = clublocation.Value.ToString();

        }

        protected void SendRequestBtn(object sender, EventArgs e)
        {
            Page_Load(sender,e);

            if (TextBox1.Text == "" || TextBox2.Text == "")
            {
                SuccessfullMessage.Text = "";
                WarningMessage.Text = ("Stadium name and Start Time is Required to send the host request !!!");
            }
            else
            {
                string connStr = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Milestone_2;Integrated Security=True";
                SqlConnection conn = new SqlConnection(connStr);

                string username = Session["user"].ToString();

                SqlCommand sendrequestproc = new SqlCommand("addHostRequest", conn);
                sendrequestproc.CommandType = CommandType.StoredProcedure;

                SqlCommand checkstadiumproc = new SqlCommand("checkstadium", conn);
                checkstadiumproc.CommandType = CommandType.StoredProcedure;
                checkstadiumproc.Parameters.Add(new SqlParameter("stadiumname", TextBox1.Text));
                SqlParameter foundstadium = checkstadiumproc.Parameters.Add("@found", SqlDbType.Int);
                foundstadium.Direction = ParameterDirection.Output;

                conn.Open();
                checkstadiumproc.ExecuteNonQuery();
                conn.Close();
                if (foundstadium.Value.ToString() == "0")
                {

                    WarningMessage.Text = "Invalid Stadium Name !!";
                    SuccessfullMessage.Text = "";

                }
                else
                {
                    SqlCommand checkstadiumav = new SqlCommand("stadiumavailablehelper", conn);
                    checkstadiumav.CommandType = CommandType.StoredProcedure;
                    checkstadiumav.Parameters.Add(new SqlParameter("stname", TextBox1.Text));
                    checkstadiumav.Parameters.Add(new SqlParameter("starttime", DateTime.Parse(TextBox2.Text)));
                    SqlParameter foundstadium2 = checkstadiumav.Parameters.Add("@found", SqlDbType.Int);
                    foundstadium2.Direction = ParameterDirection.Output;

                    conn.Open();
                    checkstadiumav.ExecuteNonQuery();
                    conn.Close();

                    if (foundstadium2.Value.ToString() == "1")
                    {
                        WarningMessage.Text = "Stadium is NOT availabe at the specified time ";
                        SuccessfullMessage.Text = "";
                    }

                    else
                    {
                        SqlCommand helper = new SqlCommand("reqhelper", conn);
                        helper.CommandType = CommandType.StoredProcedure;
                        helper.Parameters.Add(new SqlParameter("crep", username));
                        helper.Parameters.Add(new SqlParameter("starttime", DateTime.Parse(TextBox2.Text)));
                        SqlParameter foundstadium3 = helper.Parameters.Add("@found", SqlDbType.Int);
                        foundstadium3.Direction = ParameterDirection.Output;

                        conn.Open();
                        helper.ExecuteNonQuery();
                        conn.Close();

                        if (foundstadium3.Value.ToString() == "0")
                        {
                            SuccessfullMessage.Text = "";
                            WarningMessage.Text = " Your request is invalid for one of 2 Reasons :" + "<br />" +
                                                    "        1-You don't have an upcoming match that you are hosting to send a request for " + "<br />" +
                                                    "        2- You have an upcoming match that you are hosting but with a starting time different than the time you want to send the request with";
                        }
                        else
                        {

                            SqlCommand helper2 = new SqlCommand("finalreqhelper", conn);
                            helper2.CommandType = CommandType.StoredProcedure;
                            helper2.Parameters.Add(new SqlParameter("crep", username));
                            helper2.Parameters.Add(new SqlParameter("starttime", DateTime.Parse(TextBox2.Text)));
                            SqlParameter foundstadium4 = helper2.Parameters.Add("@found", SqlDbType.Int);
                            foundstadium4.Direction = ParameterDirection.Output;

                            conn.Open();
                            helper2.ExecuteNonQuery();
                            conn.Close();
                            if (foundstadium4.Value.ToString() == "0")
                            {
                                WarningMessage.Text = "Request already Accepted by Stadium Manager";
                                SuccessfullMessage.Text = "";

                            }
                            else if (foundstadium4.Value.ToString() == "1")
                            {
                                WarningMessage.Text = "Request is still unhandled by the Stadium Manager, Please wait till a response is recieved ";
                                SuccessfullMessage.Text = "";
                            }
                            else
                            {

                                string stadiumname = TextBox1.Text;
                                DateTime starttime = DateTime.Parse(TextBox2.Text);
                                Response.Write(Label2.Text.ToString());
                                sendrequestproc.Parameters.Add(new SqlParameter("clubname", Label2.Text.ToString()));
                                sendrequestproc.Parameters.Add(new SqlParameter("stadiumname", stadiumname));
                                sendrequestproc.Parameters.Add(new SqlParameter("starttime", starttime));


                                conn.Open();
                                sendrequestproc.ExecuteNonQuery();
                                conn.Close();
                                SuccessfullMessage.Text = ("alf mabrook host request is sent");
                                WarningMessage.Text = "";
                            }
                        }
                    }
                }
            }
        }

        protected void GetStadiumsBtn_Click(object sender, EventArgs e)
        {

            string connStr = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Milestone_2;Integrated Security=True";
            SqlConnection conn = new SqlConnection(connStr);

            string username = Session["user"].ToString();

            DateTime certaindate = DateTime.Parse(TextBox3.Text);

            conn.Open();
            SqlCommand generatetest = new SqlCommand("select * from viewAvailableStadiumsOn(@starttime)", conn);
            generatetest.Parameters.AddWithValue("@starttime", certaindate);
            SqlDataAdapter sda = new SqlDataAdapter(generatetest);
            DataTable dtb1 = new DataTable();
            sda.Fill(dtb1);
            AvailableStadiums.DataSource = dtb1;
            AvailableStadiums.DataBind();
            conn.Close();
        }


        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}