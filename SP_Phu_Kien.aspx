<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SP_Phu_Kien.aspx.cs" Inherits="SP_Phu_Kien" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="StyleSheet/SP_A_Sty.css" rel="stylesheet" />
    <link href='https://css.gg/phone.css' rel='stylesheet' />
    <link href='https://css.gg/sync.css' rel='stylesheet' />
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
             <div id="main1">
        <div id="top1">
            
        </div>
        <div id="left1">
            .
        </div>
        <div id="content1">
            <div id="content_Content1">
                <div id="content_Content1_content">
                    <div id="content_Content1_content_left">
                        <asp:DataList ID="DataList1" runat="server" RepeatColumns="1">
                            <ItemTemplate>
                                <asp:Image ID="Image3" runat="server" ImageUrl='<%# Eval("hinhSP") %>' Width="320px" Height="300px" />
                                <br />
                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("khaiNiemSP") %>'></asp:Label>
                                <br />
                                </ItemTemplate>
                            </asp:DataList>
                       </div>
                    <div id="content_Content1_content_content" >
                        <br /><br />
                        <asp:DataList ID="DataList2" runat="server" RepeatColumns="1">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("tenSP") %>' Font-Size="20" Font-Bold="true"></asp:Label>
                                <br /><br />
                                <b style="font-size:20px">Tình Trạng:</b>&nbsp;
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("tinhTrang") %>' ForeColor="Red" Font-Size="16"></asp:Label>
                                <br />
                                <asp:Image ID="Image2" runat="server" ImageUrl="~/imp/sao.PNG" />
                                <br /><br /><br />
                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("donGia") %>' Font-Size="20" ForeColor="Red"></asp:Label><b style="font-size:20px; color:red">VND</b>
                                <br /><br /><br />
                            </ItemTemplate>
                        </asp:DataList>                     
                        <asp:Button ID="btnThemVaoGioHang" runat="server" Text="THÊM VÀO GIỎ HÀNG" OnClick="btnThemVaoGioHang_Click" Font-Bold="true" BackColor="Red" ForeColor="White" Width="220" Height="40"></asp:Button> <br /><br />                                                            
                        <br /><br />
                        <i class="gg-phone" style="font-size:20px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;033344400</i>
                        <br />
                        <i class="gg-phone" style="font-size:20px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;034443330</i>
                        <br />
                        
                    </div>
                    <div id="content_Content1_content_bottom1" style="text-align:center">
                        <div id="content_Content1_content_bottom1_left">
                            <br /><br />
                        </div>
                        <div id="content_Content1_content_bottom1_content">                          
                            <br /><br />
                        </div>
                        <div id="content_Content1_content_bottom1_right">
                            <br /><br />
                        </div>
                        <div id="content_Content1_content_bottom1_bottom" style="text-align:left;font-size:18px">
                             <br /><br /><br />
                            <asp:DataList ID="DataList3" runat="server" RepeatColumns="1">
                                <ItemTemplate>
                                     Ngoài ra sản phẩm <b> <asp:Label ID="Label13" runat="server" Text='<%# Eval("tenSP") %>'></asp:Label> </b>
                                    còn có thể kết hợp được với 1 số sản phẩm khác nữa để tăng hiệu quả, bạn có thể gọi cho chúng tôi 
                                     qua số 033344400 hoặc 034443330 để được tư vấn thêm <br /> <br /><br /><br />
                                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("tenCachDung") %>' Font-Size="20" ForeColor="red"></asp:Label><br /><br /><br />
                                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("cachDung") %>'></asp:Label><br />
                                </ItemTemplate>
                            </asp:DataList>
                        </div>
                    </div>
                    
                </div>
                <div id="content_Content1_right">
                    <asp:Image ID="Image5" runat="server" ImageUrl="~/hinh/cam_Ket.jpg" Width="100px" Height="100px" />
                    <br />
                    <b style="padding: 0px; margin-left: 0px; margin-right: 0px; margin-bottom: 0px; color: rgb(0, 0, 0); font-family: &quot;Times New Roman&quot;; font-size: medium; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: center; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">
                        Cam kết hàng chất lượng 100%, phát hiện hàng giả đền 100 lần, giá tốt nhất, ship toàn quốc nhanh nhất, 
                        đặt hàng siêu nhanh chỉ mất 20 giây</b>
                    <table border="1" style="background-color:#f8f2b8;text-align:left">
                        <tr>
                            <td class="auto-style27"><img  src="./imp/ship.png" style="width:52px; height:40px;"/></td>
                            <td style="padding-left:20px;">
                                <h4>Giao hàng toàn quốc</h4>
                                Nhận hàng & thanh toán tiền tại nhà, ship hàng siêu nhanh
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style27"><img  src="./imp/doiTraHang.png" style="width:40px;height:40px;"/></td>
                            <td style="padding-left:20px;">
                                <h4>Đổi trả nhanh gọn</h4>
                                Đổi trả hàng trong vòng 30 ngày, chấp nhận bất kỳ lý do
                            </td>
                        </tr>
                        
                        <tr>
                            <td class="auto-style27"><img  src="./imp/dienThoai.png" style="width:40px;height:40px;"/></td>
                            <td style="padding-left:20px;">
                                <h4>Tư vấn nhiệt tình</h4>     
                                Đội ngũ chuyên viên tư vấn có kiến thức chuẩn và body đẹp
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <div id="right1">
            .
        </div>
    </div>    
</asp:Content>

