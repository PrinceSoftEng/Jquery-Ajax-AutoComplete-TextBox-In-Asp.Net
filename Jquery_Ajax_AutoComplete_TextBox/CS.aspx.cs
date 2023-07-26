using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Jquery_Ajax_AutoComplete_TextBox
{
    public partial class CS : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static List<string> GetRolesName(string prefixText)
        {
            List<string> roles = new List<string>();
            string constring = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constring))
            {
                using (SqlCommand cmd = new SqlCommand("Select UserName From UserRegTable where UserName like @SearchText +'%'", con))
                { 
                    con.Open();
                    cmd.CommandType = System.Data.CommandType.Text;
                    cmd.Parameters.AddWithValue("@SearchText", prefixText);
                    using (SqlDataReader sdr= cmd.ExecuteReader())
                    {
                        while(sdr.Read())
                        {
                            roles.Add(sdr["UserName"].ToString());
                        }
                    }
                    con.Close();
                }
            }
            return roles;
        }
    }
}