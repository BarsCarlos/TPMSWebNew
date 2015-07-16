using System.Configuration;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for OpnConntionCls
/// </summary>
public class OpnConntionCls
{

    public string SqlString;
    public string myRep;
    public string myBrk;

    public string StrCon;
    public SqlDataAdapter Da;
    public SqlCommand Cmd;
    public DataTable Bindmydata;
    public DataTable Bindmydata1;


    public string Sql
    {
        set { SqlString = value; }
    }

    public string myReps
    {
        set { myRep = value; }
    }

    public string myBrks
    {
        set { myBrk = value; }
    }


    public DataSet getUPCDrpdown
    {
        get
        { return OpnUPC(); }
    }

    public DataSet getPayMethod
    {
        get
        { return OpnPayMethod(); }
    }

    public DataSet getPrmoRes
    {
        get
        { return OpnPromRes(); }
    }

    public DataSet getCalcMethod
    {
        get
        { return OpnCalcMethod(); }
    }
    public DataSet getPromoType
    { 
        get
        { return OpnPromoType(); }
    }
    public DataSet GetRegion
    {
        get
        { return OpnRegion(); }
    }


    public DataSet GetConnectionDrop
    {
        get
        { return ConnetoDropdown(); }
    }


    public DataSet GetConnection2
    {
        get
        { return connection_string(); }
    }

    public DataSet GetConnection
    {
        get
        { return MyDataSet(); }
    }


    private DataSet MyDataSet()
    {
        string cs = ConfigurationManager.ConnectionStrings["BarsslsConnection"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))
        {
            Da = new SqlDataAdapter(@"Select Distinct b.RW_Rep_ID, b.RW_Region, c.Promo_Name, c.TPMS_ID, a.CM_ID, a.Customer_Name, a.date_opened, d.Status, a.broker_ID " +
                                                "From dbo.customers a, dbo.Rw_Reps b, dbo.TPMS_Promos c, WebOE.dbo.TPMS_Promos d " +
                                                "Where a.RW_Rep_ID = b.RW_Rep_ID " +
                                                "And c.RW_Rep_ID = c.RW_Rep_ID " +
                                                "And c.CM_ID = d.CM_ID " +
                                                "And b.RW_Rep_ID = '" + SqlString + "'" +
                                                "And d.Status <> 'New' " +
                                                "And d.Status <> 'Settled' " +
                                                "And c.TPMS_ID >= '40000' ", con);


            DataTable bindmydata = new DataTable();
            DataSet ds = new DataSet();

            Da.Fill(ds);
            con.Close();
            //return ds;
            if (ds.Tables[0].Rows.Count == 0)
            {
                Da = new SqlDataAdapter(@"Select Distinct b.RW_Rep_ID, b.RW_Region, c.Promo_Name, c.TPMS_ID, a.CM_ID, a.Customer_Name, a.date_opened, d.Status, a.broker_ID " +
                                                 "From dbo.customers a, dbo.Rw_Reps b, dbo.TPMS_Promos c, WebOE.dbo.TPMS_Promos d " +
                                                 "Where a.RW_Rep_ID = b.RW_Rep_ID " +
                                                 "And c.RW_Rep_ID = c.RW_Rep_ID " +
                                                 "And c.CM_ID = d.CM_ID " +
                                                 "And a.account_type <> 'I' " +
                                                 "And b.RW_Rep_ID = '" + SqlString + "'" +
                                                 "And d.Status <> 'Settled' " +
                                                 "And d.Status <> 'CANCELED' " +
                                                 "And d.Status <> 'Closed' " +
                                                 "And c.TPMS_ID >= '40000' ", con);
                StrCon = "2";
                using (DataTable bindmydata1 = new DataTable())
                {
                }
                DataSet ds1 = new DataSet();
                Da.Fill(ds);
                con.Close();
                //return ds;
            }
            return ds;
        }
    }

    private DataSet connection_string()
    {
        string cs = ConfigurationManager.ConnectionStrings["BarsslsConnection"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))

            if (myRep != null)
            {
                {
                    Da = new SqlDataAdapter(@"SELECT BARSSLS.dbo.RW_Reps.RW_Name, BARSSLS.dbo.RW_Reps.RW_Region, Local_GUID, TPMS_ID, Cust_Ref_Num, MDF_Num, Promo_Name, [Bar-S_Rep], Promo_Date, " +
                                              "WebOE.dbo.TPMS_Promos.CM_ID, Del_Date_From, BARSSLS.dbo.customers.customer_name as CMName, Del_Date_To, Perf_Date_From, Perf_Date_To, Requirements," +
                                              "Promo_Type, Calc_Method, Promo_Reason, Pay_Method, Action, Action_On, Action_On_Goal_Amount, Action_On_Measurement, Action_From_Base, Action_From_Measurement, " +
                                              "Pay_Amount, Pay_Type, Pay_On, Pay_On_Measurement, NK_ID, AllUPCUOM, AllUPCAmount, Status, ErrMsg, FlatCharge, SubmitDate, ProcessedDate, MDFamt, Synced, upcType " +
                                              "FROM WebOe.dbo.TPMS_Promos INNER JOIN BARSSLS.dbo.RW_Reps " +
                                              "ON BARSSLS.dbo.RW_Reps.NT_Username = WebOE.dbo.TPMS_Promos.[Bar-S_rep] INNER JOIN BARSSLS.dbo.customers " +
	                                          "ON BARSSLS.dbo.customers.CM_ID = WebOE.dbo.TPMS_Promos.CM_ID " +
	                                          "Where Promo_Date BETWEEN convert(smalldatetime, '%" + SqlString + "%') - 44 " +
                                              "AND convert(smalldatetime, '%" + SqlString + "%' " +
                                              "AND SUBSTRING(WebOE.dbo.TPMS_Promos.CM_ID, 1, 2) = '05' " +
	                                          "AND Status <> 'New' AND Status <> 'Settled' " +
	                                          "AND WebOE.dbo.TPMS_Promos.TPMS_ID >= 40000 " +
	                                          "ORDER BY Promo_Date DESC, TPMS_ID DESC", con);

                    DataSet ds1 = new DataSet();
                    Da.Fill(ds1);
                    con.Close();
                    return ds1;
                }
            }
            else
            {
                Da = new SqlDataAdapter(@"Select Distinct b.RW_Rep_ID, b.RW_Region, c.Promo_Name, c.TPMS_ID, a.CM_ID, a.Customer_Name, a.date_opened, d.Status, a.broker_ID " +
                                                        "From dbo.customers a, dbo.Rw_Reps b, dbo.TPMS_Promos c, WebOE.dbo.TPMS_Promos d " +
                                                        "Where a.RW_Rep_ID = b.RW_Rep_ID " +
                                                        "And c.RW_Rep_ID = c.RW_Rep_ID " +
                                                        "And c.CM_ID = d.CM_ID " +
                                                        "And a.account_type <> 'I' " +
                                                        "And a.broker_ID Like '%" + SqlString + "%'" +
                                                        "And d.Status <> 'Settled' " +
                                                        "And d.Status <> 'CANCELED' " +
                                                        "And d.Status <> 'Closed' " +
                                                        "And c.TPMS_ID >= '40000' ", con);

                DataSet ds1 = new DataSet();
                Da.Fill(ds1);
                con.Close();
                return ds1;
            }

    }
    private DataSet ConnetoDropdown()
    {
        string cs = ConfigurationManager.ConnectionStrings["BarsslsConnection"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))
        using (Cmd = con.CreateCommand())
        {
             Da = new SqlDataAdapter(@"Select Distinct a.RW_Rep_ID, a.CM_ID + '    ' + a.customer_name Cust_Name, a.CM_ID, b.RW_Region, b.NT_Username " +
                                      "FROM dbo.customers a, RW_Reps b " +
                                      "Where a.RW_rep_ID= b.RW_Rep_ID " +
                                      "And NT_Username= '" + SqlString + "' ", con);

            Bindmydata = new DataTable();

            Da.Fill(Bindmydata);

            DataSet ds1 = new DataSet();
            Da.Fill(ds1);
            con.Close();
            return ds1;
        }
    }
    private DataSet OpnRegion()
    {
        string cs = ConfigurationManager.ConnectionStrings["BarsslsConnection"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))
        {
            Da = new SqlDataAdapter(@"Select Distinct a.RW_Rep_ID, a.customer_name, a.CM_ID, b.RW_Region, b.NT_Username " +
                                       "FROM dbo.customers a, RW_Reps b " +
                                       "Where a.RW_rep_ID= b.RW_Rep_ID " +
                                       "And NT_Username='" + SqlString + "' ", con);

            DataSet ds1 = new DataSet();
            Da.Fill(ds1);
            con.Close();
            return ds1;
        }

    }
    private DataSet OpnPromoType()
    {
        string cs = ConfigurationManager.ConnectionStrings["WebOEConnection"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))
        {
            Da = new SqlDataAdapter(@"SELECT DISTINCT Promo_Type " +
                                     "FROM dbo.TPMS_Promo_Chart " , con);


            DataSet ds1 = new DataSet();
            Da.Fill(ds1);
            con.Close();
            return ds1;
        }
    }
    
    private DataSet OpnCalcMethod()
    {
        string cs = ConfigurationManager.ConnectionStrings["WebOEConnection"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))
        {
            Da = new SqlDataAdapter(@"SELECT DISTINCT Calc_Method " +
                                     "FROM dbo.TPMS_Promo_Chart", con);


            DataSet ds1 = new DataSet();
            Da.Fill(ds1);
            con.Close();
            return ds1;
        }
    }
    private DataSet OpnPromRes()
    {
        string cs = ConfigurationManager.ConnectionStrings["WebOEConnection"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))
        {
            Da = new SqlDataAdapter(@"SELECT DISTINCT Promo_Reason " +
                                     "FROM dbo.TPMS_Promo_Chart", con);


            DataSet ds1 = new DataSet();
            Da.Fill(ds1);
            con.Close();
            return ds1;
        }
    }

    private DataSet OpnPayMethod()
    {
          string cs = ConfigurationManager.ConnectionStrings["WebOEConnection"].ConnectionString;
          using (SqlConnection con = new SqlConnection(cs))
          {
              Da = new SqlDataAdapter(@"SELECT DISTINCT Pay_Method " +
                                       "FROM dbo.TPMS_Promo_Chart", con);


              DataSet ds1 = new DataSet();
              Da.Fill(ds1);
              con.Close();
              return ds1;
          }
    }
    private DataSet OpnUPC()
    {
        string cs = ConfigurationManager.ConnectionStrings["WebOEConnection"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))
        {
            Da = new SqlDataAdapter(@"SELECT a.product_desc, a.pack_size " +
                                    "From BARSSLS.dbo.products a, WebOE.dbo.TPMS_Promo_Cache b", con);


            DataSet ds1 = new DataSet();
            Da.Fill(ds1);
            con.Close();
            return ds1;
        }
    }
 
}

//"And b.RW_Rep_ID = '" + sql_string + "'", con);
//"And b.RW_Rep_ID = 'SSimpson'", con);

//da = new SqlDataAdapter(@"SELECT BARSSLS.dbo.RW_Reps.RW_Region, Local_GUID, TPMS_ID, Cust_Ref_Num, MDF_Num, Promo_Name, Bar-S_Rep, " +
//                        "Promo_Date, WebOE.dbo.TPMS_Promos.CM_ID, BARSSLS.dbo.customers.customer_name as CMName, Del_Date_From, Del_Date_To, Perf_Date_From, " +
//                        "Perf_Date_To, Requirements, Promo_Type, Calc_Method, Promo_Reason, Pay_Method, Action, Action_On, Action_On_Goal_Amount, Action_On_Measurement, " +
//                        "Action_From_Base, Action_From_Measurement, Pay_Amount, Pay_Type, Pay_On, Pay_On_Measurement, NK_ID, AllUPCUOM, AllUPCAmount, Status, " +
//                        "ErrMsg, FlatCharge, SubmitDate, ProcessedDate, MDFamt, Synced, upcType " +
//                        "FROM dbo.TPMS_Promos " +
//                        "INNER JOIN BARSSLS.dbo.RW_Reps ON BARSSLS.dbo.RW_Reps.NT_Username = WebOE.dbo.TPMS_Promos.Bar-S_rep OR BARSSLS.dbo.RW_Reps.RW_Rep_ID = WebOE.dbo.TPMS_Promos.Bar-S_rep " +
//                        "INNER JOIN BARSSLS.dbo.customers ON BARSSLS.dbo.customers.CM_ID = WebOE.dbo.TPMS_Promos.CM_ID " +
//                        "WHERE WebOE.dbo.tpms_promos.cm_id IN (Select CM_ID " +
//                        "From barssls.dbo.customers c " +
//                        "Inner join barssls.dbo.rw_reps rw ON (c.rw_rep_ID = rw.rw_rep_ID OR c.broker_iD = rw.rw_rep_ID) " +
//                        "WHERE (account_type <> 'I') and( broker_id = '" + sql_string + "' OR rw.nt_username ='" + sql_string + "')) And Status <> 'Settled' AND dbo.TPMS_Promos.TPMS_ID >= '40000'", con);
