using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using Smartphone_Service.Classes;

namespace Smartphone_Service
{
    public partial class Index : System.Web.UI.Page
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

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            List<ChkAndRb> chkAndRbList = joinChkAndRb();
            InsertIntoServices();
            InsertIntoPhoneParts(chkAndRbList);
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

        public void InsertIntoPhoneParts(List<ChkAndRb> chkAndRbList)
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["SmartphoneServiceConnectionString"].ConnectionString))
            {
                foreach (var item in chkAndRbList)
                {
                    if (item.chk.Checked)
                    {
                        bool IsRepair = item.IsRepair();

                        SqlCommand sqlcomm = new SqlCommand("usp_InsertIntoPhoneParts", conn);
                        sqlcomm.CommandType = CommandType.StoredProcedure;
                        sqlcomm.Parameters.AddWithValue("@PhonePart", item.chk.Text);
                        sqlcomm.Parameters.AddWithValue("@IsRepair", IsRepair);

                        conn.Open();
                        sqlcomm.ExecuteNonQuery();
                        conn.Close();
                    }
                }
            }
        }

        public void InsertIntoServices()
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["SmartphoneServiceConnectionString"].ConnectionString))
            {
                SqlCommand sqlcomm = new SqlCommand("usp_InsertIntoServices", conn);
                sqlcomm.CommandType = CommandType.StoredProcedure;

                sqlcomm.Parameters.AddWithValue("@ClientName", txtName.Text);
                sqlcomm.Parameters.AddWithValue("@ClientSurname", txtSurname.Text);
                sqlcomm.Parameters.AddWithValue("@ClientPhoneNr", txtPhoneNr.Text);
                sqlcomm.Parameters.AddWithValue("@ServiceTypeID", DropDownListServiceType.SelectedValue);
                sqlcomm.Parameters.AddWithValue("@PhoneID", DropDownListPhone.SelectedValue);
                sqlcomm.Parameters.AddWithValue("@TotalPrice", decimal.Parse(txtPrice.Text));

                conn.Open();
                sqlcomm.ExecuteNonQuery();
                conn.Close();

            }
        }
    }
}