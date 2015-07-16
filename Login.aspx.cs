using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : Page
{

    DataSet ds;

    int MaxRows;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {

            Panel myPanel = Page.Master.FindControl("Panel1") as Panel;
            myPanel.Visible = false;
            MasterPage myMain = new MasterPage();
            if (this.txtUsrName.Text == "")
            {
                txtUsrName.Focus();
            }

        }
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        if (txtUsrName.Text != "")
        {
            string UserName = txtUsrName.Text.Trim();
            Session["UserName"] = UserName;
            OpnConntionCls logUsrIn = new OpnConntionCls {SqlString = (string) (Session["UserName"])};
            ds = logUsrIn.GetConnection;
            MaxRows = ds.Tables[0].Rows.Count;

        if (MaxRows == 0 ) 
        {
            Response.Write("<script>alert(' Wrong User-Name...')</script>");
            txtUsrName.Text = string.Empty;
            txtUsrName.Focus();
            return;
        }

            Response.Redirect("Default.aspx?UserName="+txtUsrName.Text);
        }
        else
        {
            Response.Write("<script>alert(' Need to add something to User-Name...')</script>");
        }
        
    }
    protected void drpSelection_SelectedIndexChanged(object sender, EventArgs e)
    {
        if(drpSelection.SelectedValue   == "PAMS")
        {
            Response.Redirect("http://corp-iis-dev01/PAMS/");

        }

    }
}
