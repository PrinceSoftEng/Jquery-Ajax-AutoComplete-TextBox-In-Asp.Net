using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace Jquery_Ajax_AutoComplete_TextBox
{
    public class clsBalUsertoRole
    {
        private string constring = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;

        [WebMethod]
        public List<string> GetRoleNameBySearch(string searchTerm)
        {
            List<string> roles = new List<string>();
            using (SqlConnection con = new SqlConnection(constring))
            {
                using (SqlCommand cmd = new SqlCommand("Select UserName From UserRegTable where UserName LIKE @SearchTerm +'%'", con))
                {
                    cmd.Parameters.AddWithValue("@SearchTerm", searchTerm);
                    con.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        while(sdr.Read())
                        {
                            roles.Add(sdr["UserName"].ToString());
                        }
                    }
                }
            }
            return roles;
        }
    }

}
