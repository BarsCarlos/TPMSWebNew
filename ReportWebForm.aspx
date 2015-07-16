<%@ Page Title="ReportViewer" Debug="true" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ReportWebForm.aspx.cs" Inherits="ReportWebForm" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>View Report</title>
 
</head>
<body>
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
    <form id="form1">
    <div>
        <table>
            <tr>
                <td></td>
                <td>
                    <asp:Panel ID="pnlRpt" runat="server">
                        <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true" HasRefreshButton="True" />
                    </asp:Panel>
                    <asp:RoundedCornersExtender ID="pnlRpt_RoundedCornersReports" runat="server" Enabled="True" TargetControlID="pnlRpt">
                    </asp:RoundedCornersExtender>
                </td>
                <td></td>
            </tr>

        </table>
    </div>
    </form>
</body>
</html>
</asp:Content>

