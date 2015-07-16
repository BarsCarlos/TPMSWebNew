using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : Page
{
    OpnConntionCls objOpnCnt;
    string conString;
    DataSet ds;
    int MaxRows;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        
    if (!Page.IsPostBack)
        {
            string myUrsN = (string)(Session["UserName"]);
            lblUrName.Text = myUrsN;

            if (Request.QueryString["UserName"] != null)
            {
                return;
            }
            
            openDatgrid();
        }
    }
    protected void openDatgrid()
        {
        //--This Method calls the Class OpnConntionCls to retrieve sql query and populate into a gridview--//
            objOpnCnt = new OpnConntionCls();

            objOpnCnt.SqlString = (string)(Session["UserName"]);

            ds = objOpnCnt.GetConnection;
            MaxRows = ds.Tables[0].Rows.Count;

            if (objOpnCnt.StrCon == "2")
            {
                chkRep.Checked = true;                               
            }
            else
            {
                chkBrk.Checked = true;
            }
            GridView1.DataSource = ds;
            GridView1.DataBind();
      
        }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {

        // CHECK IF ITS A ROW. ELSE THE HEADER WILL BE TREATED AS A ROW.
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes.Add("onmouseover", "MouseEvents(this, event)");
            e.Row.Attributes.Add("onmouseout", "MouseEvents(this, event)");

        }
        if (e.Row.RowType == DataControlRowType.Header)
        {
            e.Row.Cells[0].Width = new Unit("50px");
            e.Row.Cells[1].Width = new Unit("50px");
            e.Row.Cells[2].Width = new Unit("580px");
            e.Row.Cells[3].Width = new Unit("300px");
            e.Row.Cells[4].Width = new Unit("50px");
            e.Row.Cells[5].Width = new Unit("300px");
            e.Row.Cells[6].Width = new Unit("50px");
        }
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtRep.Text = GridView1.SelectedRow.Cells[1].Text;
        txtBrk.Text = GridView1.SelectedRow.Cells[2].Text;
        txtReg.Text = GridView1.SelectedRow.Cells[3].Text;
        txtPromoName.Text = GridView1.SelectedRow.Cells[4].Text;
        txtTpmsId.Text = GridView1.SelectedRow.Cells[5].Text;
        txtCustName.Text = GridView1.SelectedRow.Cells[6].Text;
        txtDateOpn.Text = GridView1.SelectedRow.Cells[7].Text;
        txtStatus.Text = GridView1.SelectedRow.Cells[8].Text;

    }
      
    protected void btnMySch_Click(object sender, EventArgs e)
    {
    
        string cs = ConfigurationManager.ConnectionStrings["BarsslsConnection"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))

            if (chkBrk.Checked)
            {
                {
                    objOpnCnt = new OpnConntionCls();
                    objOpnCnt.SqlString = txtSch.Text ;
                    objOpnCnt.myBrk = chkBrk.Checked.ToString();

                    ds = objOpnCnt.GetConnection2;
                    MaxRows = ds.Tables[0].Rows.Count;

                    GridView1.DataSource = ds;
                    GridView1.DataBind();

                }
            }
            else if (chkRep.Checked)
            {
                objOpnCnt = new OpnConntionCls();
                objOpnCnt.SqlString = txtSch.Text;
                objOpnCnt.myRep  = chkRep.Checked.ToString();

                ds = objOpnCnt.GetConnection2;
                MaxRows = ds.Tables[0].Rows.Count;

                GridView1.DataSource = ds;
                GridView1.DataBind();


            }
    }
 
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        //***What this method is doing calling the OpnConntionCls for it to go to the next rows on the gridview***//
    {
        //ScriptManager.RegisterStartupScript(this, GetType(), "Javascript", "BeforePostBack();", true);

        string cs = ConfigurationManager.ConnectionStrings["BarsslsConnection"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))

            if (chkBrk.Checked)
            {
                {
                    objOpnCnt = new OpnConntionCls();
                    objOpnCnt.SqlString = (string)(Session["UserName"]);

                    ds = objOpnCnt.GetConnection;
                    MaxRows = ds.Tables[0].Rows.Count;

                    GridView1.PageIndex = e.NewPageIndex;
                    GridView1.DataSource = ds;
                    GridView1.DataBind();

                }
            }
            else if (chkRep.Checked)
        {

                objOpnCnt = new OpnConntionCls();
                objOpnCnt.SqlString = (string)(Session["UserName"]);

                ds = objOpnCnt.GetConnection;
                MaxRows = ds.Tables[0].Rows.Count;


                GridView1.PageIndex = e.NewPageIndex;
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }
    }

  
}