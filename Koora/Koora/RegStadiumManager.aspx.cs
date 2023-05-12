using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace Koora
{
    public partial class RegStadiumManager : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SMreg(object sender, EventArgs e)
        {
            {
                string connStr = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Milestone_2;Integrated Security=True";
                SqlConnection conn = new SqlConnection(connStr);
                SqlCommand checkuserproc = new SqlCommand("checkuser", conn);
                checkuserproc.CommandType = CommandType.StoredProcedure;

                SqlCommand SMinsert = new SqlCommand("addStadiumManager", conn);
                SMinsert.CommandType = CommandType.StoredProcedure;

                SqlCommand checkstadiumproc = new SqlCommand("checkstadium", conn);
                checkstadiumproc.CommandType = CommandType.StoredProcedure;



                string name = SMname.Text;
                string username = SMuser.Text;
                string password = SMpass.Text;
                string stadiumname = SMstadium.Text;

                checkstadiumproc.Parameters.Add(new SqlParameter("stadiumname", stadiumname));
                SqlParameter foundstadium = checkstadiumproc.Parameters.Add("@found", SqlDbType.Int);
                foundstadium.Direction = ParameterDirection.Output;

                checkuserproc.Parameters.Add(new SqlParameter("username", username));
                SqlParameter founduser = checkuserproc.Parameters.Add("@found", SqlDbType.Int);
                founduser.Direction = ParameterDirection.Output;

                conn.Open();
                checkuserproc.ExecuteNonQuery();
                checkstadiumproc.ExecuteNonQuery();
                conn.Close();


                if (name == "" || username == "" || password == "" || stadiumname == "")
                {
                    Response.Write("ERROR !! ALL Fields MUST be entered");
                }
                else if (founduser.Value.ToString() == "1")
                {
                    Response.Write("Username already exists, choose another Username");
                }
                else if (foundstadium.Value.ToString() == "0")
                {
                    Response.Write("Error !! Stadium Name Doesn't Exist");
                }
                else
                {
                    SMinsert.Parameters.Add(new SqlParameter("name", name));
                    SMinsert.Parameters.Add(new SqlParameter("username", username));
                    SMinsert.Parameters.Add(new SqlParameter("password", password));
                    SMinsert.Parameters.Add(new SqlParameter("stadiumname", stadiumname));

                    conn.Open();
                    SMinsert.ExecuteNonQuery();
                    conn.Close();


                    Response.Write("ALf mabrook ba2eet SM");
                }
            }
        }
    }
}