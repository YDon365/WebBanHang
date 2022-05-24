<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="DangKy.aspx.cs" Inherits="DangKy" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <asp:MultiView ID="MultiView1" runat="server">
            <asp:View ID="View1" runat="server">
                <table>
                    <tr>
                        <td>
                            <div style="margin-left:300px">
                                <h2 style="color:#0026ff;margin-left:50px">Thông Tin Đăng Nhập</h2>
                                <br /><br />
                                <b>
                                    Tên Đăng Nhập:<br />
                                    <asp:TextBox ID="txTenDK" runat="server" Width="295px" Height="30px"></asp:TextBox><br />
                                            <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="txTenDK" 
                                             ErrorMessage="User Name is required." >
                                             Bạn chưa nhập tên đăng nhập</asp:RequiredFieldValidator><br /><br />

                                    Mật Khẩu:<br />
                                     <asp:TextBox ID="txMatK" runat="server" TextMode="Password"  Width="295px" Height="30px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="txMatK" 
                                             ErrorMessage="Password is required." >
                                             Phải nhập mật khẩu</asp:RequiredFieldValidator><br /><br />

                                    Nhập lại mật khẩu:<br />
                                    <asp:TextBox ID="txNhapLaiMK" runat="server" TextMode="Password"  Width="295px" Height="30px"></asp:TextBox>
                                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="txNhapLaiMK" Operator="Equal"
                                                ControlToCompare="txMatK" ErrorMessage="CompareValidator">
                                                <b style="color:#ff0000">Password Must Match</b> </asp:CompareValidator><br />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txNhapLaiMK" 
                                             ErrorMessage="User Name is required." >
                                             <b style="color:#ff0000">Vui lòng nhập lại mật khẩu</b></asp:RequiredFieldValidator><br /><br />                      
                                </b>                                            
                             </div>
                        </td>                        
                    </tr>
                    <tr>
                        <td>
                            <table>
                    <tr>
                        <td>
                          <div style="margin-left:300px">
                            <h2 style="color:#0026ff;margin-left:50px">Thông Tin Cá Nhân</h2><br /><br />
                                <b>
                                    Họ tên:<br />
                                     <asp:TextBox ID="txHoTen" runat="server"  Width="295px" Height="30px"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txHoTen" 
                                                 ErrorMessage="User Name is required." >
                                                 <b style="color:#ff0000">Bạn chưa nhập họ tên</b></asp:RequiredFieldValidator><br /><br />

                                    Số Điện thoại:<br />
                                    <asp:TextBox ID="txSDT" runat="server" Width="295px" Height="30px" TextMode="Phone"></asp:TextBox><br />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txSDT" 
                                                 ErrorMessage="User Name is required." >
                                                 <b style="color:#ff0000">Nhập số điện thoại</b></asp:RequiredFieldValidator><br /><br />

                                    Địa chỉ:<br />
                                     <asp:TextBox ID="txDiaChi" runat="server" TextMode="MultiLine" Width="295px" Height="30px"></asp:TextBox><br />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txDiaChi" 
                                                 ErrorMessage="User Name is required." >
                                                 <b style="color:#ff0000">Nhập địa chỉ</b></asp:RequiredFieldValidator><br /><br />

                                    Giới tính:<br />
                                    <asp:RadioButtonList ID="radioGioiTinh" runat="server" RepeatColumns="2">
                                                    <asp:ListItem Selected="True">Nam</asp:ListItem>
                                                    <asp:ListItem>Nữ</asp:ListItem>
                                                </asp:RadioButtonList><br />

                                    Email:<br />
                                    <asp:TextBox ID="txEmail" runat="server" TextMode="Email" Width="295px" Height="30px"></asp:TextBox><br />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txEmail" 
                                                 ErrorMessage="User Name is required." >
                                                 <b style="color:#ff0000">Nhập email</b></asp:RequiredFieldValidator><br /><br />

                                    Ngày Sinh:<br />
                                    <asp:TextBox ID="txNgaySinh" runat="server"  Width="295px" Height="30px" TextMode="DateTime"></asp:TextBox><br />
                                                  <asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="CompareValidator"
                                                     ControlToValidate="txNgaySinh" Operator="DataTypeCheck" Type="Date" Text="Enter a Valid Date !">
                                                      <b style="color:red">Nhập đúng ngày sinh</b>
                                                  </asp:CompareValidator><br />
                                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txNgaySinh" 
                                                 ErrorMessage="User Name is required." >
                                                 <b style="color:#ff0000">Nhập ngày sinh</b></asp:RequiredFieldValidator><br />
                                </b>

                                <p style="margin-left:100px">
                                    <asp:Button ID="btDangKy" runat="server" Text="Đăng ký" Width="80px" Height="30px" OnClick="btDangKy_Click"/>
                                </p>
                           </div>
                        </td>                       
                    </tr>
                </table>
                        </td>
                    </tr>
                </table>                                      
            </asp:View>

            <asp:View ID="View2" runat="server">
                <div style="margin-left:200px;font-size:20px">
                    <h2 style="margin-left:100px">Thông tin Của Bạn</h2><br /><br />
                    Tên Đăng nhập: <asp:Label ID="lbTenDN" runat="server" Text=""></asp:Label><br /><br />
                    Mật khẩu: <asp:Label ID="lbMatKhau" runat="server" Text=""></asp:Label><br /><br />
                    Họ Tên: <asp:Label ID="lbHoTen" runat="server" Text=""></asp:Label><br /><br />
                    Điện thoại: <asp:Label ID="lbDienThoai" runat="server" Text=""></asp:Label><br /><br />
                    Địa chỉ: <asp:Label ID="lbDiaChi" runat="server" Text=""></asp:Label><br /><br />
                    Giới tính: <asp:Label ID="lbGioiTinh" runat="server" Text=""></asp:Label><br /><br />
                    Email: <asp:Label ID="lbEmail" runat="server" Text=""></asp:Label><br /><br />
                    Ngày sinh: <asp:Label ID="lbNgaySinh" runat="server" Text=""></asp:Label><br /><br />

                    <asp:Button ID="btXemDonHang" runat="server" Text="Xem đơn hàng đã đặt" Height="30px" OnClick="btXemDonHang_Click" />
                </div>    
            </asp:View>

            <asp:View ID="View3" runat="server">
                <div style="margin-left:200px;font-size:20px">
                    <h2 style="margin-left:100px">Đơn hàng bạn đã đặt</h2><br /><br />
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2">
                        <Columns>
                            <asp:BoundField DataField="MaSP" HeaderText="Mã Sản phẩm" />
                            <asp:BoundField DataField="tenSP" HeaderText="Tên Sản Phẩm" />                     
                            <asp:ImageField DataImageUrlField="hinhSP" HeaderText="Hình" ControlStyle-Width="80px" ControlStyle-Height="80px">
                                      <ControlStyle Height="80px" Width="80px" />
                            </asp:ImageField>
                            <asp:BoundField DataField="soLuongSP" HeaderText="Số lượng" />
                            <asp:BoundField DataField="donGia" HeaderText="Đơn giá" />
                        </Columns>
                        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#FFF1D4" />
                        <SortedAscendingHeaderStyle BackColor="#B95C30" />
                        <SortedDescendingCellStyle BackColor="#F1E5CE" />
                        <SortedDescendingHeaderStyle BackColor="#93451F" />
                    </asp:GridView>
                </div>
            </asp:View>
        </asp:MultiView>
    </div>   
</asp:Content>
