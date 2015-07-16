<%@ Page Title="NewTPMS" EnableEventValidation="false" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="NewTpms.aspx.cs" Inherits="NewTpms" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register TagPrefix="asp" Namespace="Saplin.Controls" Assembly="DropDownCheckBoxes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

 <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <link rel="stylesheet" href="../Css/StyleSheet.css" type="text/css"  runat="server"/>
 <!DOCTYPE html>
     <html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <title>New TPMS</title>
</head>

<body>
    <form id="form1">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>

    <div id="frontdiv" align="center">
       <asp:Panel ID="Panel4" runat="server" BorderStyle="Solid" Width="900px" BackColor="#C4CBB1" Height="65px" HorizontalAlign="center">
        <asp:Label ID="lblBrkName" runat="server" Text="Welcome Back:" Font-Bold="True" BackColor="#FFD3A8"></asp:Label>
        <asp:Label ID="lblUrName" runat="server" Text="Label" Font-Bold="True" BackColor="#FFD3A8"></asp:Label>
        <h3>TPMS-Form Entry</h3>
       </asp:Panel>
        <asp:RoundedCornersExtender ID="Panel4_RoundedCornersExtender" runat="server" Enabled="True" TargetControlID="Panel4">
        </asp:RoundedCornersExtender>
    <br />
    <asp:Panel ID="Panel1" runat="server" BorderStyle="Solid" Width="900px" Height="685px" HorizontalAlign="Justify" BackColor="#F8FFE8">

    <table id="FirtTable" align="center">
        <tr>
            <td>
                <asp:Label ID="lblPromoName" runat="server" Text="Promo-Name:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtPromoName" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:Label ID="lblEntryDate" runat="server" Text="Entry-Date:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtEntryDate" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:Label ID="lblSalesRep" runat="server" Text="Brk/Rep:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtSalesRep" runat="server"></asp:TextBox>
            </td>
        </tr>
    </table>
    <hr />
    <asp:Panel ID="Panel2" runat="server" BackColor="#DFFFBF" Height="110px" Width="900px" HorizontalAlign="Center">
    <table id="midbody" style="width:800px" align="center">
        <caption>
            &nbsp;<tr>
                <td style="width:120px">
                    <asp:Label ID="lblDelv" runat="server" Text="Delivery-From:"></asp:Label>
                </td>
                <td style="width:90px">
                    <asp:TextBox ID="txtDelv" runat="server" ToolTip="Click the box for Calendar popup..."></asp:TextBox>
                    <asp:CalendarExtender ID="txtDelv_CalendarExtender" runat="server" CssClass="cal" Enabled="True" TargetControlID="txtDelv">
                    </asp:CalendarExtender>
                </td>
                <td>
                    <asp:Label ID="lblPerf" runat="server" Text="Performance-From:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtPerf" runat="server" ToolTip="Click the box for Calendar popup..."></asp:TextBox>
                    <asp:CalendarExtender ID="txtPerf_CalendarExtender" runat="server" CssClass="cal" Enabled="True" TargetControlID="txtPerf">
                    </asp:CalendarExtender>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblDelTo" runat="server" Text="Delivery-To:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtDelTo" runat="server"></asp:TextBox>
                    <asp:CalendarExtender ID="txtDelTo_CalendarExtender" runat="server" CssClass="cal" Enabled="True" TargetControlID="txtDelTo">
                    </asp:CalendarExtender>
                </td>
                <td>
                    <asp:Label ID="lblPerformance" runat="server" Text="Performance-To;"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtPerformance" runat="server"></asp:TextBox>
                    <asp:CalendarExtender ID="txtPerformance_CalendarExtender" runat="server" CssClass="cal" Enabled="True" TargetControlID="txtPerformance">
                    </asp:CalendarExtender>
                </td>
            </tr>
        </caption>
    </table>
        </asp:Panel>

    <hr />

    <table id="drpSelction" style="width:100%" align="center">
           <tr> 
            <td align="left">
                <asp:Label ID="lblRegion" runat="server" Text="Region:"></asp:Label>
                <asp:DropDownList ID="drpRegion" runat="server" Width="70px" Font-Size="Small"></asp:DropDownList>
            </td>
            <td>
                <asp:UpdatePanel ID="midDrp" runat="server" >
                    <ContentTemplate>
                <div>
                    <asp:Label ID="lblSelcust" runat="server" Text="Select Customer"></asp:Label>
                    <asp:DropDownCheckBoxes AutoPostBack="True" Font-Size="Medium" ID="DropDownCheckBoxes1" OnSelectedIndexChanged="DropDownCheckBoxes1_SelectedIndexChanged" runat="server" UseButtons="True" UseSelectAllNode = "True" style="top: -19px; left: 0px">
                        <Style2 SelectBoxWidth="50" DropDownBoxBoxWidth="490" DropDownBoxBoxHeight="100"/>
                        <Texts SelectAllNode="Select all" />
                    </asp:DropDownCheckBoxes>
                    <asp:TextBox ID="txtCMID" runat="server" Font-Size="Small" Width="353px" Height="50px" TextMode="MultiLine"></asp:TextBox>
                </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="DropDownCheckBoxes1" EventName="SelectedIndexChanged" />
                    </Triggers>

                </asp:UpdatePanel>
            </td>
            <td></td>
        </tr>
    </table>
    <br />
    <hr />
    <span><hr3>Category Development Initiative</hr3></span>
    <table border=".5" style="width:100%; background-color: #DFFFBF;">
        <tr>
            <td >
                <div >
                    <asp:Label ID="lblCurBal" runat="server" Text="Current CDI Balance $:" Font-Size="Small"></asp:Label>
                </div>
            </td>
            <td >
                <div >
                    <asp:TextBox ID="txtCurBal" runat="server"></asp:TextBox>
                </div>
            </td>

            <td >
                <div>
                    <asp:Label ID="lblCustNum" runat="server" Font-Size="Small" Text="Cust Ref Num:"></asp:Label>
                </div>
            </td>
            <td >
                <div>
                    <asp:TextBox ID="txtCustNum" runat="server"></asp:TextBox>
                </div>
            </td>
        </tr>
        <tr>
            <td >
                <div>
                    <asp:Label ID="lblAmt" runat="server" Text="Amount to reimburse from CDI $:" Font-Size="Small"></asp:Label>
                </div>
            </td>
            <td>
                <div>
                    <asp:TextBox ID="txtAmtReCDI" runat="server"></asp:TextBox>
                </div>
            </td>

            <td >
                <div>
                    <asp:Label ID="lblMDFNo" runat="server" Font-Size="Small" Text="MDF Num:"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </div>
            </td>
            <td >
                <div>
                    <asp:TextBox ID="txtMDFNo" runat="server"></asp:TextBox>
                </div>
            </td>
        </tr>
         <tr>
            <td >
                <div>
                    <asp:Label ID="lblNewCDI" runat="server" Font-Size="Small" Text="New CDI Balance $:"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                </div>
            </td>
            <td >
                <div>
                    <asp:TextBox ID="txtCDIBal" runat="server"></asp:TextBox>
                </div>
            </td>
        </tr>
    </table>
    <hr />
    <br />
    <table>
         <tr>
            <td>
                <asp:Label ID="lblPromType" runat="server" Text="Promo-Type:"></asp:Label>
                <asp:DropDownList ID="drpPromType" runat="server" Width="120px"></asp:DropDownList>
            </td>
            <td>
                <asp:Label ID="lblCalcMeth" runat="server" Text="Calc-Method:"></asp:Label>
                <asp:DropDownList ID="drpCalMeth" runat="server" Width="120px"></asp:DropDownList>
            </td>
            <td>
                <asp:Label ID="lblPromoRs" runat="server" Text="Promo-Reason:"></asp:Label>
                <asp:DropDownList ID="droPromoRes" runat="server" Width="120px"></asp:DropDownList>
            </td>
            <td>
                <asp:Label ID="lblPayMeth" runat="server" Text="Pay-Method:"></asp:Label>
                <asp:DropDownList ID="drpPayMethod" runat="server" Width="120px"></asp:DropDownList>
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <td>
                 <asp:Label ID="lblReqir" runat="server" Text="Requirements:"></asp:Label>
                 <asp:TextBox ID="txtReqir" runat="server" TextMode="MultiLine" Height="80px" Width="658px"></asp:TextBox>
            </td>
            <td></td>
            <td></td>
        </tr>
    </table>
    <table>
          <tr>
              <td>
                <asp:UpdatePanel ID="UPCID" runat="server">
                    <ContentTemplate>
                                <asp:Label ID="lblSelUPC" runat="server" Text="Select-UPC:"></asp:Label>&nbsp;
                                <asp:DropDownCheckBoxes ID="drpUPCBox" runat="server" AutoPostBack="true" OnSelectedIndexChanged="drpUPCBox_SelectedIndexChanged" UseSelectAllNode="True" UseButtons="True" style="top: 0px; left: -85px">
                                    <Style2 SelectBoxWidth="50" DropDownBoxBoxWidth="490" DropDownBoxBoxHeight="100"/>
                                    <Texts SelectAllNode="Select All" />
                                </asp:DropDownCheckBoxes>
                    </ContentTemplate>
                    <Triggers>
                         <asp:PostBackTrigger ControlID="drpUPCBox" />
                    </Triggers>
                </asp:UpdatePanel>
              </td>
              <td>
                  <asp:TextBox ID="txtUpc" runat="server" Font-Size="Small" Width="353px" Height="50px" TextMode="MultiLine"></asp:TextBox>
              </td>
              <td></td>
          </tr>
    </table> 
    </asp:Panel>
        <asp:RoundedCornersExtender ID="RoundedCornersExtender1" runat="server" Enabled="True" TargetControlID="Panel1">
        </asp:RoundedCornersExtender>
    <br />
    </form>  
</body>
</html>
    </asp:Content>

