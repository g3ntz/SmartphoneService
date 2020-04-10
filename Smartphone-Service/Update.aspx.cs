using Smartphone_Service.Classes;
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
    public partial class Update : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //GROUP RADIO BUTTONS
            rbCameraRepaired.GroupName = "Camera";
            rbCameraExchanged.GroupName = "Camera";
            rbBatteryRepaired.GroupName = "Battery";
            rbBatteryExchanged.GroupName = "Battery";
            rbSensorRepaired.GroupName = "Sensor";
            rbSensorExchanged.GroupName = "Sensor";
            rbDisplayRepaired.GroupName = "Display";
            rbDisplayExchanged.GroupName = "Display";
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            List<ChkAndRb> chkAndRbList = joinChkAndRb();
            updateServices();
            updatePhoneParts(chkAndRbList);
            ListView1.DataBind();
        }

        public List<ChkAndRb> joinChkAndRb()
        {
            List<ChkAndRb> chkAndRbList = new List<ChkAndRb>();
            chkAndRbList.Add(new ChkAndRb(chkCamera, rbCameraRepaired, rbCameraExchanged));
            chkAndRbList.Add(new ChkAndRb(chkBattery, rbBatteryRepaired, rbBatteryExchanged));
            chkAndRbList.Add(new ChkAndRb(chkSensor, rbSensorRepaired, rbSensorExchanged));
            chkAndRbList.Add(new ChkAndRb(chkDisplay, rbDisplayRepaired, rbDisplayExchanged));

            return chkAndRbList;
        }

        public void updateServices()
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["SmartphoneServiceConnectionString"].ConnectionString))
            {
                SqlCommand sqlcomm = new SqlCommand("usp_UpdateServices", conn);
                sqlcomm.CommandType = CommandType.StoredProcedure;
                sqlcomm.Parameters.AddWithValue("@ServiceID", int.Parse(txtServiceID.Text));
                sqlcomm.Parameters.AddWithValue("@ClientName", TextBox1.Text);
                sqlcomm.Parameters.AddWithValue("@ClientSurname", TextBox2.Text);
                sqlcomm.Parameters.AddWithValue("@ClientPhoneNr", TextBox3.Text);
                sqlcomm.Parameters.AddWithValue("@ServiceTypeID", DropDownList2.SelectedValue);
                sqlcomm.Parameters.AddWithValue("@PhoneID", DropDownList1.SelectedValue);
                sqlcomm.Parameters.AddWithValue("@TotalPrice", decimal.Parse(TextBox4.Text));

                conn.Open();
                sqlcomm.ExecuteNonQuery();
                conn.Close();

            }
        }

        public void updatePhoneParts(List<ChkAndRb> chkAndRbList)
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["SmartphoneServiceConnectionString"].ConnectionString))
            {
                foreach (var item in chkAndRbList)
                {
                    if (item.chk.Checked)
                    {
                        bool IsRepair = item.IsRepair();

                        SqlCommand sqlcomm = new SqlCommand("usp_UpdatePhoneParts", conn);
                        sqlcomm.CommandType = CommandType.StoredProcedure;
                        sqlcomm.Parameters.AddWithValue("@ServiceID", int.Parse(txtServiceID.Text));
                        sqlcomm.Parameters.AddWithValue("@PhonePart", item.chk.Text);
                        sqlcomm.Parameters.AddWithValue("@IsRepair", IsRepair);

                        conn.Open();
                        sqlcomm.ExecuteNonQuery();
                        conn.Close();
                    }
                }
            }
        }
    }
}