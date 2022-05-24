using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;
public partial class GioHang : System.Web.UI.Page
{
    SqlConnection cn1 = new SqlConnection(WebConfigurationManager.ConnectionStrings["strcon"].ConnectionString);
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["tenTK"] == null)
            Response.Redirect("DangNhap.aspx");
        Title = "Giỏ Hàng";      
    }
    protected void btnCapNhat_Click(object sender, ImageClickEventArgs e)
    {
        int rowthis = ((GridViewRow)(sender as Control).NamingContainer).RowIndex;

        Label lblMSP = (Label)(QLGioHang.Rows[rowthis].Cells[0].Controls[1]);
        TextBox txtSL = (TextBox)(QLGioHang.Rows[rowthis].Cells[3].Controls[1]);

        if (int.Parse(txtSL.Text) > 0)
        {
            DataGioHang.UpdateParameters["soLuongSP"].DefaultValue = txtSL.Text;
            DataGioHang.UpdateParameters["MaSP"].DefaultValue = lblMSP.Text;
            DataGioHang.UpdateParameters["MaKH"].DefaultValue = Session["tenTK"].ToString();
        }

    }
    protected void btnXoa_Click(object sender, ImageClickEventArgs e)
    {
        int rowthis = ((GridViewRow)(sender as Control).NamingContainer).RowIndex;

        Label lblMSP = (Label)(QLGioHang.Rows[rowthis].Cells[0].Controls[1]);
        DataGioHang.DeleteParameters["MaSP"].DefaultValue = lblMSP.Text;
        DataGioHang.DeleteParameters["MaKH"].DefaultValue = Session["tenTK"].ToString();
        //Response.Redirect("~/GioHang.aspx");

    }
    int total = 0;
    protected void QLGioHang_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label lblamount = (Label)e.Row.FindControl("lblTong");
            total += int.Parse(lblamount.Text);
        }
        if (e.Row.RowType == DataControlRowType.Footer)
        {
            Label lblttt = (Label)e.Row.FindControl("lbltt");
            lblttt.Text = total.ToString();
        }
    }
    protected void btThanhToan_Click(object sender, EventArgs e)
    {
        SqlConnection cn1 = new SqlConnection(WebConfigurationManager.ConnectionStrings["strcon"].ConnectionString);
        SqlCommand cmdInsert = new SqlCommand("update GIOHANG set cheDo=0 where MaKH=@MaKH", cn1);
        cmdInsert.Parameters.AddWithValue("@MaKH", Session["tenTK"].ToString());
        cn1.Open();
        int rs = cmdInsert.ExecuteNonQuery();
        cn1.Close();
        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "Thông báo", "<script>alert('Đã mua hàng thành công');</script>");
    }
}