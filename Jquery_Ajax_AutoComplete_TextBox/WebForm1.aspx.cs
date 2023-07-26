using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Jquery_Ajax_AutoComplete_TextBox
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static List<string> GetRoleNameBySearch(string searchTerm)
        {
            clsMasterUsertoRole objMasterUTR = new clsMasterUsertoRole();
            List<string> data = objMasterUTR.GetRoleNameBySearch(searchTerm);
            return data;
        }
    }
}