<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="GioHang.aspx.cs" Inherits="GioHang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="text-align:center">
        <h2>GIỎ HÀNG CỦA BẠN</h2>
        <b style="text-align:center">
            
            <asp:GridView ID="QLGioHang" runat="server" AllowSorting="True" AutoGenerateColumns="False" ShowFooter="True"
                        CellPadding="3" DataKeyNames="MaSP" DataSourceID="DataGIOHANG" Width="100%" AllowPaging="True" 
                        OnRowDataBound="QLGioHang_RowDataBound" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None"
                         BorderWidth="1px" CellSpacing="2">
                        <Columns>                
                            <asp:TemplateField HeaderText="Mã SP" InsertVisible="False">
                                <EditItemTemplate>
                                    <asp:Label ID="lblMaSP" runat="server" Text='<%# Eval("MaSP", "{0}") %>' Font-Bold="True"></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbMaSP" runat="server" Text='<%# Eval("MaSP", "{0}") %>' Font-Bold="True"></asp:Label>
                                </ItemTemplate>  
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Tên SP">
                                <EditItemTemplate>
                                   <asp:Label ID="lblTenSP" runat="server" Text='<%# Bind("tenSP", "{0}") %>' Width="200px"></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lbTenSP" runat="server" Text='<%# Bind("tenSP", "{0}") %>' Width="200px"></asp:Label>
                                </ItemTemplate>                                            
                            </asp:TemplateField>    
                            <asp:TemplateField HeaderText="Hình Ảnh">
                                <EditItemTemplate>
                                    <asp:Image ID="imageSP" runat="server" ImageUrl='<%# Eval("hinhSP", "~/{0}") %>' Width="100px" Height="100px"/>                        
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Image ID="imageSP" runat="server" ImageUrl='<%# Eval("hinhSP", "~/{0}") %>' Width="100px" Height="100px"/>                        
                                </ItemTemplate>                    
                            </asp:TemplateField>                                                   
                            <asp:TemplateField HeaderText="Số Lượng">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtSoLuong" runat="server" Text='<%# Bind("soLuongSP", "{0}") %>' Width="75px" TextMode="Number" min="1"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblSoLuong" runat="server" Text='<%# Bind("soLuongSP", "{0}") %>' Width="75px"></asp:Label>
                                </ItemTemplate>                                                                     
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Giá">
                                <EditItemTemplate>
                                    <asp:Label ID="lblGiaBan" runat="server" Text='<%# Eval("donGia") %>' Width="75px"></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblGia" runat="server" Text='<%# Eval("donGia") %>' Width="75px"></asp:Label>
                                </ItemTemplate>                      
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Tổng">
                                <EditItemTemplate>
                                    <asp:Label ID="lblTong" runat="server" Visible="false" Text='<%# Eval("[Tổng tiền]") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblTong" runat="server" Text='<%# Eval("[Tổng tiền]") %>'></asp:Label>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <b>Tổng tiền: </b>
                                    <asp:Label ID="lbltt" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label>
                                </FooterTemplate>                                
                            </asp:TemplateField>
                            <asp:TemplateField ShowHeader="False">                                
                                <EditItemTemplate>
                                    <asp:ImageButton ID="btnCapNhat" runat="server" CausesValidation="True" CommandName="Update" ImageUrl="~/imp/sua.png" Width="20px" Height="20px" ForeColor="White" OnClick="btnCapNhat_Click"></asp:ImageButton>
                                    &nbsp;<asp:ImageButton ID="btnQuayLai" runat="server" CausesValidation="False" CommandName="Cancel" ImageUrl="~/imp/xoa.png" Width="20px" Height="20px"></asp:ImageButton>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:ImageButton ID="btnChinhSua" runat="server" CausesValidation="False" CommandName="Edit" ImageUrl="~/imp/sua.png" Width="20px" Height="20px"></asp:ImageButton>
                                    &nbsp;<asp:ImageButton ID="btnXoa" runat="server" CausesValidation="False" CommandName="Delete" ImageUrl="~/imp/xoa.png" Width="20px" Height="20px" OnClientClick="return confirm('Bạn có chắc chắn là muốn xóa không');" OnClick="btnXoa_Click"></asp:ImageButton>                    
                                </ItemTemplate>                                              
                            </asp:TemplateField>    
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
            <asp:SqlDataSource ID="DataGioHang" runat="server" ConnectionString="<%$ ConnectionStrings:QL_THUCPHAMConnectionString %>" 
                        SelectCommand="select gh.MaKH, gh.MaSP, gh.soLuongSP, sp.tenSP, sp.donGia,h.hinhSP, (sp.donGia*gh.soLuongSP) as N'Tổng tiền' from GIOHANG gh, SANPHAM  sp,HINHSP h where gh.MaSP=sp.MaSP and cheDo=1 and sp.MaSP=h.MaSP and gh.MaKH=@MaKH"
                        UpdateCommand="UPDATE GIOHANG set soLuongSP = @soLuongSP where MaKH = @MaKH and MaSP = @MaSP"
                        DeleteCommand="DELETE GIOHANG where MaKH = @MaKH and MaSP = @MaSP">
                        <DeleteParameters>
                            <asp:Parameter Name="MaSP" Type="String" />
                            <asp:Parameter Name="MaKH" Type="String" />
                        </DeleteParameters>    
                        <UpdateParameters>
                            <asp:Parameter Name="MaSP" Type="String" />
                            <asp:Parameter Name="soLuongSP" Type="Int32" />
                            <asp:Parameter Name="MaKH" Type="String" />  
                        </UpdateParameters>
                        <SelectParameters>
                            <asp:SessionParameter Name="MaKH" SessionField="tenTK" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
            </b>     
        <p style="margin-left:950px"><asp:Button ID="btThanhToan" runat="server" Text="Thành toán" Font-Bold="true" BackColor="Red" ForeColor="White"  OnClick="btThanhToan_Click" Width="213px" Height="39px"/></p>
    </div>
</asp:Content>

