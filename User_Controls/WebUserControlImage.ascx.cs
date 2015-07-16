using System;
using System.Web.UI;

public partial class User_Controls_WebUserControlImage : UserControl
{
    public int count = 1000;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
           // enblImg();
        }
    }
    private void enblImg()
    {
        if (Timer1 != null)
        {
            Timer1.Interval = 600000;
            double counter = Timer1.Interval;

            counter++;
            if (counter >= 600000)
            {
                Image1.Visible = true;
            }
        }
        //System.Threading.Thread.Sleep(TimeSpan.FromSeconds(5));
            //this.Image1.Visible = false;
    }
}