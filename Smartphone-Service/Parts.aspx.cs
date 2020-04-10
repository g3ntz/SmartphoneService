using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Smartphone_Service
{
    public partial class Parts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnShowParts_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["SmartphoneServiceConnectionString"].ConnectionString))
            {
                SqlCommand sqlcomm = new SqlCommand("usp_GetPartsByID", conn);
                sqlcomm.CommandType = CommandType.StoredProcedure;
                sqlcomm.Parameters.AddWithValue("@ServiceID", int.Parse(txtServiceID.Text));
                SqlDataAdapter sda = new SqlDataAdapter(sqlcomm);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                conn.Open();

                ListView1.DataSource = dt;
                ListView1.DataBind();


                conn.Close();

            }
        }
    }
}