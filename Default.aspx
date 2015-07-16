<%@ Page Title="Default" EnableEventValidation="false" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Default</title>
    <link rel="stylesheet" type="text/css"  runat="server" href="~/Css/StyleSheet.css" />
</head>
<body>
    <form id="form1">
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
        </asp:ToolkitScriptManager>
        <br />
        <div id="headerId" class ="centemenu ">
        <asp:Panel ID="Panel1" runat="server" CssClass ="centemenu " BackColor="#CAFFE8" BorderStyle="Solid" Width="650px" Height="350px">
            <br />
            <h3 style="background-color: #CCFFDD"><b style="font-size: xx-large">About TMPS</b></h3>
            <hr />
            <asp:Panel ID="Panel2" runat="server" HorizontalAlign="Center"  BorderStyle="Solid" Width="190px" BackColor="#B3FFDE" Height="60px">
                <ul id="Navigation" type="square">
                   <li><b>SALES</b></li>
                   <li><b>BROKERS</b></li>
                   <li><b>ADMINSTRATION</b></li>
                </ul> 
            </asp:Panel>
            <asp:RoundedCornersExtender ID="Panel2_RoundedCornersExtender" runat="server" Enabled="True" TargetControlID="Panel2">
            </asp:RoundedCornersExtender>
            <asp:Panel ID="Panel3" HorizontalAlign="Center" runat="server" BorderStyle="Solid" Width="640px" BackColor="#B3FFDE" Height="100px">
                <ul Id="Navigation" type="square" style="font-size: x-large">
                    <p><b>TMPS is a Order Entry Management System to be used by either Brokers or Sales Rep's in order to provide a better tracking system...</b></p>
                </ul>
            </asp:Panel>          
            <asp:RoundedCornersExtender ID="Panel3_RoundedCornersExtender" runat="server" Enabled="True" TargetControlID="Panel3">
            </asp:RoundedCornersExtender>
        </asp:Panel>
            
        <asp:RoundedCornersExtender ID="Panel1_RoundedCornersDefault" runat="server" Enabled="True" TargetControlID="Panel1">
        </asp:RoundedCornersExtender>
            
        </div>
    </form>
</body>
</html>
</asp:Content>

