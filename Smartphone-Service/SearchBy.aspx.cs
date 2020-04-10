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
    public partial class SearchBy : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            rbRepaired.GroupName = "a";
            rbExchanged.GroupName = "a";
        }

        protected void ServiceTypeList_SelectedIndexChanged(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["SmartphoneServiceConnectionString"].ConnectionString))
            {
                SqlCommand sqlcomm = new SqlCommand("usp_SearchByServiceType", conn);
                sqlcomm.CommandType = CommandType.StoredProcedure;
                sqlcomm.Parameters.AddWithValue("@ServiceType", ServiceTypeList.SelectedValue);
                SqlDataAdapter sda = new SqlDataAdapter(sqlcomm);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                ListView1.DataSource = dt;
                ListView1.DataBind();
               
            }
        }

        protected void btnSearchByClient_Click1(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["SmartphoneServiceConnectionString"].ConnectionString))
            {
                SqlCommand sqlcomm = new SqlCommand("usp_SearchByClient", conn);
                sqlcomm.CommandType = CommandType.StoredProcedure;
                sqlcomm.Parameters.AddWithValue("@ClientID", txtSearchByClient.Text);
                SqlDataAdapter sda = new SqlDataAdapter(sqlcomm);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                ListView1.DataSource = dt;
                ListView1.DataBind();

            }
        }

        protected void RepairedExchangedList_SelectedIndexChanged(object sender, EventArgs e)
        {
            bool IsRepair = true;
            if (rbRepaired.Checked)
            {
                IsRepair = true;
            }
            else
            {
                IsRepair = false;
            }
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["SmartphoneServiceConnectionString"].ConnectionString))
            {
                SqlCommand sqlcomm = new SqlCommand("usp_SearchByRepairedOrFixedParts", conn);
                sqlcomm.CommandType = CommandType.StoredProcedure;
                sqlcomm.Parameters.AddWithValue("@PartName", RepairedExchangedList.SelectedValue);
                sqlcomm.Parameters.AddWithValue("@IsRepair", IsRepair);
                SqlDataAdapter sda = new SqlDataAdapter(sqlcomm);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                ListView1.DataSource = dt;
                ListView1.DataBind();

            }
        }

        protected void rbRepaired_CheckedChanged(object sender, EventArgs e)
        {
            bool IsRepair = true;
            if (rbRepaired.Checked)
            {
                IsRepair = true;
            }
            else
            {
                IsRepair = false;
            }
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["SmartphoneServiceConnectionString"].ConnectionString))
            {
                SqlCommand sqlcomm = new SqlCommand("usp_SearchByRepairedOrFixedParts", conn);
                sqlcomm.CommandType = CommandType.StoredProcedure;
                sqlcomm.Parameters.AddWithValue("@PartName", RepairedExchangedList.SelectedValue);
                sqlcomm.Parameters.AddWithValue("@IsRepair", IsRepair);
                SqlDataAdapter sda = new SqlDataAdapter(sqlcomm);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                ListView1.DataSource = dt;
                ListView1.DataBind();

            }
        }

        protected void rbExchanged_CheckedChanged(object sender, EventArgs e)
        {
            bool IsRepair = true;
            if (rbRepaired.Checked)
            {
                IsRepair = true;
            }
            else
            {
                IsRepair = false;
            }
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["SmartphoneServiceConnectionString"].ConnectionString))
            {
                SqlCommand sqlcomm = new SqlCommand("usp_SearchByRepairedOrFixedParts", conn);
                sqlcomm.CommandType = CommandType.StoredProcedure;
                sqlcomm.Parameters.AddWithValue("@PartName", RepairedExchangedList.SelectedValue);
                sqlcomm.Parameters.AddWithValue("@IsRepair", IsRepair);
                SqlDataAdapter sda = new SqlDataAdapter(sqlcomm);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                ListView1.DataSource = dt;
                ListView1.DataBind();

            }
        }
    }
}