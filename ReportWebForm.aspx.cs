using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;


public partial class ReportWebForm : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        string cs = ConfigurationManager.ConnectionStrings["BarsslsConnection"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))

        {
        SqlDataAdapter da = new SqlDataAdapter(@" SELECT customers.customer_name, customers.sales_rep, customers.customer_type, customers.RW_rep_ID, customers.date_opened, customers.broker_ID, customers.cust_region " +
                                                        "FROM BARSSLS.dbo.customers customers ", con);


        DataSet ds = new DataSet();


        ReportDocument rd = new ReportDocument();

        rd.Load(Server.MapPath("~/Reports/CrystalReps.rpt"));
        rd.Refresh();
        rd.SetDataSource(ds);// if you have any data source
        CrystalReportViewer1.ReportSource = rd;
        CrystalReportViewer1.DataBind();

        ConnectionInfo myConnectionInfo = new ConnectionInfo();
        myConnectionInfo.ServerName = "corp-bi-dev01";
        myConnectionInfo.DatabaseName = "BARSSLS";
        myConnectionInfo.UserID = "weboe";
        myConnectionInfo.Password = "W3b0e";

        TableLogOnInfos mytableloginfos = new TableLogOnInfos();
        mytableloginfos = CrystalReportViewer1.LogOnInfo;

            foreach (TableLogOnInfo myTableLogOnInfo in mytableloginfos)
            {
                myTableLogOnInfo.ConnectionInfo = myConnectionInfo;
            }
        //setDBLOGONforREPORT(myConnectionInfo); 
      
        }
    }
}