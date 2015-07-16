<%@ Page Title="Search" EnableEventValidation="false" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Search.aspx.cs" Inherits="_Default" %>


<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<%@ Register Src="~/User_Controls/WebUserControlImage.ascx" TagPrefix="uc1" TagName="WebUserControlImage" %>

<%@ Register TagPrefix="uc" TagName="Spinner" Src="~/User_Controls/WebUserControlImage.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Default</title>

    <link rel="stylesheet" type="text/css"  runat="server" href="~/Css/StyleSheet.css" />
    
    <script type="text/javascript" src="scripts.js"></script>

    <script type="text/javascript">
        // SCRIPT FOR THE MOUSE EVENT.
    function MouseEvents(objRef, evt) {
    
        if (evt.type == "mouseover") {
            objRef.style.cursor = 'pointer';
            objRef.style.backgroundColor = "#EEEED1";
        }
        else {
            if (evt.type == "mouseout") objRef.style.backgroundColor = "#FFF";
        }
    }
    </script>

       <script type="text/javascript">
        function BeforePostBack()
        {
            //$('"test"').text('');
            ToggleSpinnerBlock(true);
            return true; //So that allow post back to server
        }
    </script>
        
</head>
<body>
    <table id="Grid1" style="width:100%">
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
        <tr>
            <td>
            </td>
            <td align="center">
                <br />
                    <div>
                        <div id="BrkRepId" align="center">
                        <asp:Panel ID="PanelChks" runat="server" BorderStyle="Solid" Width="350px" BackColor="#C4CBB1" Height="50px" HorizontalAlign="left">
                            <asp:CheckBox ID="chkBrk" runat="server" Text="Broker" />
                            <asp:CheckBox ID="chkRep" runat="server" Text ="Rep" />&nbsp;&nbsp;&nbsp;

                            <asp:Label ID="lblLoginName" runat="server" Text="Welcome:" Font-Size="Small" BackColor="#FFD3A8" Font-Bold="True"></asp:Label>
                            <asp:Label ID="lblUrName" runat="server" Text="Label" Font-Size="Small" BackColor="#FFD3A8" Font-Bold="True"></asp:Label>

                            <asp:RoundedCornersExtender ID="PanelChks_RoundedCornersExtender" runat="server" Enabled="True" TargetControlID="PanelChks">
                            </asp:RoundedCornersExtender>
                            <asp:UpdatePanel ID="Up" runat="server" UpdateMode="Conditional">
                            <ContentTemplate >
                                <asp:TextBox ID="txtSch" runat="server" Width="270px" ToolTip="Searching for Broker or Rep..." ></asp:TextBox>
                                <asp:FilteredTextBoxExtender ID="txtSch_FilteredTextBoxExtender" runat="server" Enabled="True" InvalidChars="+-=/*(}.&quot;/&gt;" TargetControlID="txtSch" FilterType="LowercaseLetters">
                                </asp:FilteredTextBoxExtender>
                                <asp:Button ID="btnMySch" runat="server" Text="Search" OnClick="btnMySch_Click" OnClientClick="return BeforePostBack()" />
                            </ContentTemplate>
                            <Triggers>
                               <%-- <asp:AsyncPostBackTrigger ControlID="btnUpdate" EventName="Click" />--%>
                                <asp:PostBackTrigger ControlID="btnMySch" />
                            </Triggers>
                            </asp:UpdatePanel>
                            
                        </asp:Panel>
                        </div>
                    </div>
                <br />

                <asp:Panel ID="Panel2" runat="server" BorderStyle="Solid" HorizontalAlign="Center" Width="750px" BackColor="#CAFFE8" ScrollBars="Horizontal" Height="355px">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="False" UpdateMode="Conditional">
                        <ContentTemplate >
                            <asp:GridView ID="GridView1" runat="server"  CellPadding ="3" Font-Names="Arial" Font-Size="X-Small" ForeColor="#000333" OnRowDataBound="GridView1_RowDataBound"
                                        AutoGenerateSelectButton="True" ClientIDMode="Static" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="100%" Height="180px" AllowPaging="True" EmptyDataText="No data available..."
                                        OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="15" AutoGenerateColumns="False">
                                         <Columns>
                                             <asp:BoundField DataField="RW_Region" HeaderText="Reg" >
                                             <ControlStyle Width="150px" />
                                             <HeaderStyle Width="150px" />
                                             <ItemStyle Width ="200" />
                                             </asp:BoundField>
                                             <asp:BoundField DataField="Promo_Name" HeaderText="Promo-Name" >
                                             <ControlStyle Width="150px" />
                                             <HeaderStyle Width="150px" />
                                             <ItemStyle Width ="200" />
                                             </asp:BoundField>
                                             <asp:BoundField DataField="TPMS_ID" HeaderText="TPMS-ID">
                                             <ControlStyle Width="150px" />
                                             <HeaderStyle Width="150" />
                                             <ItemStyle Width ="200" />
                                             </asp:BoundField>
                                             <asp:BoundField DataField="CM_ID" HeaderText="Customer-No" >
                                             <ControlStyle Width="150px" />
                                             <HeaderStyle Width="150" />
                                             <ItemStyle Width ="200" />
                                             </asp:BoundField>
                                             <asp:BoundField DataField="Customer_Name" HeaderText="Customer-Name" >
                                             <ControlStyle Width="150px" />
                                             <HeaderStyle Width="150px" />
                                             <ItemStyle Width ="200" />
                                             </asp:BoundField>
                                             <asp:BoundField DataField="date_opened" HeaderText="Date-Opened" >
                                             <ControlStyle Width="150px" />
                                             <HeaderStyle Width="150px" />
                                             <ItemStyle Width ="200" />
                                             </asp:BoundField>
                                             <asp:BoundField DataField="Status" HeaderText="Status" >
                                             <ControlStyle Width="150px" />
                                             <HeaderStyle Width="150px" />
                                             <ItemStyle Width ="200" />
                                             </asp:BoundField>
                                             <asp:BoundField DataField="broker_ID" HeaderText="Broker-ID" >
                                             <ControlStyle Width="150px" />
                                             <HeaderStyle Width="150px" />
                                             <ItemStyle Width ="200" />
                                             </asp:BoundField>
                                         </Columns>
                                         <HeaderStyle BackColor="#3AC0F2" Width="10%" Font-Size="Small" />
                            </asp:GridView>
                         </ContentTemplate>

                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="GridView1" />
                        </Triggers>
                    </asp:UpdatePanel>
                  </asp:Panel>
                <asp:RoundedCornersExtender ID="Panel2_RoundedCornersTopSearch" runat="server" Enabled="True" TargetControlID="Panel2">
                </asp:RoundedCornersExtender>

                <br />

                <asp:Panel ID="PanelSelectText" runat="server" BorderStyle="Solid" HorizontalAlign="Center" Width="1000px" BackColor="#CAFFE8" Height="250px">
                    <table width="100%">
                        <tr>
                            <td>
                                <asp:Label ID="lblRep" runat="server" Text="Sales-Rep:" Font-Size="Small"  ></asp:Label>

                            </td>
                            <td>
                                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                    <ContentTemplate >
                                        <asp:TextBox ID="txtRep" runat="server" Font-Size="X-Small"></asp:TextBox>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                            <td>
                                <asp:Label ID="lblBroker" runat="server" Text="Broker:" Font-Size="Small"></asp:Label>
                            </td>
                            <td>
                                <asp:UpdatePanel ID="UpdateBrk" runat="server">
                                    <ContentTemplate>
                                        <asp:TextBox ID="txtBrk" runat="server" Font-Size="X-Small"></asp:TextBox>
                                    </ContentTemplate>

                                </asp:UpdatePanel>
                            </td>
                            <td>
                                <asp:Label ID="lblRegion" runat="server" Text="Region:" Font-Size="Small"></asp:Label>

                            </td>
                            <td>
                                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                    <ContentTemplate >
                                        <asp:TextBox ID="txtReg" runat="server" Font-Size="X-Small"></asp:TextBox>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                            <td>
                                <asp:Label ID="lblPromoName" runat="server" Text="Promo-Name:" Font-Size="Small"></asp:Label>
                            </td>
                            <td>
                                <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                    <ContentTemplate >
                                        <asp:TextBox ID="txtPromoName" runat="server" Font-Size="X-Small"></asp:TextBox>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                            <td>
                                <asp:Label ID="lblTPMSID" runat="server" Text="TPMS-Id:" Font-Size="Small"></asp:Label>
                            </td>
                            <td>
                                <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                                    <ContentTemplate >
                                        <asp:TextBox ID="txtTpmsId" runat="server" Font-Size="X-Small"></asp:TextBox>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblCustName" runat="server" Text="Customer-Name:" Font-Size="Small"></asp:Label>
                            </td>
                            <td>
                                <asp:UpdatePanel ID="UpdatePnlCustName" runat="server">
                                    <ContentTemplate>
                                        <asp:TextBox ID="txtCustName" runat="server" Font-Size="X-Small"></asp:TextBox>
                                    </ContentTemplate>
                                </asp:UpdatePanel> 
                            </td>
                            <td>
                                <asp:Label ID="lblDateOpn" runat="server" Text="Date-Opened:" Font-Size="Small"></asp:Label>
                            </td>
                            <td>
                                <asp:UpdatePanel ID="UpdatePnlDateOpn" runat="server">
                                    <ContentTemplate>
                                        <asp:TextBox ID="txtDateOpn" runat="server" Font-Size="X-Small"></asp:TextBox>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                            <td>
                                <asp:Label ID="lblStatus" runat="server" Text="Status:" Font-Size="Small"></asp:Label>
                            </td>
                            <td>
                                <asp:UpdatePanel ID="UpdatPnlStatus" runat ="server">
                                    <ContentTemplate>
                                        <asp:TextBox ID="txtStatus" runat="server" Font-Size="X-Small"></asp:TextBox>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <div style=" float:none; z-index:0;">
                        <asp:Label ID="lblComents" runat="server" Text="Add Additional Comments:"></asp:Label>
                        <asp:TextBox ID="txtComments" runat="server" Font-Bold="True" TextMode="MultiLine" ToolTip="Add coment to either to the Rep or Broker..." Width="590px" Height="50px"></asp:TextBox>
                    </div>

                    <br />
                    <br />
                    <div>
                        <asp:Button ID="btnUpdate" runat="server" Text="Update" />
                    </div>
                </asp:Panel>
                <asp:RoundedCornersExtender ID="PanelSelectText_RoundedCornersBtnSearch" runat="server" Enabled="True" TargetControlID="PanelSelectText">
                </asp:RoundedCornersExtender>
            </td>
            <td></td>
        </tr>
    </table>
      
</body>
</html>
</asp:Content>

