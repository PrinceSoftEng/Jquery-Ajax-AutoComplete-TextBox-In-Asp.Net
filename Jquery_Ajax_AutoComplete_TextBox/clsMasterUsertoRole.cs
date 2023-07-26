using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Jquery_Ajax_AutoComplete_TextBox
{
    public class clsMasterUsertoRole
    {
        public List<string> GetRoleNameBySearch(string searchTerm)
        {
            clsBalUsertoRole objBalUTR = new clsBalUsertoRole();
            return objBalUTR.GetRoleNameBySearch(searchTerm);
        }
    }
}