using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Koora
{
    public partial class RegSportsAssociationManager : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }



        protected void SAMreg(object sender, EventArgs e)
        {





            string connStr = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Milestone_2;Integrated Security=True";
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand checkuserproc = new SqlCommand("checkuser", conn);
            checkuserproc.CommandType = CommandType.StoredProcedure;

            SqlCommand SAMinsert = new SqlCommand("addAssociationManager", conn);
            SAMinsert.CommandType = CommandType.StoredProcedure;





            string name = SAMname.Text;
            string username = SAMuser.Text;
            string password = SAMpass.Text;

            checkuserproc.Parameters.Add(new SqlParameter("username", username));
            SqlParameter found = checkuserproc.Parameters.Add("@found", SqlDbType.Int);
            found.Direction = ParameterDirection.Output;

            conn.Open();
            checkuserproc.ExecuteNonQuery();
            conn.Close();


            if (name == "" || username == ""|| password == "")
            {
                Response.Write("ERROR !! ALL Fields MUST be entered");
            }
            else if(found.Value.ToString() == "1")
            {
                Response.Write("Username already exists, choose another Username");

            }
            else
            {
                SAMinsert.Parameters.Add(new SqlParameter("name", name));
                SAMinsert.Parameters.Add(new SqlParameter("username", username));
                SAMinsert.Parameters.Add(new SqlParameter("password", password));
                conn.Open();
                SAMinsert.ExecuteNonQuery();
                conn.Close();


                Response.Write("ALf mabrook ba2eet SAM");
            }


        }
    }
}