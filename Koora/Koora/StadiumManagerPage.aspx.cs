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
    public partial class StadiumManagerPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Milestone_2;Integrated Security=True";
            SqlConnection conn = new SqlConnection(connStr);

            string username = Session["user"].ToString();
            NAME.Text = ("Hello "+username);


            SqlCommand stadiuminformationproc = new SqlCommand("stadiumInformation", conn);
            stadiuminformationproc.CommandType = CommandType.StoredProcedure;

            stadiuminformationproc.Parameters.Add(new SqlParameter("stadiummanager", username));
            SqlParameter stadiumid = stadiuminformationproc.Parameters.Add("@stadiumid", SqlDbType.Int);
            SqlParameter stadiumname = stadiuminformationproc.Parameters.Add("@stadiumname", SqlDbType.VarChar, 20);
            SqlParameter stadiumcapacity = stadiuminformationproc.Parameters.Add("@stadiumcapacity", SqlDbType.VarChar, 20);
            SqlParameter stadiumlocation = stadiuminformationproc.Parameters.Add("@stadiumlocation", SqlDbType.VarChar, 20);
            SqlParameter stadiumstatus = stadiuminformationproc.Parameters.Add("@stadiumstatus", SqlDbType.Int);

            conn.Open();
            SqlCommand allrequests = new SqlCommand("select * from dbo.allRequests(@stadiummanager)", conn);
            allrequests.Parameters.AddWithValue("@stadiummanager", username);
            SqlDataAdapter sda = new SqlDataAdapter(allrequests);
            DataTable dtb1 = new DataTable();
            sda.Fill(dtb1);
            AllRequests.DataSource = dtb1;
            AllRequests.DataBind();
            conn.Close();


            conn.Open();
            SqlCommand unrequests = new SqlCommand("select * from dbo.allPendingRequests(@stadiummanager)", conn);
            unrequests.Parameters.AddWithValue("@stadiummanager", username);
            SqlDataAdapter sda2 = new SqlDataAdapter(unrequests);
            DataTable dtb2 = new DataTable();
            sda2.Fill(dtb2);
            GridView1.DataSource = dtb2;
            GridView1.DataBind();
            conn.Close();

            stadiumid.Direction = ParameterDirection.Output;
            stadiumname.Direction = ParameterDirection.Output;
            stadiumcapacity.Direction = ParameterDirection.Output;
            stadiumlocation.Direction = ParameterDirection.Output;
            stadiumstatus.Direction = ParameterDirection.Output;

            conn.Open();
            stadiuminformationproc.ExecuteNonQuery();
            conn.Close();


            Label1.Text = stadiumid.Value.ToString();
            Label2.Text = stadiumname.Value.ToString();
            Label3.Text = stadiumcapacity.Value.ToString();
            Label4.Text = stadiumlocation.Value.ToString();
            if (stadiumstatus.Value.ToString() == "0")
            {
                Label5.Text = "unavailable";
            }
            else if (stadiumstatus.Value.ToString() == "1")
            {
                Label5.Text = "available";
            }



        }

        protected void AcceptEvent(object sender, EventArgs e)
        {
            string connStr = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Milestone_2;Integrated Security=True";
            SqlConnection conn = new SqlConnection(connStr);
            string username = Session["user"].ToString();


            int hrid = int.Parse((sender as LinkButton).CommandArgument);

            SqlCommand accept = new SqlCommand("acceptRequest2", conn);
            accept.CommandType = CommandType.StoredProcedure;

            accept.Parameters.AddWithValue("@id", hrid);
            accept.Parameters.AddWithValue("@smusername",username);

            conn.Open();
            accept.ExecuteNonQuery();
            conn.Close();

            SuccessfullMessage.Text = "Request Accepted Succesfully";


            SqlCommand stadcapacity = new SqlCommand("stadcapacity", conn);
            stadcapacity.CommandType = CommandType.StoredProcedure;

            stadcapacity.Parameters.AddWithValue("@hr", hrid);
            SqlParameter size = stadcapacity.Parameters.Add("@size",SqlDbType.Int);
            size.Direction= ParameterDirection.Output;
            conn.Open();
            stadcapacity.ExecuteNonQuery();
            conn.Close();

            int length = int.Parse(size.Value.ToString());
            SqlCommand addticket = new SqlCommand("addTicket2", conn);
            addticket.CommandType = CommandType.StoredProcedure;

            addticket.Parameters.AddWithValue("@hr", hrid);
          
            conn.Close();

              conn.Open();
            for (int i = 0; i < length; i++)
            {
                addticket.ExecuteNonQuery();

            }




            Page_Load(sender, e);


        }


        protected void RejecttEvent(object sender, EventArgs e)
        {
            int hrid = int.Parse((sender as LinkButton).CommandArgument);

            string connStr = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Milestone_2;Integrated Security=True";
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand reject = new SqlCommand("rejecttRequest2", conn);
            reject.CommandType = CommandType.StoredProcedure;

            reject.Parameters.AddWithValue("@id", hrid);

            conn.Open();
            reject.ExecuteNonQuery();
            conn.Close();

            SuccessfullMessage.Text = "Request Rejected Succesfully";

            Page_Load(sender, e);


        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}