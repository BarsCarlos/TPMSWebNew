<%@ Page Title="Login"  EnableEventValidation="false" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>

    <!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Login</title>
    <link rel="stylesheet" type="text/css"  runat="server" href="~/Css/StyleSheet.css" />

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
    <form id="form1">
    <div>
        <table width="100%">
            <tr>
                <td align="right">
                    
                </td>
                <td>
                </td>
                <td></td>
            </tr>
            <tr>
                <td align="right">
                 
                </td>
                <td  align="center">
                    <asp:Panel ID="PanelLogin" runat="server" BorderStyle="Solid" HorizontalAlign="Center" Width="350px" Height="215px" BackColor="#F8FFE8">
                        <br />
                        <img  src="../Images/KeyImg.jpg" style="height: 52px; width: 82px"></img>
                        <br />
                        <asp:Label ID="lblMakeSelect" runat="server" Text="Make-Selection:"></asp:Label>
                        <asp:DropDownList ID="drpSelection" runat="server" OnSelectedIndexChanged="drpSelection_SelectedIndexChanged">
                        <asp:ListItem>TPMS</asp:ListItem>
                        <asp:ListItem>PAMS</asp:ListItem>
                        </asp:DropDownList>
                        <br />
                        <br />
                            <asp:Label ID="lblUsrName" runat="server" Text="User-Name:"></asp:Label>
                            <asp:TextBox ID="txtUsrName" runat="server"></asp:TextBox>
                            <asp:FilteredTextBoxExtender ID="txtUsrName_FilteredTextBoxExtender" runat="server" Enabled="True" FilterType="LowercaseLetters" TargetControlID="txtUsrName">
                            </asp:FilteredTextBoxExtender>
                        <br />
                        <asp:Label ID="lblPassword" runat="server" Text="Password:"></asp:Label>&nbsp;&nbsp;
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:FilteredTextBoxExtender ID="txtPassword_FilteredTextBoxExtender" runat="server" Enabled="True" FilterType="LowercaseLetters" TargetControlID="txtPassword">
                        </asp:FilteredTextBoxExtender>
                        <hr />
                        <asp:Button ID="btnLogin" runat ="server" Text="Login" OnClick="btnLogin_Click" OnClientClick="return BeforePostBack()" />
                      
                    </asp:Panel>
                    <asp:RoundedCornersExtender ID="PanelLogin_RoundedCornersLogin" runat="server" Enabled="True" TargetControlID="PanelLogin">
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

