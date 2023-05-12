using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace Koora
{
    public partial class systemAdminPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string username = Session["user"].ToString();
            NAME.Text = ("Hello " + username);
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }


        protected void AddClubBtn(object sender, EventArgs e)
        {

            if (TextBox1.Text == "" || TextBox2.Text == "")
            {
                Response.Write("Club name and Club location is Required to add the club !!!");
            }
            else
            {
                string connStr = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Milestone_2;Integrated Security=True";
                SqlConnection conn = new SqlConnection(connStr);


                SqlCommand CLUBinsert = new SqlCommand("addClub", conn);
                CLUBinsert.CommandType = CommandType.StoredProcedure;

                SqlCommand checkclubproc = new SqlCommand("checkClub", conn);
                checkclubproc.CommandType = CommandType.StoredProcedure;


                string addclubname = TextBox1.Text;
                string addclublocation = TextBox2.Text;

                checkclubproc.Parameters.Add(new SqlParameter("clubname", addclubname));
                SqlParameter foundmatch = checkclubproc.Parameters.Add("@found", SqlDbType.Int);
                foundmatch.Direction = ParameterDirection.Output;



                conn.Open();
                checkclubproc.ExecuteNonQuery();
                conn.Close();


                if (foundmatch.Value.ToString() == "1")
                {
                    Response.Write("Club already exists, choose another match name");
                }
                else
                {
                    CLUBinsert.Parameters.Add(new SqlParameter("clubname", addclubname));
                    CLUBinsert.Parameters.Add(new SqlParameter("location", addclublocation));

                    conn.Open();
                    CLUBinsert.ExecuteNonQuery();
                    conn.Close();

                    Response.Write("ALf mabrook club is added");
                }
            }

        }

        protected void DeleteClubBtn(object sender, EventArgs e)
        {
            if (TextBox3.Text == "")
            {
                Response.Write("Club name is Required to delete the club !!!");
            }
            else
            {
                string connStr = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Milestone_2;Integrated Security=True";
                SqlConnection conn = new SqlConnection(connStr);


                SqlCommand CLUBdelete = new SqlCommand("deleteClub", conn);
                CLUBdelete.CommandType = CommandType.StoredProcedure;

                SqlCommand checkclubproc = new SqlCommand("checkClub", conn);
                checkclubproc.CommandType = CommandType.StoredProcedure;


                string deleteclubname = TextBox3.Text;


                checkclubproc.Parameters.Add(new SqlParameter("clubname", deleteclubname));
                SqlParameter foundmatch = checkclubproc.Parameters.Add("@found", SqlDbType.Int);
                foundmatch.Direction = ParameterDirection.Output;



                conn.Open();
                checkclubproc.ExecuteNonQuery();
                conn.Close();


                if (foundmatch.Value.ToString() == "0")
                {
                    Response.Write("Club does not exist !!!");
                }
                else
                {
                    CLUBdelete.Parameters.Add(new SqlParameter("clubname", deleteclubname));


                    conn.Open();
                    CLUBdelete.ExecuteNonQuery();
                    conn.Close();

                    Response.Write("ALf mabrook club is deleted");
                }
            }


        }

        protected void AddStadiumBtn(object sender, EventArgs e)
        {
            if (TextBox4.Text == "" || TextBox5.Text == "" || TextBox6.Text == "")
            {
                Response.Write("Stadium name, location, and Capacity is Required to add the satadium  !!!");
            }
            else
            {
                string connStr = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Milestone_2;Integrated Security=True";
                SqlConnection conn = new SqlConnection(connStr);


                SqlCommand STADIUMinsert = new SqlCommand("addStadium", conn);
                STADIUMinsert.CommandType = CommandType.StoredProcedure;

                SqlCommand checkstadiumproc = new SqlCommand("checkStadium", conn);
                checkstadiumproc.CommandType = CommandType.StoredProcedure;


                string addstadiumname = TextBox4.Text;
                string addstadiumlocation = TextBox5.Text;
                string addstadiumcapacity = TextBox6.Text;


                checkstadiumproc.Parameters.Add(new SqlParameter("stadiumname", addstadiumname));
                SqlParameter foundstadium = checkstadiumproc.Parameters.Add("@found", SqlDbType.Int);
                foundstadium.Direction = ParameterDirection.Output;



                conn.Open();
                checkstadiumproc.ExecuteNonQuery();
                conn.Close();


                if (foundstadium.Value.ToString() == "1")
                {
                    Response.Write("Club already exists, choose another match name");
                }
                else
                {
                    STADIUMinsert.Parameters.Add(new SqlParameter("stadiumname", addstadiumname));
                    STADIUMinsert.Parameters.Add(new SqlParameter("location", addstadiumlocation));
                    STADIUMinsert.Parameters.Add(new SqlParameter("capacity", addstadiumcapacity));

                    conn.Open();
                    STADIUMinsert.ExecuteNonQuery();
                    conn.Close();

                    Response.Write("ALf mabrook stadium is added");
                }
            }


        }

        protected void DeleteStadiumBtn(object sender, EventArgs e)
        {
            if (TextBox7.Text == "")
            {
                Response.Write("Stadium name is Required to delete the stadium !!!");
            }
            else
            {
                string connStr = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Milestone_2;Integrated Security=True";
                SqlConnection conn = new SqlConnection(connStr);


                SqlCommand STADIUMdelete = new SqlCommand("deleteStadium", conn);
                STADIUMdelete.CommandType = CommandType.StoredProcedure;

                SqlCommand checkstadiumproc = new SqlCommand("checkStadium", conn);
                checkstadiumproc.CommandType = CommandType.StoredProcedure;


                string deletestadiumname = TextBox7.Text;


                checkstadiumproc.Parameters.Add(new SqlParameter("stadiumname", deletestadiumname));
                SqlParameter foundstadium = checkstadiumproc.Parameters.Add("@found", SqlDbType.Int);
                foundstadium.Direction = ParameterDirection.Output;



                conn.Open();
                checkstadiumproc.ExecuteNonQuery();
                conn.Close();


                if (foundstadium.Value.ToString() == "0")
                {
                    Response.Write("Stadium does not exist !!!");
                }
                else
                {
                    STADIUMdelete.Parameters.Add(new SqlParameter("stadiumname", deletestadiumname));


                    conn.Open();
                    STADIUMdelete.ExecuteNonQuery();
                    conn.Close();

                    Response.Write("ALf mabrook stadium is deleted");
                }
            }



        }

        protected void BlockFanBtn(object sender, EventArgs e)
        {
            if (TextBox8.Text == "")
            {
                Response.Write("Fan nationalID is Required to block the fan !!!");
            }
            else
            {
                string connStr = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Milestone_2;Integrated Security=True";
                SqlConnection conn = new SqlConnection(connStr);


                SqlCommand BLOCKfan = new SqlCommand("blockFan", conn);
                BLOCKfan.CommandType = CommandType.StoredProcedure;

                SqlCommand checkfanproc = new SqlCommand("checkFan", conn);
                checkfanproc.CommandType = CommandType.StoredProcedure;


                string blockfanID = TextBox8.Text;


                checkfanproc.Parameters.Add(new SqlParameter("fanid", blockfanID));
                SqlParameter foundfan = checkfanproc.Parameters.Add("@found", SqlDbType.Int);
                foundfan.Direction = ParameterDirection.Output;



                conn.Open();
                checkfanproc.ExecuteNonQuery();
                conn.Close();


                if (foundfan.Value.ToString() == "0")
                {
                    Response.Write("FanID does not exist !!!");
                }
                else
                {
                    BLOCKfan.Parameters.Add(new SqlParameter("nationalid", blockfanID));


                    conn.Open();
                    BLOCKfan.ExecuteNonQuery();
                    conn.Close();

                    Response.Write("ALf mabrook fan is blocked");
                }

            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}