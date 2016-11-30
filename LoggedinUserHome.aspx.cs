using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LoggedinHome : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Convert.ToInt32(Session["Login"])==0)
        {
            Response.Redirect(""+Session["LastPage"].ToString());
        }
    }
    protected void searchPlaces(object sender, EventArgs e)
    {
        Session["search"] = tbxsearch.Text;
        Response.Redirect("Search.aspx");
    }
    protected void logout(object sender,EventArgs e)
    {
        Session["Login"] = 0;
        Response.Redirect("Home.aspx");
    }
}