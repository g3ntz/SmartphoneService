using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SmartphoneService
{
    public partial class _Default : Page
    {
        List<RadioButton> rd = new List<RadioButton>();
        protected void Page_Load(object sender, EventArgs e)
        {
            RadioButton1.GroupName = "a";
            RadioButton2.GroupName = "a";
            rd.Add(RadioButton1);
            rd.Add(RadioButton2);
        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["SmartphoneServiceConnectionString"].ConnectionString))
            {
                SqlCommand sqlcomm = new SqlCommand("usp_InsertIntoServices", conn);
                sqlcomm.CommandType = CommandType.StoredProcedure;
                sqlcomm.Parameters.AddWithValue("@ClientName", TextBox1.Text);
                sqlcomm.Parameters.AddWithValue("@ClientSurname", TextBox2.Text);
                sqlcomm.Parameters.AddWithValue("@ClientPhoneNr", TextBox3.Text);
                sqlcomm.Parameters.AddWithValue("@ServiceTypeID", DropDownList2.SelectedValue);
                sqlcomm.Parameters.AddWithValue("@PhoneID", DropDownList1.SelectedValue);
                sqlcomm.Parameters.AddWithValue("@TotalPrice", decimal.Parse(TextBox4.Text));
                sqlcomm.Parameters.AddWithValue("@PhonePart", DropDownList3.SelectedValue);
                bool IsRepair = true;
                foreach (var item in rd)
                {
                    if (item.Checked)
                    {
                        if (item.Text == "Repaired")
                        {
                            IsRepair = true;
                        }
                        else
                        {
                            IsRepair = false;
                        }
                    }
                }
                sqlcomm.Parameters.AddWithValue("@IsRepair", IsRepair);
                conn.Open();
                sqlcomm.ExecuteNonQuery();
                conn.Close();

                ListView1.DataBind();

            }
        }
    }
}