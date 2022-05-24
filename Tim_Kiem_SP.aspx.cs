using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;
public partial class hien_Thi_SP : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        //timSP.SelectCommand = "select * from SANPHAM sp, HINHSP h where sp.MaSP = h.MaSP and tenSP like '%' + N'" + Request.QueryString["search"].ToString() + "' + '%'";
        if ((string)Request.QueryString["search"] != null)
        {
            timSP.SelectCommand = "select * from SANPHAM sp, HINHSP h,LOAIHANG l where sp.MaLoai=l.MaLoai and sp.MaSP = h.MaSP and tenSP like '%' + N'" + Request.QueryString["search"].ToString() + "' + '%' ";
        }   
    }
}