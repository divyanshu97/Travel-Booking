using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        //Session["Login"] = null;
        //Session["Login"] = 0;
        //Session["LoginId"] = null;
        //Session["LoginName"] = null;
        //Session["LoginEmail"] = null;
        //Session["DOB"] = null;
        //Session["Category"] = null;
        //Session["StartCity"] = null;
        //Session["StartCityId"] = null;
        //Session["StateId"] = null;
        //Session["DestinationCity"] = null;
        //Session["DestinationCityId"] = null;
        //Session["Mode"] = null;
        //Session["Hotels"] = null;
        //Session["HotelsId"] = null;
        Session["LastPage"] = "Home.aspx";
    }

    protected void searchPlaces(object sender ,EventArgs e)
    {
        Session["search"] = tbxsearch.Text;
        Session["LastPage"] = "Home.aspx";
        Response.Redirect("Search.aspx");
    }
}