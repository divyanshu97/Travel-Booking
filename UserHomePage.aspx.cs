using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Web;
//using System.Web.UI;
//using System.Web.UI.WebControls;
//using System.Net;
//using System.Net.Mail;
//using System.IO;
//using System.Text;
//using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class UserHomePage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToInt32(Session["Login"].ToString()) == 0)
        {
            Response.Redirect("Home.aspx");
        }
        else
        {
            if (!IsPostBack)
            {
                ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Welcome');", true);
            }
            int userId = Convert.ToInt32(Session["UserId"]);
            SqlConnection connect1 = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
            connect1.Open();


            string checkname = "select Name from tblRegistration where RegID='" + userId + "'";

            SqlCommand cmdname = new SqlCommand(checkname, connect1);

            cmdname.ExecuteNonQuery();

            string name = cmdname.ExecuteScalar().ToString();
            connect1.Close();

            Response.Write("<script>alert('The following errors have occurred: \n" + name + " .')</script>");
            ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Welcome " + name + ";)'", true);

            string[] tokens = name.Split(' ');
            string first = tokens[0];
            h1.Text = "Hello " + first;


            SqlConnection connect = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);

            string checkNumber = "select count(*) from tblPlanning where userId='" + userId + "'";
            SqlCommand cmdNumber = new SqlCommand(checkNumber, connect);
            connect.Open();
            int temp = Convert.ToInt32(cmdNumber.ExecuteScalar().ToString());
            connect.Close();
            if (temp == 0)
            {
                linkUpdateEvent.Visible = false;
            }
        }
    }
    protected void PlanJourney(object sender, EventArgs e)
    {
        Response.Redirect("~/Planning.aspx");
    }
    protected void logout(object sender, EventArgs e)
    {
        Session["Login"]=0;
        Response.Redirect("Home.aspx");
    }
    protected void UpdateEvent(object sender,EventArgs e)
    {
        SqlConnection connect = new SqlConnection(ConfigurationManager.ConnectionStrings["RegistrationConnectionString"].ConnectionString);
        int userId = Convert.ToInt32(Session["UserId"]);
        string checkNumber = "select count(*) from tblPlanning where userId='" + userId + "'";
        SqlCommand cmdNumber = new SqlCommand(checkNumber, connect);
        connect.Open();
        int temp = Convert.ToInt32(cmdNumber.ExecuteScalar().ToString());
        connect.Close();
        if (temp == 0)
        {
            Response.Write(@"<script language='javascript'>alert('Plan Your Event first')</script>"); //Response.Write("");
        }
        else
        {
            Response.Redirect("IfMany.aspx");
        }
    }
}