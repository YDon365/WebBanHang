<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Tim_Kiem_SP.aspx.cs" Inherits="hien_Thi_SP" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="StyleSheet/GioiThieu.css" rel="stylesheet" />
   <style type="text/css">
       .auto-style27 {
           width: 100%;
           text-align:center;
       }
       .auto-style28 {
           color:red;
           /*hien_Thi_SP*/
       }
       </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="main">
        <div id="top" style="margin-left:100px;margin-right:230px">
        </div>

        <div id="left">
            <br />
            <h2>Mục sản phẩm</h2><br /><br />
            <asp:TreeView ID="TreeView1" runat="server">
                <Nodes>
                    <asp:TreeNode Text="Mass" Value="Mass">
                            <asp:TreeNode Text="Tăng cân nhanh" Value="tang can nhanh"  NavigateUrl="~/MN_1_Tang_Can_Nhanh.aspx"></asp:TreeNode>                           
                    </asp:TreeNode>

                    <asp:TreeNode Text="Whey Protein" Value="whey protein">
                            <asp:TreeNode Text="Whey Protein Blend" Value="Whey Protein Blend" NavigateUrl="~/MN_2_1_Whey_Protein_Blend.aspx"></asp:TreeNode>
                            <asp:TreeNode Text="Whey Protein Isolate" Value="Whey Protein Isolate" NavigateUrl="~/MN_2_2_Whey_Protein_Isolate.aspx"></asp:TreeNode>
                            <asp:TreeNode Text="Hydrolyzed Whey" Value="Hydrolyzed Whey" NavigateUrl="~/MN_2_3_Whey_Hydrolyzed.aspx"></asp:TreeNode>
                            <asp:TreeNode Text="Meal Replacement" Value="Meal Replacement" NavigateUrl="~/MN_2_4_Whey_Meal_Replacement.aspx"></asp:TreeNode>
                    </asp:TreeNode>

                    <asp:TreeNode Text="Giảm cân đốt mỡ" Value="Giảm cân đốt mỡ">
                            <asp:TreeNode Text="Sinh nhiệt đốt mỡ" Value="Sinh nhiệt đốt mỡ" NavigateUrl="~/MN_3_1_GM_Sinh_Nhiet_Dot_Mo.aspx"></asp:TreeNode>
                            <asp:TreeNode Text="Ít chất kích thích" Value="Ít chất kích thích" NavigateUrl="~/MN_3_2_GM_It_Chat_Kich_Thich.aspx"></asp:TreeNode>
                    </asp:TreeNode>
                 
                    <asp:TreeNode Text="Phụ kiện Gym" Value="Phụ kiện Gym">
                            <asp:TreeNode Text="Bình lắc" Value="Bình lắc" NavigateUrl="~/MN_4_1_Binh_Lac.aspx"></asp:TreeNode>
                            <asp:TreeNode Text="Phụ kiện khác" Value="Phụ kiện khác" NavigateUrl="~/MN_4_2_Phu_Kien_Khac.aspx"></asp:TreeNode>
                    </asp:TreeNode>
                </Nodes>
            </asp:TreeView>
        </div>

        <div id="content">
            <h2>Thông tin Tìm kiếm được</h2>
            <br />          
            <b style="color:#808080">________________________________________________________________________________________</b><br />
          
            <asp:DataList ID="DataList1" runat="server" RepeatColumns="3" DataSourceID="timSP" >
                <ItemTemplate>
                    <a href='SP_Chi_Tiet_SP.aspx?ID=<%#Eval("MaSP")%>' style="list-style-type:none;text-decoration: none;">
                        <table class="auto-style27">
                        <tr>
                            <td><asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("hinhSP", "{0}") %>' width="280px" height="250px" /></td>
                            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        </tr>
                        <tr>
                            <td><asp:Label ID="Label1" runat="server" Text='<%# Eval("tenSP", "{0}") %>' Font-Size="20px"></asp:Label></td>
                            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        </tr>
                        <tr>
                            <td><asp:Image ID="Image2" runat="server" ImageUrl="~/imp/sao.PNG"/></td>
                            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        </tr>
                        <tr>
                            <td><asp:Label ID="Label2" runat="server" Text='<%# Eval("donGia", "{0}") %>' CssClass="auto-style28" Font-Size="20px"></asp:Label>&nbsp; <b style="color:red">VND</b> 
                                <br />
                            </td>
                            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        </tr>
                    </table>

                    </a>
                    
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="timSP" runat="server" ConnectionString="<%$ ConnectionStrings:QL_THUCPHAMConnectionString %>" > <%--SelectCommand="SELECT * FROM [SANPHAM] WHERE ([tenSP] = @tenSP)"--%>
                <SelectParameters>
                    <asp:QueryStringParameter Name="tenSP" QueryStringField="search" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="timKiem_SP" runat="server" ConnectionString="<%$ ConnectionStrings:strcon %>"></asp:SqlDataSource>
            <br />
            <div >
              
                 <b style="color:#808080">________________________________________________________________________________________</b><br /><br />
               <h3 >Tin tức</h3><br /><br />

                <div id="content_Left" style="text-align:center">
                    <a href="AA_Cach_Tang_Vong_1_Cho_Nu.aspx"><img src="./imp/tang_Vong_1_Nu.PNG" style="width:200px; height:100px" /></a> <br /><br />
                    <a href="AA_tap_Gym_Khong_Nen_An_Gi.aspx"><img src="./imp/tang_Can_Khong_Nen_An_Gi.PNG" style="width:200px; height:100px" /></a><br /><br />                       
                    <a href="AA_Thuc_Don_Tang_Giam_Mo_7_Ngay.aspx"><img src="./imp/thuc_Don_Giam_Mo_7_Ngay.PNG" style="width:200px; height:100px" /></a><br /><br />
                </div>
                <div id="content_Right" style="font-size:18px;">
                    <a href="AA_Cach_Tang_Vong_1_Cho_Nu.aspx">10 cách tăng vòng 1 cho nữ tự nhiên và hiệu quả</a> <br /><br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Tăng kích thước vòng 1 không khó nếu như bạn biết phương pháp chính xác.
                     Top 10 cách tăng vòng 1 cho nữ tự nhiên và siêu hiệu quả sau sẽ giúp bạn.
                    <br /><br />

                    <a href="AA_tap_Gym_Khong_Nen_An_Gi.aspx">Tập Gym không nên ăn gì? 7 thực phẩm Gymer cần tránh xa</a> <br /><br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Tập Gym không nên ăn gì? 1 điều mà anh em tập thể hình cần cực kỳ lưu ý 
                    khi bắt đầu luyện tập và về dinh dưỡng, về những thực phẩm mà bạn nên cũng như không nên ăn. Cùng tìm hiểu nhé.
                    <br /><br />
              
                    <a href="AA_Thuc_Don_Tang_Giam_Mo_7_Ngay.aspx">Thực đơn tăng cơ giảm mỡ 7 ngày cho người tập thể hình</a> <br /><br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Nếu biết cách kết hợp giữa tập luyện và thực đơn tăng cơ giảm mỡ thì bạn sẽ rất
                    nhanh sở hữu được thân hình săn chắc, đẹp chuẩn như ý. Tham khảo ngay thực đơn chi tiết trong 7 ngày sau.

                </div>    
           </div><br />

        </div>

        <div id="right">
            
        </div>

    </div>
</asp:Content>

