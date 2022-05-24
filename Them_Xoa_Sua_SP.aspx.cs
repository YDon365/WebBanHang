using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;

public partial class Them_Xoa_Sua_SP : System.Web.UI.Page
{
    SqlConnection cn1 = new SqlConnection(WebConfigurationManager.ConnectionStrings["strcon"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((int)Session["Them_Xoa_Sua_SP"] == 0)
        {
            MultiView1.ActiveViewIndex = 0;
        }
        else
        {
            MultiView1.ActiveViewIndex = 1;
        }
        cn1.Open();
        //tao cmd
        String strcmd = "select sp.MaSP,tenSP,hinhSP,donGia,soLuong,xuatSu,trongLuong,tinhTrang,MaLoai from SANPHAM sp, HINHSP h where sp.MaSP=h.MaSP ";//where MaSP='" + txMaSP.Text + "' or tenSP='" + txTenSP + "' ";
        SqlDataAdapter da = new SqlDataAdapter(strcmd, cn1);
        DataSet ds = new DataSet();
        da.Fill(ds);

        GridView1.DataSource = ds.Tables[0];
        GridView1.DataBind();
        GridView2.DataSource = ds.Tables[0];
        GridView2.DataBind();
        GridView3.DataSource = ds.Tables[0];
        GridView3.DataBind();
        cn1.Close();

    }

    protected void btDangNhap_Click1(object sender, EventArgs e)
    {
        cn1.Open();

        SqlCommand cmd = new SqlCommand("select * from KHACHHANG k, QUYEN q where k.MaKH=@tenDN and matKhau=@matKhau and q.MaKH=k.MaKH and tenQuyen=N'Quản trị viên'", cn1);
        cmd.Parameters.AddWithValue("@tenDN", txTenTK.Text);
        cmd.Parameters.AddWithValue("@matKhau", txMatKhau.Text);

        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable ds = new DataTable();
        da.Fill(ds);

        int rs = cmd.ExecuteNonQuery();
        cn1.Close();
        if (ds.Rows.Count == 1)
        {
            Session["TenTK"] = txTenTK.Text;
            MultiView1.ActiveViewIndex = 1;
        }
        else
        {
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "Thông báo", "<script>alert('Tên đăng nhập hoặc mật khẩu không chính xác, vui lòng đăng nhập đúng tài khoản ADMIN.');</script>");
            MultiView1.ActiveViewIndex = 0;

        }

    }

    protected void btTrangThem_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 1;
    }
    protected void btTrangSua_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 2;
    }
    protected void btTrangXoa_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 3;
    }
    
    protected void btThem_SP_Click(object sender, EventArgs e)
    {
        if (txMaSP.Text.Length > 0 && txTenSP.Text.Length > 0 && txDonGia.Text.Length > 0 && txSoLuong.Text.Length > 0 && txXuatSu.Text.Length > 0 && txTrongLuong.Text.Length > 0)
        { 
            SqlCommand kt = new SqlCommand("select * from SANPHAM where MaSP=@maSp or tenSP=@tenSP", cn1);
            kt.Parameters.AddWithValue("@maSp", txMaSP.Text);
            kt.Parameters.AddWithValue("@tenSP", txTenSP.Text);
            SqlDataAdapter sql = new SqlDataAdapter(kt);
            DataTable dt = new DataTable();
            sql.Fill(dt);
            cn1.Open();
            int i = kt.ExecuteNonQuery();
            cn1.Close();

            if (dt.Rows.Count > 0)
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "Thông báo", "<script>alert('Mã sản phẩm hoặc tên sản phẩm đã tồn tại, vui lòng thêm sản phẩm khác.');</script>");
                MultiView1.ActiveViewIndex = 1;
            }
            else
            {

                //sp

                SqlCommand cmd = new SqlCommand("INSERT INTO SANPHAM(MaSP,tenSP,donGia,soLuong,xuatSu,trongLuong,tinhTrang,MaLoai)"
                                                    + "values( @masp,@tensp,@dongia,@sl,@xuatsu,@trongluong,@tinhtrang,@maloai)", cn1);

                cmd.Parameters.AddWithValue("@masp", txMaSP.Text);
                cmd.Parameters.AddWithValue("@tensp", txTenSP.Text);
                cmd.Parameters.AddWithValue("@dongia", txDonGia.Text);
                cmd.Parameters.AddWithValue("@sl", txSoLuong.Text);
                cmd.Parameters.AddWithValue("@xuatsu", txXuatSu.Text);
                cmd.Parameters.AddWithValue("@trongluong", txTrongLuong.Text);
                cmd.Parameters.AddWithValue("@tinhtrang", DropDow_TinhTrang.SelectedValue);
                cmd.Parameters.AddWithValue("@maloai", DropDow_Loai.SelectedValue);
                cn1.Open();
                int rs = cmd.ExecuteNonQuery();
                cn1.Close();

                //hinhsp
                SqlCommand cmd_H = new SqlCommand("INSERT INTO HINHSP(MaSP,hinhSP)" + "values( @masp,@hinhSP)", cn1);
                cmd_H.Parameters.AddWithValue("@masp", txMaSP.Text);
                cmd_H.Parameters.AddWithValue("@hinhSP", FileUpload_Hinh.FileName);
                cn1.Open();
                int rs_h = cmd_H.ExecuteNonQuery();
                cn1.Close();

                //thongtinsp
                SqlCommand cmd_tt = new SqlCommand("INSERT INTO THONGTINSP(MaSP)" + "values( @masp)", cn1);
                cmd_tt.Parameters.AddWithValue("@masp", txMaSP.Text);
                cn1.Open();
                int rs_tt = cmd_tt.ExecuteNonQuery();
                cn1.Close();

                //vitamin
                SqlCommand cmd_vt = new SqlCommand("INSERT INTO VITAMIN(MaSP)" + "values( @masp)", cn1);
                cmd_vt.Parameters.AddWithValue("@masp", txMaSP.Text);
                cn1.Open();
                int rs_vt = cmd_vt.ExecuteNonQuery();
                cn1.Close();

                if (rs == 1 && rs_h == 1 && rs_tt == 1 && rs_vt == 1)
                {
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "Thông báo", "<script>alert('Đã thêm thành công');</script>");
                    txMaSP.Text = "";
                    txTenSP.Text = "";
                    txDonGia.Text = "";
                    txSoLuong.Text = "";
                    txXuatSu.Text = "";
                    txTrongLuong.Text = "";
                    MultiView1.ActiveViewIndex = 1;

                }
            }       
        }
        else
        {
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "Thông báo", "<script>alert('Vui Lòng nhập đầy đủ thông tin!!!!');</script>");
            MultiView1.ActiveViewIndex = 1;
        }
    }
    protected void btHienThiSP_Click(object sender, EventArgs e)
    {
        SqlCommand kt1 = new SqlCommand("select * from SANPHAM where MaSP=@maSp1 ", cn1);
        kt1.Parameters.AddWithValue("@maSp1", txMaSP_sua.Text);
        SqlDataAdapter sql1 = new SqlDataAdapter(kt1);
        DataTable dt1 = new DataTable();
        sql1.Fill(dt1);
        cn1.Open();
        int i1 = kt1.ExecuteNonQuery();
        cn1.Close();

        SqlCommand kt2 = new SqlCommand("select * from SANPHAM where tenSP=@tenSP1", cn1);
        kt2.Parameters.AddWithValue("@tenSP1", txTenSP_sua.Text);
        SqlDataAdapter sql2 = new SqlDataAdapter(kt2);
        DataTable dt2 = new DataTable();
        sql2.Fill(dt2);
        cn1.Open();
        int i2 = kt2.ExecuteNonQuery();
        cn1.Close();

        if (dt1.Rows.Count > 0 && dt2.Rows.Count > 0)
        {
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "Thông báo", "<script>alert('Bạn chỉ được tìm tên hoặc mã, vui lòng tìm 1 trong 2, Tên hoặc mã.Không được tìm cả 2 cùng 1 lúc');</script>");
            MultiView1.ActiveViewIndex = 2;
        }
        else
        {
            SqlCommand kt = new SqlCommand("select * from SANPHAM where MaSP=@maSp or tenSP=@tenSP", cn1);
            kt.Parameters.AddWithValue("@maSp", txMaSP_sua.Text);
            kt.Parameters.AddWithValue("@tenSP", txTenSP_sua.Text);
            SqlDataAdapter sql = new SqlDataAdapter(kt);
            DataTable dt = new DataTable();
            sql.Fill(dt);
            cn1.Open();
            int i = kt.ExecuteNonQuery();
            cn1.Close();

            if (dt.Rows.Count > 0)
            {
                cn1.Open();
                //tao cmd
                String strcmd = "select sp.MaSP,tenSP,hinhSP,donGia,soLuong,xuatSu,trongLuong,tinhTrang,MaLoai from SANPHAM sp, HINHSP h where sp.MaSP=h.MaSP  and (sp.MaSP='" + txMaSP_sua.Text + "' or tenSP='" + txTenSP_sua.Text + "') ";
                SqlDataAdapter da = new SqlDataAdapter(strcmd, cn1);
                DataSet ds = new DataSet();
                da.Fill(ds);

                GridView1.DataSource = ds.Tables[0];
                GridView1.DataBind();
                cn1.Close();

                cn1.Open();
                SqlDataAdapter da_MuonSua = new SqlDataAdapter("select MaSP,tenSP,donGia,soLuong,xuatSu,trongLuong from SANPHAM where MaSP='" + txMaSP_sua.Text + "'  or tenSP='" + txTenSP_sua.Text + "'", cn1);
                DataSet ds_MuonSua = new DataSet();
                da_MuonSua.Fill(ds_MuonSua, "SANPHAM");
                DataList1.DataSource = ds_MuonSua.Tables["SANPHAM"];
                DataList1.DataBind();
                cn1.Close();
                MultiView1.ActiveViewIndex = 2;
            }
            else
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "Thông báo", "<script>alert('Mã sản phẩm hoặc tên sản phẩm chưa có , vui lòng tìm sản phẩm có trong web.');</script>");
                MultiView1.ActiveViewIndex = 2;

            }
        }
         

    }
    protected void btSuaSP_Click(object sender, EventArgs e)
    {
        if (txTenSP_MuonSua.Text.Length > 0 || txDonGia_MuonSua.Text.Length > 0 || txSoLuong_MuonSua.Text.Length > 0 || txXuatXu_MuonSua.Text.Length > 0 || txTrongLuong_MuonSua.Text.Length > 0 || DropDownList_MaLoai_MuonSua.SelectedValue.Length > 0 || DropDownList_TinhTrang_MuonSua.SelectedValue.Length > 0)
        {
            if (txTenSP_MuonSua.Text.Length >0 )
            {
                SqlCommand cmd = new SqlCommand("UPDATE SANPHAM set tenSP=@tenSP  where MaSP=@masp ", cn1);


                cmd.Parameters.AddWithValue("@masp", txMaSP_sua.Text);
                cmd.Parameters.AddWithValue("@tenSP", txTenSP_MuonSua.Text);
                SqlDataAdapter sql = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sql.Fill(dt);
                cn1.Open();
                int rs = cmd.ExecuteNonQuery();
                cn1.Close();
            }
            if (txDonGia_MuonSua.Text.Length > 0)
            {
                SqlCommand cmd = new SqlCommand("UPDATE SANPHAM set donGia=@donGia  where MaSP=@masp ", cn1);


                cmd.Parameters.AddWithValue("@masp", txMaSP_sua.Text);
                cmd.Parameters.AddWithValue("@donGia", txDonGia_MuonSua.Text);
                SqlDataAdapter sql = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sql.Fill(dt);
                cn1.Open();
                int rs = cmd.ExecuteNonQuery();
                cn1.Close();
            }

            if (txSoLuong_MuonSua.Text.Length > 0)
            {
                SqlCommand cmd = new SqlCommand("UPDATE SANPHAM set soLuong=@sl  where MaSP=@masp ", cn1);


                cmd.Parameters.AddWithValue("@masp", txMaSP_sua.Text);
                cmd.Parameters.AddWithValue("@sl", txSoLuong_MuonSua.Text);
                SqlDataAdapter sql = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sql.Fill(dt);
                cn1.Open();
                int rs = cmd.ExecuteNonQuery();
                cn1.Close();
            }

            if (txXuatXu_MuonSua.Text.Length > 0)
            {
                SqlCommand cmd = new SqlCommand("UPDATE SANPHAM set xuatSu=@xx  where MaSP=@masp ", cn1);


                cmd.Parameters.AddWithValue("@masp", txMaSP_sua.Text);
                cmd.Parameters.AddWithValue("@xx", txXuatXu_MuonSua.Text);
                SqlDataAdapter sql = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sql.Fill(dt);
                cn1.Open();
                int rs = cmd.ExecuteNonQuery();
                cn1.Close();
            }
            if (txTrongLuong_MuonSua.Text.Length > 0)
            {
                SqlCommand cmd = new SqlCommand("UPDATE SANPHAM set trongLuong=@tl  where MaSP=@masp ", cn1);


                cmd.Parameters.AddWithValue("@masp", txMaSP_sua.Text);
                cmd.Parameters.AddWithValue("@tl", txTrongLuong_MuonSua.Text);
                SqlDataAdapter sql = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sql.Fill(dt);
                cn1.Open();
                int rs = cmd.ExecuteNonQuery();
                cn1.Close();
            }
            if (DropDownList_TinhTrang_MuonSua.SelectedValue.Length > 0)
            {
                SqlCommand cmd = new SqlCommand("UPDATE SANPHAM set tinhTrang=@tt  where MaSP=@masp ", cn1);


                cmd.Parameters.AddWithValue("@masp", txMaSP_sua.Text);
                cmd.Parameters.AddWithValue("@tt", DropDownList_TinhTrang_MuonSua.SelectedValue);
                SqlDataAdapter sql = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sql.Fill(dt);
                cn1.Open();
                int rs = cmd.ExecuteNonQuery();
                cn1.Close();
            }
            if (DropDownList_MaLoai_MuonSua.SelectedValue.Length > 0)
            {
                SqlCommand cmd = new SqlCommand("UPDATE SANPHAM set MaLoai=@ml  where MaSP=@masp ", cn1);


                cmd.Parameters.AddWithValue("@masp", txMaSP_sua.Text);
                cmd.Parameters.AddWithValue("@ml", DropDownList_MaLoai_MuonSua.SelectedValue);
                SqlDataAdapter sql = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sql.Fill(dt);
                cn1.Open();
                int rs = cmd.ExecuteNonQuery();
                cn1.Close();
            }
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "Thông báo", "<script>alert('Đã sửa  thành công');</script>");
            txMaSP_sua.Text = "";
            txTenSP_sua.Text="";

            txTenSP_MuonSua.Text = "";
            txDonGia_MuonSua.Text = "";
            txXuatXu_MuonSua.Text = "";
            txTrongLuong_MuonSua.Text = "";
            txSoLuong_MuonSua.Text = "";
            MultiView1.ActiveViewIndex = 2;
        }
        else
        {
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "Thông báo", "<script>alert('Bạn chưa nhập gì sao Sửa được');</script>");
            MultiView1.ActiveViewIndex = 2;

           
       
        }
    }
    protected void btXoaSP_Click(object sender, EventArgs e)
    {
        //xoa VITAMIN
        SqlCommand cmd_v = new SqlCommand("delete VITAMIN where MaSP=@masp ", cn1);
        cmd_v.Parameters.AddWithValue("@masp", txMaSP_xoa.Text);
        SqlDataAdapter sql_v = new SqlDataAdapter(cmd_v);
        DataTable dt_v = new DataTable();
        sql_v.Fill(dt_v);
        cn1.Open();
        int rs_v = cmd_v.ExecuteNonQuery();
        cn1.Close();

        //xoa THONGTINSP
        SqlCommand cmd_t = new SqlCommand("delete THONGTINSP where MaSP=@masp ", cn1);
        cmd_t.Parameters.AddWithValue("@masp", txMaSP_xoa.Text);
        SqlDataAdapter sql_t = new SqlDataAdapter(cmd_t);
        DataTable dt_t = new DataTable();
        sql_t.Fill(dt_t);
        cn1.Open();
        int rs_t = cmd_t.ExecuteNonQuery();
        cn1.Close();

        //xoa hinh
        SqlCommand cmd_h = new SqlCommand("delete HINHSP where MaSP=@masp ", cn1);
        cmd_h.Parameters.AddWithValue("@masp", txMaSP_xoa.Text);
        SqlDataAdapter sql_h = new SqlDataAdapter(cmd_h);
        DataTable dt_h = new DataTable();
        sql_h.Fill(dt_h);
        cn1.Open();
        int rs_h = cmd_h.ExecuteNonQuery();
        cn1.Close();

        //xoa chitietsp
        SqlCommand cmd_ct = new SqlCommand("delete CHITIETHD where MaSP=@masp ", cn1);
        cmd_ct.Parameters.AddWithValue("@masp", txMaSP_xoa.Text);
        SqlDataAdapter sql_ct = new SqlDataAdapter(cmd_ct);
        DataTable dt_ct = new DataTable();
        sql_ct.Fill(dt_ct);
        cn1.Open();
        int rs_ct = cmd_ct.ExecuteNonQuery();
        cn1.Close();

        //xoa sanpham
        SqlCommand cmd = new SqlCommand("delete SANPHAM where MaSP=@masp ", cn1);
        cmd.Parameters.AddWithValue("@masp", txMaSP_xoa.Text);
        SqlDataAdapter sql = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sql.Fill(dt);
        cn1.Open();
        int rs = cmd.ExecuteNonQuery();
        cn1.Close();

        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "Thông báo", "<script>alert('Xóa thành công');</script>");
        txMaSP_xoa.Text = "";
        txTenSP_xoa.Text = "";
        MultiView1.ActiveViewIndex = 3;
    }
    protected void btHienThi_Xoa_Click(object sender, EventArgs e)
    {

        SqlCommand kt1 = new SqlCommand("select * from SANPHAM where MaSP=@maSp1 ", cn1);
        kt1.Parameters.AddWithValue("@maSp1", txMaSP_xoa.Text);
        SqlDataAdapter sql1 = new SqlDataAdapter(kt1);
        DataTable dt1 = new DataTable();
        sql1.Fill(dt1);
        cn1.Open();
        int i1 = kt1.ExecuteNonQuery();
        cn1.Close();

        SqlCommand kt2 = new SqlCommand("select * from SANPHAM where tenSP=@tenSP1", cn1);
        kt2.Parameters.AddWithValue("@tenSP1", txTenSP_xoa.Text);
        SqlDataAdapter sql2 = new SqlDataAdapter(kt2);
        DataTable dt2 = new DataTable();
        sql2.Fill(dt2);
        cn1.Open();
        int i2 = kt2.ExecuteNonQuery();
        cn1.Close();

        if (dt1.Rows.Count > 0 && dt2.Rows.Count > 0)
        {
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "Thông báo", "<script>alert('Bạn chỉ được tìm tên hoặc mã, vui lòng tìm 1 trong 2, Tên hoặc mã.Không được tìm cả 2 cùng 1 lúc');</script>");
            MultiView1.ActiveViewIndex = 3;
        }
        else
        {
            SqlCommand kt = new SqlCommand("select * from SANPHAM where MaSP=@maSp or tenSP=@tenSP", cn1);
            kt.Parameters.AddWithValue("@maSp", txMaSP_xoa.Text);
            kt.Parameters.AddWithValue("@tenSP", txTenSP_xoa.Text);
            SqlDataAdapter sql = new SqlDataAdapter(kt);
            DataTable dt = new DataTable();
            sql.Fill(dt);
            cn1.Open();
            int i = kt.ExecuteNonQuery();
            cn1.Close();

            if (dt.Rows.Count > 0)
            {
                cn1.Open();
                //tao cmd
                String strcmd = "select sp.MaSP,tenSP,hinhSP,donGia,soLuong,xuatSu,trongLuong,tinhTrang,MaLoai from SANPHAM sp,HINHSP h where sp.MaSP=h.MaSP and (sp.MaSP='" + txMaSP_xoa.Text + "' or tenSP='" + txTenSP_xoa.Text + "') ";
                SqlDataAdapter da = new SqlDataAdapter(strcmd, cn1);
                DataSet ds = new DataSet();
                da.Fill(ds);

                GridView2.DataSource = ds.Tables[0];
                GridView2.DataBind();
                cn1.Close();

                cn1.Open();
                SqlDataAdapter da_MuonXoa = new SqlDataAdapter("select MaSP,tenSP,donGia,soLuong,xuatSu,trongLuong from SANPHAM where MaSP='" + txMaSP_xoa.Text + "' or tenSP='"+txTenSP_xoa.Text+"' ", cn1);
                DataSet ds_MuonXoa = new DataSet();
                da_MuonXoa.Fill(ds_MuonXoa, "SANPHAM");
                DataList2.DataSource = ds_MuonXoa.Tables["SANPHAM"];
                DataList2.DataBind();
                DataList3.DataSource = ds_MuonXoa.Tables["SANPHAM"];
                DataList3.DataBind();
                cn1.Close();
                MultiView1.ActiveViewIndex = 3;
            }
            else
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "Thông báo", "<script>alert('Mã sản phẩm hoặc tên sản phẩm chưa có , vui lòng tìm sản phẩm có trong web.');</script>");
                MultiView1.ActiveViewIndex = 3;

            }
        }
    }


  
}