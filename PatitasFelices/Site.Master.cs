using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PatitasFelices
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            OcultarLogo();
        }

        private void OcultarLogo()
        {
            string nombreArchivoAspx = Page.Request.FilePath;
            if (!nombreArchivoAspx.Contains("Index"))
            {
                DivLogo.Visible = false;
            }
        }
    }
}