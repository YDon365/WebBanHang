using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
       if(Session["tenTK"]!=null)
       {
           linkBT_DangKy.Text ="Hello, "+ Session["tenTK"].ToString();
           linkBT_DangNhap.Text = "Đăng xuất";
       }
    }

    protected void linkBT_DangNhap_Click(object sender, EventArgs e)
    {
        if (Session["tenTK"] != null)
        {
            Session["tenTK"] = null;
            Response.Redirect("Home.aspx");
            linkBT_DangKy.Text = "Đăng ký";
            linkBT_DangNhap.Text = "Đăng nhập";
        }
        else
        {
            Session["DangNhap"] = 0;
            Response.Redirect("DangNhap.aspx");
        }
    }
    protected void linkBT_DangKy_Click(object sender, EventArgs e)
    {
        if (Session["tenTK"] != null)
        {
            Session["DangKy"] = 1;
            Response.Redirect("DangKy.aspx");
        }
        else
        {
            Session["DangKy"] = 0;
            Response.Redirect("DangKy.aspx");
        }
    }
    protected void linkBT_ThemXoaSua_Click(object sender, EventArgs e)
    {
        if (linkBT_DangKy.Text == "Hello, ADMIN")
         {
             Session["Them_Xoa_Sua_SP"] = 1;
             Response.Redirect("Them_Xoa_Sua_SP.aspx");
         }
         else
         {
             Session["Them_Xoa_Sua_SP"] = 0;
             Response.Redirect("Them_Xoa_Sua_SP.aspx");
        }
    }

    protected void btTimKiem_Click(object sender, ImageClickEventArgs e)
    {
        string tim = txTimKiem.Text;
        if(tim !="")
        {
            Response.Redirect("Tim_Kiem_SP.aspx?search=" + txTimKiem.Text);
        }
    }

    
}
