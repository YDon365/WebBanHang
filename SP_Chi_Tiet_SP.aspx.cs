using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;
public partial class SP_Chi_Tiet_SP : System.Web.UI.Page
{
    SqlConnection cn1 = new SqlConnection(WebConfigurationManager.ConnectionStrings["strcon"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        cn1.Open();
        //if (cn1.State == ConnectionState.Open)
        //    Response.Write("thanh cong");",cn1);//id,tenSP,sp.MaSP,hinhSP,donGia,hinhTP,tinhTrang,tenCachDung,cachDung,khaiNiemSP,hinh1,ten1,ndTen1, ten2,ndTen2,ten3,ndTen3

        SqlDataAdapter da = new SqlDataAdapter("select id,tenSP,sp.MaSP,hinhSP,donGia,hinhTP,tinhTrang,tenCachDung,cachDung,khaiNiemSP,hinh1,ten1,ndTen1, ten2,ndTen2,ten3,ndTen3 from  HINHSP h,SANPHAM sp ,THONGTINSP tt ,VITAMIN vt "+
                                "where sp.MaSP=h.MaSP and tt.MaSP=sp.MaSP and vt.MaSP=sp.MaSP  and sp.MaSP='" + Request.QueryString["ID"].ToString() + "'", cn1);
        DataSet ds = new DataSet();
        da.Fill(ds, "SANPHAM");

        DataList1.DataSource = ds.Tables["SANPHAM"];
        DataList1.DataBind();
        DataList2.DataSource = ds.Tables["SANPHAM"];
        DataList2.DataBind();
        DataList3.DataSource = ds.Tables["SANPHAM"];
        DataList3.DataBind();
        DataList4.DataSource = ds.Tables["SANPHAM"];
        DataList4.DataBind();
        DataList5.DataSource = ds.Tables["SANPHAM"];
        DataList5.DataBind();
        DataList6.DataSource = ds.Tables["SANPHAM"];
        DataList6.DataBind();
        DataList7.DataSource = ds.Tables["SANPHAM"];
        DataList7.DataBind();
    }

    protected void btnThemVaoGioHang_Click(object sender, EventArgs e)
    {
        SqlConnection cn1 = new SqlConnection(WebConfigurationManager.ConnectionStrings["strcon"].ConnectionString);
        if (Session["tenTK"] == null)
            Response.Redirect("DangNhap.aspx");
        else
        {
            SqlCommand cmd = new SqlCommand("select * from GIOHANG gh, SANPHAM sp,HINHSP h where  sp.MaSP=h.MaSP and gh.MaSP = sp.MaSP and gh.MaSP=@MaSP and gh.MaKH=@MaKH", cn1);
            cmd.Parameters.AddWithValue("@MaKH", Session["tenTK"].ToString());
            cmd.Parameters.AddWithValue("@MaSP", Request.QueryString["ID"].ToString());

            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            cn1.Open();
            int i = cmd.ExecuteNonQuery();
            cn1.Close();

            if (dt.Rows.Count > 0)
            {
                SqlCommand cmdUpdate0 = new SqlCommand("UPDATE GIOHANG set cheDo = 1"
                                                        + "where MaKH = @MaKH and MaSP = @MaSP", cn1);
                cmdUpdate0.Parameters.AddWithValue("@MaKH", Session["tenTK"].ToString());
                cmdUpdate0.Parameters.AddWithValue("@MaSP", Request.QueryString["ID"].ToString());
                cn1.Open();
                i = cmdUpdate0.ExecuteNonQuery();
                cn1.Close();

                SqlCommand cmdUpdate = new SqlCommand("UPDATE GIOHANG set soLuongSP = 1+(select soLuongSP from GIOHANG gh where gh.MaSP=@MaSP and gh.MaKH=@MaKH)"
                                                        + "where MaKH = @MaKH and MaSP = @MaSP", cn1);
                cmdUpdate.Parameters.AddWithValue("@MaKH", Session["tenTK"].ToString());
                cmdUpdate.Parameters.AddWithValue("@MaSP", Request.QueryString["ID"].ToString());
                cn1.Open();
                i = cmdUpdate.ExecuteNonQuery();
                cn1.Close();
            }
            else
            {

                SqlCommand cmdInsert = new SqlCommand("INSERT INTO GIOHANG VALUES(@MaSP,@MaKH, 1,1)", cn1);

                cmdInsert.Parameters.AddWithValue("@MaKH", Session["tenTK"].ToString());
                cmdInsert.Parameters.AddWithValue("@MaSP", Request.QueryString["ID"].ToString());
                cn1.Open();
                int rs = cmdInsert.ExecuteNonQuery();
                cn1.Close();
            }
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "Thông báo", "<script>alert('Đã thêm vào giỏ hàng thành công');</script>");
        }

    }
    
}