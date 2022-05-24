<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="StyleSheet/Home.css" rel="stylesheet" />
    <style type="text/css">
       .auto-style27 {
           width: 100%;
           text-align:center;
           margin-left:40px;
       }
       </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table>
        <tr >
            <td>
      <div id="main">
       <div id="top">
          
       </div>
       <div id="left" style="margin-top:200px">
           .
       </div>
       <div id="content">
           <div id="content_Top">
               <table>
             <tr >
                   <td>
                       <table>
                           <tr>
                               <td >
                                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                   <img  src="./imp/ship.png" style="width:40px;height:40px;"/>
                               </td>
                               <td style="font-size:17px;">
                                   &nbsp;&nbsp;&nbsp;SHIP COD TOÀN QUỐC<br />&nbsp;&nbsp;&nbsp;Nhận hàng & thanh toán tiền tại nhà
                               </td>
                           </tr>
                       </table>
                   </td>
                   
                   <td>
                       <table>
                           <tr>
                               <td >
                                   &nbsp;&nbsp;&nbsp;<img  src="./imp/dienThoai.png" style="width:40px;height:40px;"/>
                               </td>
                               <td style="font-size:17px;">
                                   &nbsp;&nbsp;&nbsp;ĐỘI NGŨ TƯ VẤN CHUYÊN SÂU<br />&nbsp;&nbsp;&nbsp;Tư vấn 1 cách bài bản, khoa học nhất
                               </td>
                           </tr>
                       </table>
                   </td>
                   
                   <td>
                       <table>
                           <tr>
                               <td >
                                   &nbsp;&nbsp;&nbsp;<img  src="./imp/doiTraHang.png" style="width:40px;height:40px;"/>
                               </td>
                               <td style="font-size:17px;">
                                   &nbsp;&nbsp;&nbsp;ĐỔI TRẢ VỚI BẤT KỲ LÝ DO<br />&nbsp;&nbsp;&nbsp;Cho phép bạn đổi trả hàng trong 30 ngày
                               </td>
                           </tr>
                       </table>
                   </td>
               </tr>
           </table>
           </div>

           <div id="content_Content" style="background:#ffffff">
               <table>
                   <tr>
                       <td>
                           <a href="MN_1_Tang_Can_Nhanh.aspx" ><img src="imp/home_1.jpg" width="570px"/></a>                        
                       </td>
                       <td>
                           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                       </td>
                       <td>
                           <a href="MN_2_1_Whey_Protein_Blend.aspx"><img src="imp/home_2.png" width="570px"/></a>                          
                       </td>
                   </tr>
               </table>
           </div>
           <div id="content_bottom"  style="background:#ffffff" >
               <h1 style="font-size:35px">----------------------------------------Sản phẩm tốt-------------------------------------------</h1><br /><br />
            <asp:DataList ID="DataList1" runat="server" RepeatColumns="3">
               <ItemTemplate>                   
                    <a href='SP_Chi_Tiet_SP.aspx?ID=<%#Eval("MaSP")%>' style="list-style-type:none;text-decoration: none;">
                        <table class="auto-style27">
                        <tr>
                            <td><asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("hinhSP") %>' width="280px" height="250px" /></td>
                            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        </tr>
                        <tr>
                            <td><asp:Label ID="Label1" runat="server" Text='<%# Eval("tenSP") %>' Font-Size="20px"></asp:Label></td>
                            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        </tr>
                        <tr>
                            <td><asp:Image ID="Image2" runat="server" ImageUrl="~/imp/sao.PNG"/></td>
                            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        </tr>
                        <tr>
                            <td><asp:Label ID="Label2" runat="server" Text='<%#Eval("donGia") %>' CssClass="auto-style28" Font-Size="20px"></asp:Label>&nbsp; <b style="color:red">VND</b> 
                                <br />
                            </td>
                            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        </tr>
                            <tr>
                                <td>
<%--                                    <a href='GioHang.aspx?ID=<%#Eval("id") %>'><img src="imp/muaSP.JPG" width="200px" height="50px"/></a><br />&nbsp;<br /> <br />--%>
                                </td>
                            </tr>
                    </table>
                    </a>  
                   </ItemTemplate>
                </asp:DataList>   
                   
           </div>
       </div>

       <div id="right">
           
       </div>
   </div>
            </td>
        </tr>
    </table>
  
</asp:Content>

