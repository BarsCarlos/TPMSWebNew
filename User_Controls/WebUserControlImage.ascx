<%@ Control Language="C#" AutoEventWireup="true" CodeFile="WebUserControlImage.ascx.cs" Inherits="User_Controls_WebUserControlImage" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Image</title>
    <link rel="stylesheet" type="text/css"  runat="server" href="~/Css/StyleSheet.css" />
</head>
<body>
    <form id="form1">
        <asp:Timer ID="Timer1" runat="server" ></asp:Timer>
    <div class="container">
        <div class="container" style="height: 72px; width: 101px">
            <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/loading.gif" Height="72px" Width="100px" />
        </div>
    </div>
    </form>
</body>
</html>