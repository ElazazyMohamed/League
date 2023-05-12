using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Koora
{
    public partial class FanPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Milestone_2;Integrated Security=True";
            SqlConnection conn = new SqlConnection(connStr);

            string username = Session["user"].ToString();
            NAME.Text = ("Hello " + username);

            SqlCommand faninfo = new SqlCommand("faninfo", conn);
            faninfo.CommandType = CommandType.StoredProcedure;

            faninfo.Parameters.Add(new SqlParameter("user", username));
            SqlParameter status = faninfo.Parameters.Add("@status", SqlDbType.VarChar,20);

            status.Direction = ParameterDirection.Output;
            conn.Open();
            faninfo.ExecuteNonQuery();
            conn.Close();

            STATUS.Text = status.Value.ToString();
            if (status.Value.ToString() == "Blocked")
            {
                STATUS.ForeColor = Color.Red;
            }
            else
            {
                STATUS.ForeColor = Color.Green;
            }





        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void SendRequestBtn(object sender, EventArgs e)
        {
            string connStr = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Milestone_2;Integrated Security=True";
            SqlConnection conn = new SqlConnection(connStr);


            string username = Session["user"].ToString();

            if(TextBox2.Text == "")
            {
                WarningMessage.Text = "Pleas enter a date in the required field";
                SuccessfullMessage.Text = "";
            }
            else
            {
                

                SqlCommand generate = new SqlCommand("select * from dbo.availableMatchesToAttend(@datetime,@user)", conn);
                generate.Parameters.AddWithValue("@user", username);
                generate.Parameters.AddWithValue("@datetime", DateTime.Parse(TextBox2.Text));
                SqlDataAdapter sda = new SqlDataAdapter(generate);
                DataTable dtb1 = new DataTable();
                sda.Fill(dtb1);
                GridView1.DataSource = dtb1;
                GridView1.DataBind();


            }





        }

        protected void PurchaseEvent(object sender, EventArgs e)
        {

            if (STATUS.Text == "Blocked")
            {
                WarningMessage.Text = "Your Account is Temporarily Blocked please Contact an admin for further enquiries";
                SuccessfullMessage.Text = "";
            }

            else
            {

                int mid = int.Parse((sender as LinkButton).CommandArgument);
                string connStr = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Milestone_2;Integrated Security=True";
                SqlConnection conn = new SqlConnection(connStr);
                string username = Session["user"].ToString();


                SqlCommand checkticket = new SqlCommand("checkmatchpurchase", conn);
                checkticket.CommandType = CommandType.StoredProcedure;

                checkticket.Parameters.AddWithValue("@matchid", mid);
                checkticket.Parameters.AddWithValue("@user", username);
                SqlParameter found = checkticket.Parameters.Add("@found", SqlDbType.Int);
                found.Direction = ParameterDirection.Output;

                conn.Open();
                checkticket.ExecuteNonQuery();
                conn.Close();

                if (found.Value.ToString() == "1")
                {
                    WarningMessage.Text = "You Already Purchased a ticket for this match Before !";
                    SuccessfullMessage.Text = "";
                }

                else
                {


                    SqlCommand addt = new SqlCommand("purchaseticket2", conn);
                    addt.CommandType = CommandType.StoredProcedure;

                    addt.Parameters.AddWithValue("@user", username);
                    addt.Parameters.AddWithValue("@mid", mid);

                    conn.Open();
                    addt.ExecuteNonQuery();
                    conn.Close();

                    SuccessfullMessage.Text = "Ticket Purchase Successfully";
                    WarningMessage.Text = "";

                    SendRequestBtn(sender, e);
                    Page_Load(sender, e);

                }
            }
        }
    }
}