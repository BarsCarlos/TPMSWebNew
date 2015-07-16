using System;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!Page.IsPostBack )
        {

            Calendar1.SelectedDate = Calendar1.TodaysDate;
            //Session["MstPanel"] = "DisablPanel";
            
        }

    }
}
