using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Drawing.Printing;

namespace Koora
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void login(object sender, EventArgs e)
        {
            string connStr = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Milestone_2;Integrated Security=True";
            SqlConnection conn = new SqlConnection(connStr);

            if (TextBox1.Text == "" || TextBox2.Text == "")
                WarningMessage.Text = "Username and Password are Required to LOG IN !! ";
            else
            {
                string username = TextBox1.Text;
                string password = TextBox2.Text;

                SqlCommand loginproc = new SqlCommand("userLogin", conn);
                loginproc.CommandType = CommandType.StoredProcedure;
                loginproc.Parameters.Add(new SqlParameter("username", username));
                loginproc.Parameters.Add(new SqlParameter("password", password));

                SqlParameter success = loginproc.Parameters.Add("@success", SqlDbType.Int);

                success.Direction = ParameterDirection.Output;


                SqlCommand checkProfileproc = new SqlCommand("whichProfile", conn);
                checkProfileproc.CommandType = CommandType.StoredProcedure;
                checkProfileproc.Parameters.Add(new SqlParameter("username", username));
                SqlParameter profileType = checkProfileproc.Parameters.Add("@profileType", SqlDbType.Int);
                profileType.Direction = ParameterDirection.Output;


                conn.Open();
                loginproc.ExecuteNonQuery();
                checkProfileproc.ExecuteNonQuery();

                conn.Close();

                if (success.Value.ToString() == "1")
                {
                    Session["user"] = username;
                    if (profileType.Value.ToString() == "1")
                        Response.Redirect("SystemAdminPage.aspx");
                    else if (profileType.Value.ToString() == "2")
                        Response.Redirect("SportsAssociationManagerPage.aspx");
                    else if (profileType.Value.ToString() == "3")
                        Response.Redirect("ClubRepresentativePage.aspx");
                    else if (profileType.Value.ToString() == "4")
                        Response.Redirect("StadiumManagerPage.aspx");
                    else if (profileType.Value.ToString() == "5")
                        Response.Redirect("FanPage.aspx");


                }
                else
                    WarningMessage.Text = "User NOT found, either the username or password is incorrect or you need to create new account !!";
            }
        }
    }
}