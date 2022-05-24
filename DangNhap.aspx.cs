using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;

public partial class DangNhap : System.Web.UI.Page
{
    SqlConnection cn1 = new SqlConnection(WebConfigurationManager.ConnectionStrings["strcon"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 0;
    }

    protected void btDangNhap_Click1(object sender, EventArgs e)
    {
        cn1.Open();
      

        SqlCommand cmd = new SqlCommand("select * from KHACHHANG where MaKH=@tenDN and matKhau=@matKhau", cn1);
        cmd.Parameters.AddWithValue("@tenDN", txTenTK.Text);
        cmd.Parameters.AddWithValue("@matKhau", txMatKhau.Text);

        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable ds = new DataTable();
        da.Fill(ds);

        int rs = cmd.ExecuteNonQuery();
        cn1.Close();
        if (ds.Rows.Count==1)
        {
            Session["TenTK"] = txTenTK.Text;
            Response.Redirect("Home.aspx");
        }
        else
        {

            FailureText.Text = "Tên đăng nhập hoặc mật khẩu không chính xác";  
        }
        
    }
    protected void btQuenMK_Click(object sender, EventArgs e)
    {
        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "Thông báo", "<script>alert('Vui lòng bạn liên hệ số điện thoại 033344400 để được từ vấn');</script>");
        
    }
}