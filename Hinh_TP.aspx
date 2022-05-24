<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Hinh_TP.aspx.cs" Inherits="Hinh_TP" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="text-align:center; margin-left:400px">
        
        <asp:DataList ID="DataList1" runat="server">
            <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("hinhTP") %>' Width="600px" Height="700px" />
            </ItemTemplate>
        </asp:DataList>
        
    </div>
    </form>
</body>
</html>
