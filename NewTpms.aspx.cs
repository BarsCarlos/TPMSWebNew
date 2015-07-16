using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class NewTpms : Page
{
    OpnConntionCls objOpnCnt;
    DataSet ds;
    SqlCommand cmd;

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

            gtOpnRegion();
            openDropData();
            DrpPromoType();
            DrpCalcMethod();
            DrpPromoRes();
            DrpPayMethod();
            DrpUPC();
        }
    }

    protected void gtOpnRegion()
    {
        objOpnCnt = new OpnConntionCls();
        objOpnCnt.SqlString = (string)(Session["UserName"]);

        ds = objOpnCnt.GetRegion;
        MaxRows = ds.Tables[0].Rows.Count;

        drpRegion.DataSource = ds;

        drpRegion.DataValueField = "RW_Rep_ID";
        drpRegion.DataTextField = "RW_Region";
 
        drpRegion.DataBind();
    }
    protected void openDropData()
    {
        try
        {
            objOpnCnt = new OpnConntionCls();

            objOpnCnt.SqlString = (string)(Session["UserName"]);

            ds = objOpnCnt.GetConnectionDrop;
            MaxRows = ds.Tables[0].Rows.Count;

            DropDownCheckBoxes1.DataSource = ds;
            DropDownCheckBoxes1.DataValueField = "CM_ID";
            DropDownCheckBoxes1.DataTextField = "Cust_Name";

            DropDownCheckBoxes1.DataBind();
        }
        catch (Exception err)
        {
            throw new ApplicationException("Data error.", err);
        }

    }

    protected void DropDownCheckBoxes1_SelectedIndexChanged(object sender, EventArgs e)
    {
        List<String> CMIID_list = new List<string>();
        List<String> CMID2_list = new List<string>();

        foreach (ListItem item in DropDownCheckBoxes1.Items)
        {
            if (item.Selected)
            {
                CMIID_list.Add(item.Text);
                //CMID2_list.Add(item.Text);
            }
            txtCMID.Text = String.Join(",   ", CMIID_list.ToArray());
            //this.txtCMID2.Text = String.Join(",  ", CMID2_list.ToArray());
        }
    }

    protected void DrpPromoType()
    {
        objOpnCnt = new OpnConntionCls();

        objOpnCnt.SqlString = (string)(Session["UserName"]);

        ds = objOpnCnt.getPromoType;
        MaxRows = ds.Tables[0].Rows.Count;

        drpPromType.DataSource = ds;
        drpPromType.DataValueField = "Promo_Type";
        drpPromType.DataTextField = "Promo_Type";

        drpPromType.DataBind();
    }

    protected void DrpCalcMethod()
    {
        objOpnCnt = new OpnConntionCls();

        objOpnCnt.SqlString = (string)(Session["UserName"]);

        ds = objOpnCnt.getCalcMethod;
        MaxRows = ds.Tables[0].Rows.Count;

        drpCalMeth.DataSource = ds;
        drpCalMeth.DataValueField = "Calc_Method";
        drpCalMeth.DataTextField = "Calc_Method";

        drpCalMeth.DataBind();
    }

    protected void DrpPromoRes()
    {
        objOpnCnt = new OpnConntionCls();

        objOpnCnt.SqlString = (string)(Session["UserName"]);

        ds = objOpnCnt.getPrmoRes;
        MaxRows = ds.Tables[0].Rows.Count;

        droPromoRes.DataSource = ds;
        droPromoRes.DataValueField = "Promo_Reason";
        droPromoRes.DataTextField = "Promo_Reason";

        if (drpPromType.SelectedItem.ToString().Equals("Advertising"))
        {
            droPromoRes.SelectedIndex = 11;
        }
        droPromoRes.DataBind();
    }

    protected void DrpPayMethod()
    {
        objOpnCnt = new OpnConntionCls();

        objOpnCnt.SqlString = (string)(Session["UserName"]);

        ds = objOpnCnt.getPayMethod;
        MaxRows = ds.Tables[0].Rows.Count;


        drpPayMethod.DataSource = ds;
        drpPayMethod.DataValueField = "Pay_Method";
        drpPayMethod.DataTextField = "Pay_Method";


        drpPayMethod.DataBind();
    }
    protected void DrpUPC()
    {
        try
        { 
        objOpnCnt = new OpnConntionCls();

        objOpnCnt.SqlString = (string)(Session["UserName"]);

        ds = objOpnCnt.getUPCDrpdown;
        MaxRows = ds.Tables[0].Rows.Count;

            drpUPCBox.DataSource = ds;
            drpUPCBox.DataValueField = "product_desc";
            drpUPCBox.DataTextField = "product_desc";

            drpUPCBox.DataBind();
        }
        catch (Exception err)
        {
            throw new ApplicationException("Data error.", err);
        }
    }

    protected void drpUPCBox_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}
