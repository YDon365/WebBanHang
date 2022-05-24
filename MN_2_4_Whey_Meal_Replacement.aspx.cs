using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;
public partial class Whey_Meal_Replacement : System.Web.UI.Page
{
    SqlConnection cn1 = new SqlConnection(WebConfigurationManager.ConnectionStrings["strcon"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        cn1.Open();
        //if (cn1.State == ConnectionState.Open)
        //    Response.Write("thanh cong");

        SqlDataAdapter da = new SqlDataAdapter("select id,sp.MaSP, hinhSP,tenSP,donGia from  HINHSP h,SANPHAM sp where sp.MaSP=h.MaSP and MaLoai='LH05'", cn1);
        DataSet ds = new DataSet();
        da.Fill(ds, "SANPHAM");

        DataList1.DataSource = ds.Tables["SANPHAM"];
        DataList1.DataBind();
        cn1.Close();
    }
    
}