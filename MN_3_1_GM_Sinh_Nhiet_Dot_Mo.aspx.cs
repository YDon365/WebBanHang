using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;
public partial class GM_Sinh_Nhiet_Dot_Mo : System.Web.UI.Page
{
    SqlConnection cn1 = new SqlConnection(WebConfigurationManager.ConnectionStrings["strcon"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

        cn1.Open();
        //if (cn1.State == ConnectionState.Open)
        //    Response.Write("thanh cong");

        SqlDataAdapter da = new SqlDataAdapter("select id,h.MaSP, hinhSP,tenSP,donGia from  HINHSP h,SANPHAM sp where sp.MaSP=h.MaSP and MaLoai='LH06'", cn1);
        DataSet ds = new DataSet();
        da.Fill(ds, "HINHSP");

        DataList1.DataSource = ds.Tables["HINHSP"];
        DataList1.DataBind();
    }
   
}