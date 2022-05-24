<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Them_Xoa_Sua_SP.aspx.cs" Inherits="Them_Xoa_Sua_SP" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="StyleSheet/Home.css" rel="stylesheet" />
    <link href="StyleSheet/themxoasua.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="main">
        <div id="top">
            .
        </div>
        <div id="left">
            .
        </div>

        <div id="content">
            <asp:MultiView ID="MultiView1" runat="server">
                <asp:View ID="View1" runat="server">
                    <table>
                               <tr>
                                   <td >
                                       <div style="margin-left:200px">
                                            <h2 style="color:#0026ff;margin-left:50px">Đăng Nhập tài khoản ADMIN</h2>
                                           <br /><br />
                                           <b>
                                           Tên đăng nhập:<br />
                                           <asp:TextBox ID="txTenTK" runat="server"  Width="295px" Height="30px"></asp:TextBox>
                                                             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txTenTK" 
                                                                 ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="Login1">
                                                                 Bạn chưa nhập tên đăng nhập</asp:RequiredFieldValidator><br />

                                           Mật khẩu:<br />
                                           <asp:TextBox ID="txMatKhau" runat="server" TextMode="Password"  Width="295px" Height="30px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txMatKhau" 
                                                                 ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="Login1">
                                                                 Phải nhập mật khẩu</asp:RequiredFieldValidator><br />

                                           </b><br />
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

                <asp:View ID="View_Them" runat="server">
                    <div>
                        <h3>Vui Long chọn tác vụ bạn muốn làm</h3>
                        <table>
                            <tr>
                                <td>
                                    <asp:Button ID="Button1" runat="server" Text="Thêm sản phẩm" OnClick="btTrangThem_Click"  />
                                </td>
                                <td>
                                    <asp:Button ID="Button2" runat="server" Text="Sửa sản phẩm" OnClick="btTrangSua_Click"  />
                                </td>
                                 <td>
                                    <asp:Button ID="Button3" runat="server" Text="Xóa sản phẩm" OnClick="btTrangXoa_Click"  />
                                </td>
                            </tr>
                        </table>
                    </div>

                    <div id="content1">
                        <div id="content_L1">
                    <div >
                         <h1 style="margin-left:50px">Thêm Sản phẩm</h1>
                            <br /><br />
                        <b>
                        Mã Sản phẩm<br />
                        <asp:TextBox ID="txMaSP" runat="server" Width="295px" Height="30px"></asp:TextBox><br />
                            
                        <br />
                        Tên sản phẩm<br />
                        <asp:TextBox ID="txTenSP" runat="server" Width="295px" Height="30px"></asp:TextBox><br />
                            
                        <br /><br />
                        Đơn giá<br />
                        <asp:TextBox ID="txDonGia" runat="server" Width="295px" Height="30px"></asp:TextBox><br />
                            
                        <br />
                        Số lượng<br />
                        <asp:TextBox ID="txSoLuong" runat="server" Width="295px" Height="30px"></asp:TextBox><br />
                            
                        <br />
                        Xuất Sứ<br />
                        <asp:TextBox ID="txXuatSu" runat="server" Width="295px" Height="30px"></asp:TextBox>                           
                        <br /><br />
                        Trọng lượng<br />
                        <asp:TextBox ID="txTrongLuong" runat="server" Width="295px" Height="30px"></asp:TextBox><br />
                        <br />
                        Tinh trạng<br />
                        <asp:DropDownList ID="DropDow_TinhTrang" runat="server" Height="30px" Width="295px">
                            <asp:ListItem>Đang kinh doanh</asp:ListItem>
                            <asp:ListItem>Chưa có bán</asp:ListItem>
                         </asp:DropDownList>
                        <br />
                        Loại<br />
                        &nbsp;&nbsp;Ghi chú:<br />
                            &nbsp;&nbsp;&nbsp;&nbsp;LH01 => Tăng cân nhanh<br />
                            &nbsp;&nbsp;&nbsp;&nbsp;LH02 => Whey Protein Blend<br />
                            &nbsp;&nbsp;&nbsp;&nbsp;LH03 => Whey Protein Isolate<br />
                            &nbsp;&nbsp;&nbsp;&nbsp;LH04 => Hydrolyzed Whey<br />
                            &nbsp;&nbsp;&nbsp;&nbsp;LH05 => Meal Replacement<br />
                            &nbsp;&nbsp;&nbsp;&nbsp;LH06 => Sinh nhiệt đốt mỡ<br />
                            &nbsp;&nbsp;&nbsp;&nbsp;LH07 => Ít chất kích thích<br />
                            &nbsp;&nbsp;&nbsp;&nbsp;<br />
                       
                        <asp:DropDownList ID="DropDow_Loai" runat="server" Height="30px" Width="295px">
                            <asp:ListItem>LH01</asp:ListItem>
                            <asp:ListItem>LH02</asp:ListItem>
                            <asp:ListItem>LH03</asp:ListItem>
                            <asp:ListItem>LH04</asp:ListItem>
                            <asp:ListItem>LH05</asp:ListItem>
                            <asp:ListItem>LH06</asp:ListItem>
                            <asp:ListItem>LH07</asp:ListItem>
                        </asp:DropDownList>
                        <br /><br />
                        Hinh Sản phẩm:<br />
                        <asp:FileUpload ID="FileUpload_Hinh" runat="server" Width="290px" /><br /><br />
                    </b>
                        <asp:Button ID="btThem_SP" runat="server" Text="Thêm SP" OnClick="btThem_SP_Click" />
                        <br /><br />
                    </div> 
                    </div>
                    <div id="content_R1">
                            <div >
                                <asp:Button ID="Button11" runat="server" Text="Reset lại bảng" OnClick="btTrangThem_Click"  />
                                <br /><br /><br />
                                <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" CellPadding="3" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellSpacing="2">
                                     <Columns>
                                         <asp:BoundField DataField="MaSP" HeaderText="Mã" />
                                         <asp:BoundField DataField="tenSP" HeaderText="Tên" />
                                         <asp:ImageField DataImageUrlField="hinhSP" HeaderText="Hinh" ControlStyle-Width="80px" ControlStyle-Height="80px">
                                             <ControlStyle Height="80px" Width="80px" />
                                         </asp:ImageField>
                                         <asp:BoundField DataField="donGia" HeaderText="Đơn giá" />
                                         <asp:BoundField DataField="xuatSu" HeaderText="Xuất xứ" />
                                         <asp:BoundField DataField="soLuong" HeaderText="Số lượng" />
                                         <asp:BoundField DataField="trongLuong" HeaderText="Trọng lượng" />
                                         <asp:BoundField DataField="tinhTrang" HeaderText="Tính trạng" />
                                         <asp:BoundField DataField="MaLoai" HeaderText="Mã Loại" />
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
                                <br /><br /><br />
                            </div>
                        </div>
                 </div>   
                </asp:View>

                <asp:View ID="View_Sua" runat="server">
                    <div>
                        <h3>Vui Long chọn tác vụ bạn muốn làm</h3>
                        <table>
                            <tr>
                                <td>
                                    <asp:Button ID="Button4" runat="server" Text="Thêm sản phẩm" OnClick="btTrangThem_Click"  />
                                </td>
                                <td>
                                    <asp:Button ID="Button5" runat="server" Text="Sửa sản phẩm" OnClick="btTrangSua_Click"  />
                                </td>
                                 <td>
                                    <asp:Button ID="Button6" runat="server" Text="Xóa sản phẩm" OnClick="btTrangXoa_Click"  />
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div id="content1">
                        <div id="content_L1">
                          <div >
                             <h1 style="margin-left:50px">Sửa Sản phẩm</h1>
                             <br />
                             <table border="1">
                                 <tr>
                                     <td colspan="2" style="text-align:center">
                                         <h3>Tìm Sản phẩm muốn sửa</h3>
                                         (Tên hoặc mã sản phẩm)
                                     </td>
                                 </tr>
                                 <tr>
                                     <td>
                                         Mã sản phẩm:
                                     </td>
                                     <td>
                                         <asp:TextBox ID="txMaSP_sua" runat="server" Width="295px" Height="30px"></asp:TextBox>
                                     </td>
                                 </tr>
                                 <tr>
                                     <td>
                                         tên sản phẩm:
                                     </td>
                                     <td>
                                         <asp:TextBox ID="txTenSP_sua" runat="server" Width="295px" Height="30px"></asp:TextBox>
                                     </td>
                                 </tr>
                                 <tr>
                                     <td colspan="2" style="text-align:center">
                                         <asp:Button ID="btHienThiSP" runat="server" Text="Hiện thị SP" OnClick="btHienThiSP_Click" />                                       
                                     </td>
                                 </tr>
                             </table>
                              <br /><br />
                              
                                <table border="1">
                                  <tr>
                                      <td colspan="2" style="text-align:center">
                                          <h3>Sửa sản phẩm</h3>
                                      </td>
                                  </tr>
                                  <tr>
                                      <td>
                                          Mã:
                                      </td>
                                      <td>
                                          <asp:DataList ID="DataList1" runat="server">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("MaSP") %>' Width="295px" Height="30px"></asp:Label>
                                            </ItemTemplate>
                                         </asp:DataList>
                                      </td>
                                  </tr>
                                  <tr>
                                      <td>
                                          Tên:
                                      </td>
                                      <td>
                                          <asp:TextBox ID="txTenSP_MuonSua" runat="server"  Width="295px" Height="30px"></asp:TextBox>
                                      </td>
                                  </tr>
                                  <tr>
                                      <td>
                                          Đơn giá:
                                      </td>
                                      <td>
                                          <asp:TextBox ID="txDonGia_MuonSua" runat="server"  Width="295px" Height="30px"></asp:TextBox>
                                      </td>
                                  </tr>
                                  <tr>
                                      <td>
                                          Số lượng:
                                      </td>
                                      <td>
                                          <asp:TextBox ID="txSoLuong_MuonSua" runat="server"  Width="295px" Height="30px"></asp:TextBox>
                                      </td>
                                  </tr>
                                  <tr>
                                      <td>
                                          Xuất xứ:
                                      </td>
                                      <td>
                                          <asp:TextBox ID="txXuatXu_MuonSua" runat="server"  Width="295px" Height="30px"></asp:TextBox>
                                      </td>
                                  </tr>
                                  <tr>
                                      <td>
                                          Trọng lượng:
                                      </td>
                                      <td>
                                          <asp:TextBox ID="txTrongLuong_MuonSua" runat="server"  Width="295px" Height="30px" Text=""></asp:TextBox>
                                      </td>
                                  </tr>

                                    <tr>
                                        <td>
                                            Tinh trạng<br />
                                        </td>
                                        <td>
                                            <asp:DropDownList ID="DropDownList_TinhTrang_MuonSua" runat="server" Height="30px" Width="295px">
                                                <asp:ListItem></asp:ListItem>
                                                <asp:ListItem>Đang kinh doanh</asp:ListItem>
                                                <asp:ListItem>Chưa có bán</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>

                                  <tr>
                                      <td>
                                          Mã Loại:
                                      </td>
                                      <td>
                                          &nbsp;&nbsp;Ghi chú:<br />
                                            &nbsp;&nbsp;&nbsp;&nbsp;LH01 => Tăng cân nhanh<br />
                                            &nbsp;&nbsp;&nbsp;&nbsp;LH02 => Whey Protein Blend<br />
                                            &nbsp;&nbsp;&nbsp;&nbsp;LH03 => Whey Protein Isolate<br />
                                            &nbsp;&nbsp;&nbsp;&nbsp;LH04 => Hydrolyzed Whey<br />
                                            &nbsp;&nbsp;&nbsp;&nbsp;LH05 => Meal Replacement<br />
                                            &nbsp;&nbsp;&nbsp;&nbsp;LH06 => Sinh nhiệt đốt mỡ<br />
                                            &nbsp;&nbsp;&nbsp;&nbsp;LH07 => Ít chất kích thích<br />
                                            &nbsp;&nbsp;&nbsp;&nbsp;<br />
                                          <asp:DropDownList ID="DropDownList_MaLoai_MuonSua" runat="server" Height="30px" Width="295px">
                                                <asp:ListItem></asp:ListItem>
                                                <asp:ListItem>LH01</asp:ListItem>
                                                <asp:ListItem>LH02</asp:ListItem>
                                                <asp:ListItem>LH03</asp:ListItem>
                                                <asp:ListItem>LH04</asp:ListItem>
                                                <asp:ListItem>LH05</asp:ListItem>
                                                <asp:ListItem>LH06</asp:ListItem>
                                                <asp:ListItem>LH07</asp:ListItem>
                                          </asp:DropDownList>
                                      </td>
                                  </tr>
                                  <tr>
                                      <td colspan="2" style="text-align:center">
                                          <asp:Button ID="btSuaSP" runat="server" Text="Sửa sản phẩm" OnClick="btSuaSP_Click" />
                                      </td>
                                  </tr>
                              </table>                                                     
                        </div>
                        </div>
                        <div id="content_R1">
                            <div >
                                <asp:Button ID="btReset" runat="server" Text="Reset lại bảng" OnClick="btTrangSua_Click" />
                                <br /><br /><br />
                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="3" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellSpacing="2">
                                     <Columns>
                                         <asp:BoundField DataField="MaSP" HeaderText="Mã" />
                                         <asp:BoundField DataField="tenSP" HeaderText="Tên" />
                                         <asp:ImageField DataImageUrlField="hinhSP" HeaderText="Hinh" ControlStyle-Width="80px" ControlStyle-Height="80px">
                                             </asp:ImageField>
                                         <asp:BoundField DataField="donGia" HeaderText="Đơn giá" />
                                         <asp:BoundField DataField="xuatSu" HeaderText="Xuất xứ" />
                                         <asp:BoundField DataField="soLuong" HeaderText="Số lượng" />                                    
                                         <asp:BoundField DataField="trongLuong" HeaderText="Trọng lượng" />
                                         <asp:BoundField DataField="tinhTrang" HeaderText="Tính trạng" />
                                         <asp:BoundField DataField="MaLoai" HeaderText="Mã Loại" />
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
                                <br /><br /><br />
                            </div>
                        </div>
                    </div>                          
                </asp:View>

                <asp:View ID="View_Xoa" runat="server">
                    <div>
                        <h3>Vui Long chọn tác vụ bạn muốn làm</h3>
                        <table>
                            <tr>
                                <td>
                                    <asp:Button ID="Button7" runat="server" Text="Thêm sản phẩm" OnClick="btTrangThem_Click"  />
                                </td>
                                <td>
                                    <asp:Button ID="Button8" runat="server" Text="Sửa sản phẩm" OnClick="btTrangSua_Click"  />
                                </td>
                                 <td>
                                    <asp:Button ID="Button9" runat="server" Text="Xóa sản phẩm" OnClick="btTrangXoa_Click"  />
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div id="content2">
                        <div id="content_L2">
                          <div >
                             <h1 style="margin-left:50px">Xóa Sản phẩm</h1>
                             <br />
                             <table border="1">
                                 <tr>
                                     <td colspan="2" style="text-align:center">
                                         <h3>Tìm Sản phẩm muốn Xóa</h3>
                                         (Tên hoặc mã sản phẩm)
                                     </td>
                                 </tr>
                                 <tr>
                                     <td>
                                         Mã sản phẩm:
                                     </td>
                                     <td>
                                         <asp:TextBox ID="txMaSP_xoa" runat="server" Width="295px" Height="30px"></asp:TextBox>
                                     </td>
                                 </tr>
                                 <tr>
                                     <td>
                                         tên sản phẩm:
                                     </td>
                                     <td>
                                         <asp:TextBox ID="txTenSP_xoa" runat="server" Width="295px" Height="30px"></asp:TextBox>
                                     </td>
                                 </tr>
                                 <tr>
                                     <td colspan="2" style="text-align:center">
                                         <asp:Button ID="btHienThi_Xoa" runat="server" Text="Hiện thị SP" OnClick="btHienThi_Xoa_Click"  />                                       
                                     </td>
                                 </tr>
                             </table>
                              <br /><br />
                            </div>
                            <br /><br />
                          <table border="1">
                                  <tr>
                                      <td colspan="2" style="text-align:center">
                                          <h3>Xóa sản phẩm</h3>
                                      </td>
                                  </tr>
                                  <tr>
                                      <td>
                                          Mã:
                                      </td>
                                      <td>
                                          <asp:DataList ID="DataList2" runat="server">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("MaSP") %>' Width="295px" Height="30px"></asp:Label>
                                            </ItemTemplate>
                                         </asp:DataList>
                                      </td>
                                  </tr>
                                  <tr>
                                      <td>
                                          Tên:
                                      </td>
                                      <td>
                                          <asp:DataList ID="DataList3" runat="server">
                                            <ItemTemplate>
                                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("tenSP") %>'  Width="295px" Height="30px"></asp:Label>
                                            </ItemTemplate>
                                         </asp:DataList>
                                      </td>
                                  </tr> 
                                   <tr>
                                       <td>

                                       </td>
                                       <td >
                                           <asp:TextBox ID="TextBox2" runat="server" Width="295px" Height="30px"></asp:TextBox>
                                       </td>
                                   </tr>                              
                                  <tr>
                                      <td colspan="2" style="text-align:center">
                                          <asp:Button ID="btXoaSP" runat="server" Text="Xóa sản phẩm" OnClick="btXoaSP_Click"  />
                                      </td>
                                  </tr>
                              </table>
                         </div>
                        <div id="content_R2">

                            <div >
                                <asp:Button ID="Button10" runat="server" Text="Reset lại bảng" OnClick="btTrangXoa_Click" />
                                <br /><br /><br />
                                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="3" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellSpacing="2">
                                     <Columns>
                                         <asp:BoundField DataField="MaSP" HeaderText="Mã" />
                                         <asp:BoundField DataField="tenSP" HeaderText="Tên" />
                                         <asp:ImageField DataImageUrlField="hinhSP" HeaderText="Hinh" ControlStyle-Width="80px" ControlStyle-Height="80px">
                                             </asp:ImageField>
                                         <asp:BoundField DataField="donGia" HeaderText="Đơn giá" />
                                         <asp:BoundField DataField="xuatSu" HeaderText="Xuất xứ" />
                                         <asp:BoundField DataField="soLuong" HeaderText="Số lượng" />                                    
                                         <asp:BoundField DataField="trongLuong" HeaderText="Trọng lượng" />
                                         <asp:BoundField DataField="tinhTrang" HeaderText="Tính trạng" />
                                         <asp:BoundField DataField="MaLoai" HeaderText="Mã Loại" />
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
                                <br /><br /><br />
                            </div>
                        </div>  
                      </div>             
                </asp:View>              
            </asp:MultiView>
            
        </div>

        <div id="right">
            .
        </div>
    </div>
</asp:Content>

