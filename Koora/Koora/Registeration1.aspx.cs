using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Koora
{
    public partial class Registeration1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Register1(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["Koora"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            string type = RadioButtonList1.SelectedValue;
            Response.Write(type);

            if (type == "Sports Association Manager"){
                Response.Redirect("RegSportsAssociationManager.aspx");
            }
            if (type == "Club Representative")
            {
                Response.Redirect("RegClubRepresentative.aspx");
            }
            if (type == "Stadium Manager")
            {
                Response.Redirect("RegStadiumManager.aspx");
            }
            if (type == "Fan")
            {
                Response.Redirect("RegFan.aspx");
            }
        }
    }
}