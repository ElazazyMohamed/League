using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Runtime.Remoting.Metadata.W3cXsd2001;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Koora
{
    public partial class RegClubRepresentative : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CRreg(object sender, EventArgs e)
        {
            string connStr = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Milestone_2;Integrated Security=True";
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand checkuserproc = new SqlCommand("checkuser", conn);
            checkuserproc.CommandType = CommandType.StoredProcedure;

            SqlCommand CRinsert = new SqlCommand("addRepresentative", conn);
            CRinsert.CommandType = CommandType.StoredProcedure;

            SqlCommand checkclubproc = new SqlCommand("checkclub", conn);
            checkclubproc.CommandType = CommandType.StoredProcedure;



            string name = CRname.Text;
            string username = CRuser.Text;
            string password = CRpass.Text;
            string clubname = CRclub.Text;

            checkclubproc.Parameters.Add(new SqlParameter("clubname", clubname));
            SqlParameter foundclub = checkclubproc.Parameters.Add("@found", SqlDbType.Int);
            foundclub.Direction = ParameterDirection.Output;

            checkuserproc.Parameters.Add(new SqlParameter("username", username));
            SqlParameter founduser = checkuserproc.Parameters.Add("@found", SqlDbType.Int);
            founduser.Direction = ParameterDirection.Output;

            conn.Open();
            checkuserproc.ExecuteNonQuery();
            checkclubproc.ExecuteNonQuery();
            conn.Close();


            if (name == "" || username == "" || password == "" || clubname == "")
            {
                Response.Write("ERROR !! ALL Fields MUST be entered");
            }
            else if (founduser.Value.ToString() == "1")
            {
                Response.Write("Username already exists, choose another Username");
            }
            else if (foundclub.Value.ToString() == "0")
            {
                Response.Write("Error !! Club Name Doesn't Exist");
            }
            else
            {
                CRinsert.Parameters.Add(new SqlParameter("name", name));
                CRinsert.Parameters.Add(new SqlParameter("username", username));
                CRinsert.Parameters.Add(new SqlParameter("password", password));
                CRinsert.Parameters.Add(new SqlParameter("clubname", clubname));

                conn.Open();
                CRinsert.ExecuteNonQuery();
                conn.Close();


                Response.Write("ALf mabrook ba2eet CR");
            }
        }
    }
}