using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PatitasFelices.Pages
{
    public partial class Adopcion : System.Web.UI.Page
    {
        private MascotaDB mascotaDB = new MascotaDB();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Listar_Mascotas();
            }
        }

        private void Listar_Mascotas()
        {
            RepeaterMascotas.DataSource = mascotaDB.ListarActivas();
            RepeaterMascotas.DataBind();
        }

        protected string GetNumRandom()
        {
            Random numRandom = new Random();
            int seconds = numRandom.Next(2000, 4000);
            return (seconds.ToString());
        }
    }
}