<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="DangNhap.aspx.cs" Inherits="DangNhap" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
                <asp:MultiView ID="MultiView1" runat="server">
                    <asp:View ID="View1" runat="server">
                           <table>
                               <tr>
                                   <td >
                                       <div style="margin-left:300px">
                                            <h2 style="color:#0026ff;margin-left:50px">Thông Tin Đăng Nhập</h2>
                                           <br /><br />
                                           <b>
                                           Tên đăng nhập:<br />
                                           <asp:TextBox ID="txTenTK" runat="server"  Width="295px" Height="30px"></asp:TextBox>
                                                             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txTenTK" 
                                                                 ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="Login1">
                                                                 Bạn chưa nhập tên đăng nhập</asp:RequiredFieldValidator><br /><br />

                                           Mật khẩu:<br />
                                           <asp:TextBox ID="txMatKhau" runat="server" TextMode="Password"  Width="295px" Height="30px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txMatKhau" 
                                                                 ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="Login1">
                                                                 Phải nhập mật khẩu</asp:RequiredFieldValidator><br /><br />

                                           <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                           </b><br />
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                           <asp:LinkButton ID="btQuenMK" runat="server" style="font-size:20px" OnClick="btQuenMK_Click">Quên mật khẩu</asp:LinkButton>
                                           &nbsp;&nbsp;&nbsp;&nbsp;
                                           <a href="DangKy.aspx" style="font-size:20px;color:#0026ff">Đăng ký mới</a><br /><br />
                                           <asp:Button ID="btDangNhap" runat="server" Text="Đăng nhập" ValidationGroup="Login1" OnClick="btDangNhap_Click1" Height="37px" Width="136px" />
                                       </div>
                                   </td>
                                   <td >
                                       <br /><br />
                                        <img src="imp/dangNhapH.jpg" style="height:400px;width:500px" />
                                   </td>
                               </tr>
                           </table>                       
                    </asp:View>
                    <asp:View ID="View2" runat="server"></asp:View>
                </asp:MultiView>
                <br /><br /><br />
</asp:Content>

