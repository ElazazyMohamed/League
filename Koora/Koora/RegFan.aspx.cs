using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using System.ComponentModel;

namespace Koora
{
    public partial class RegFan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void FANreg(object sender, EventArgs e)
        {
            string connStr = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=Milestone_2;Integrated Security=True";
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand checkuserproc = new SqlCommand("checkuser", conn);
            checkuserproc.CommandType = CommandType.StoredProcedure;

            SqlCommand FANinsert = new SqlCommand("addFan", conn);
            FANinsert.CommandType = CommandType.StoredProcedure;



            int phone = 0;


            string name = FANname.Text;
            string username = FANuser.Text;
            string password = FANpass.Text;
            string nationalID = FANnational.Text;
            if (FANphone.Text != "")
            {
                phone = int.Parse(FANphone.Text);
            }

            DateTime birthdate = DateTime.Parse(FANbirthdate.Text);

            string address = FANaddress.Text;


            checkuserproc.Parameters.Add(new SqlParameter("username", username));
            SqlParameter founduser = checkuserproc.Parameters.Add("@found", SqlDbType.Int);
            founduser.Direction = ParameterDirection.Output;

            conn.Open();
            checkuserproc.ExecuteNonQuery();
            conn.Close();



            if (founduser.Value.ToString() == "1")
            {
                Response.Write("Username already exists, choose another Username");
            }
            else
            {
                FANinsert.Parameters.Add(new SqlParameter("name", name));
                FANinsert.Parameters.Add(new SqlParameter("username", username));
                FANinsert.Parameters.Add(new SqlParameter("password", password));
                FANinsert.Parameters.Add(new SqlParameter("nationalid", nationalID));
                FANinsert.Parameters.Add(new SqlParameter("phonenum", phone));
                FANinsert.Parameters.Add(new SqlParameter("birthdate", birthdate));
                FANinsert.Parameters.Add(new SqlParameter("address", address));

                conn.Open();
                FANinsert.ExecuteNonQuery();
                conn.Close();


                Response.Write("ALf mabrook ba2eet FAN");
            }


        }
    }
}