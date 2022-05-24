using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;
public partial class DangKy : System.Web.UI.Page
{
    SqlConnection cn1 = new SqlConnection(WebConfigurationManager.ConnectionStrings["strcon"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((int)Session["DangKy"] == 0)
        {
            MultiView1.ActiveViewIndex = 0;
        }
        else
        {
            MultiView1.ActiveViewIndex = 1;
            if (IsPostBack == false)
            {
                SqlCommand cmd = new SqlCommand("select * from KHACHHANG where MaKH = @ID", cn1);
                cmd.Parameters.AddWithValue("@ID", Session["tenTK"].ToString());

                cn1.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    lbTenDN.Text = dr["MaKH"].ToString().Trim() + " ";
                    lbMatKhau.Text = dr["MatKhau"].ToString().Trim() + " ";
                    lbHoTen.Text = dr["tenKH"].ToString().Trim() + "";
                    lbDienThoai.Text = dr["dienThoai"].ToString().Trim() + "";
                    lbDiaChi.Text = dr["diaChi"].ToString().Trim() + "";
                    lbGioiTinh.Text = dr["gioiTinh"].ToString().Trim() + "";
                    lbEmail.Text = dr["email"].ToString().Trim() + "";
                    lbNgaySinh.Text = dr["ngaySinh"].ToString().Trim() + "";
                }

            }
            cn1.Close();
        
        }
       
    }

    protected void btDangKy_Click(object sender, EventArgs e)
    {

        SqlCommand kt = new SqlCommand("select *from KHACHHANG where MaKH=@tendk", cn1);
        kt.Parameters.AddWithValue("@tendk", txTenDK.Text);

        SqlDataAdapter sql = new SqlDataAdapter(kt);
        DataTable dt = new DataTable();
        sql.Fill(dt);
        cn1.Open();
        int i = kt.ExecuteNonQuery();
        cn1.Close();

        if (dt.Rows.Count > 0 || txNhapLaiMK.Text.Length == 0)
        {
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "Thông báo", "<script>alert('Tên đăng nhập đã có sẵn, vui lòng chọn tên đăng nhập khác.');</script>");
            MultiView1.ActiveViewIndex = 0;
        }
        else
        {

            SqlCommand cmd = new SqlCommand("set dateformat dmy insert into KHACHHANG(MaKH,matKhau,tenKH,dienThoai,diaChi,gioiTinh,email,ngaySinh)"
                                                 + "values( @maKH,@matKhau,@hoTen,@SDT,@diaChi,@gioiTinh,@email,@ngaySinh)", cn1);

            cmd.Parameters.AddWithValue("@maKH", txTenDK.Text);
            cmd.Parameters.AddWithValue("@matKhau", txNhapLaiMK.Text);
            cmd.Parameters.AddWithValue("@hoTen", txHoTen.Text);
            cmd.Parameters.AddWithValue("@SDT", txSDT.Text);
            cmd.Parameters.AddWithValue("@diaChi", txDiaChi.Text);
            cmd.Parameters.AddWithValue("@gioiTinh", radioGioiTinh.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@email", txEmail.Text);
            cmd.Parameters.AddWithValue("@ngaySinh", txNgaySinh.Text);

            cn1.Open();
            int rs = cmd.ExecuteNonQuery();
            cn1.Close();

            if (rs == 1)
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "Thông báo", "<script>alert('Đăng ký thành công, mời bạn đăng nhập');</script>");
                Response.Redirect("DangNhap.aspx");
            }
        }
    }
    protected void btXemDonHang_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 2;
        cn1.Open();
        //tao cmd
        String strcmd = "select * from SANPHAM sp, HINHSP h ,GIOHANG gh where sp.MaSP=h.MaSP and gh.MaSP=sp.MaSP and cheDo=0 and gh.MaKH='"+Session["tenTK"].ToString()+"'  ";//where MaSP='" + txMaSP.Text + "' or tenSP='" + txTenSP + "' ";
        SqlDataAdapter da = new SqlDataAdapter(strcmd, cn1);
        DataSet ds = new DataSet();
        da.Fill(ds);

        GridView1.DataSource = ds.Tables[0];
        GridView1.DataBind();
        cn1.Close();
    }
}

     