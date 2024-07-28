using Negocio;
using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PatitasFelices
{
    public partial class Adopcion : System.Web.UI.Page
    {
        private Comportamiento_MascotaDB comportamientoDB = new Comportamiento_MascotaDB();
        private Sexo_MascotaDB sexoDB = new Sexo_MascotaDB();
        private Tamaño_MascotaDB tamañoDB = new Tamaño_MascotaDB();
        private Tipo_MascotaDB tipoDB = new Tipo_MascotaDB();
        private MascotaDB mascotaDB = new MascotaDB();
        private List<Mascota> listaMascotas = new List<Mascota>();
        string strPaginacion = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Listar_Mascotas();
                CargarValoresFiltros();
            }
        }

        private void Listar_Mascotas()
        {
            try
            {
                listaMascotas = mascotaDB.ListarActivas();
                PagedDataSource objPds = CargarPaginacion();
                RepeaterMascotas.DataSource = objPds;
                RepeaterMascotas.DataBind();
            }
            catch
            {
                Response.Redirect("Adopcion.aspx?IDP=1");
            }
        }

        private void CargarValoresFiltros()
        {
            CargarDdlComportamientos();
            CargarDdlEdades();
            CargarDdlSexos();
            CargarDdlTamaños();
            CargarDdlTipos();
        }

        private void CargarDdlComportamientos()
        {
            try
            {
                DdlComportamientos.DataSource = comportamientoDB.ListarActivos();
                DdlComportamientos.DataMember = "datos";
                DdlComportamientos.DataTextField = "Descripcion";
                DdlComportamientos.DataValueField = "ID";
                DdlComportamientos.DataBind();
            }
            catch
            {

            }
        }

        private void CargarDdlEdades()
        {
            try
            {
                List<string> listaEdades = listaMascotas
                .Select(mascota => mascota.Edad.ToString())
                .Distinct()
                .OrderBy(edad => edad)
                .ToList();
                DdlEdades.DataSource = listaEdades;
                DdlEdades.DataBind();
            }
            catch
            {

            }
        }

        private void CargarDdlSexos()
        {
            try
            {
                DdlSexos.DataSource = sexoDB.ListarActivos();
                DdlSexos.DataMember = "datos";
                DdlSexos.DataTextField = "Descripcion";
                DdlSexos.DataValueField = "ID";
                DdlSexos.DataBind();
            }
            catch
            {

            }
        }

        private void CargarDdlTamaños()
        {
            try
            {
                DdlTamaños.DataSource = tamañoDB.ListarActivos();
                DdlTamaños.DataMember = "datos";
                DdlTamaños.DataTextField = "Descripcion";
                DdlTamaños.DataValueField = "ID";
                DdlTamaños.DataBind();
            }
            catch
            {

            }
        }

        private void CargarDdlTipos()
        {
            try
            {
                DdlTipos.DataSource = tipoDB.ListarActivos();
                DdlTipos.DataMember = "datos";
                DdlTipos.DataTextField = "Descripcion";
                DdlTipos.DataValueField = "ID";
                DdlTipos.DataBind();
            }
            catch
            {

            }
        }

        protected string GetNumRandom()
        {
            Random numRandom = new Random();
            int seconds = numRandom.Next(2000, 4000);
            return (seconds.ToString());
        }

        private PagedDataSource CargarPaginacion()
        {
            PagedDataSource objPds = new PagedDataSource();
            objPds.DataSource = listaMascotas;
            objPds.AllowPaging = true;
            objPds.PageSize = 12;
            int CurPage;
            if (Request.QueryString["IDP"] != null)
                CurPage = Convert.ToInt32(Request.QueryString["IDP"]);
            else
                CurPage = 1;
            objPds.CurrentPageIndex = CurPage - 1;
            strPaginacion = "";

            if (CurPage > objPds.PageCount)
            {
                Response.Redirect("Adopcion.aspx?IDP=1");
            }
            else
            {
                if (listaMascotas.Count <= objPds.PageSize)
                {
                    if (CurPage != 1)
                    {
                        Response.Redirect("Adopcion.aspx?IDP=1");
                    }
                    strPaginacion += "<li class='page-item'> (Página " + CurPage.ToString() + " de " + objPds.PageCount.ToString() + ")</li><div style='display: flex;'>";
                }
                else
                {
                    //Armado de Texto de página x de y
                    if (objPds.PageCount > 0)
                        //strPaginacion += "<li class='page-item'> (Página " + CurPage.ToString() + " de " + objPds.PageCount.ToString() + ")</li><div style='display: flex;'>";

                    //Validaciones para links de números de página
                    if (!objPds.IsFirstPage && CurPage < 2)
                        if (strPaginacion != "")
                            strPaginacion += "<a href='Adopcion.aspx?IDP=" + Convert.ToString(CurPage - 1) + "' class='page-link'>" + (CurPage - 1).ToString() + "</a>";
                        else
                            strPaginacion = "<a href='Adopcion.aspx?IDP=" + Convert.ToString(CurPage - 1) + "' class='page-link'>" + (CurPage - 1).ToString() + "</a>";

                    if (objPds.PageCount > 2 && CurPage >= 2 && CurPage != objPds.PageCount)
                    {
                        //Página anterior
                        strPaginacion += "<a href='Adopcion.aspx?IDP=" + Convert.ToString(CurPage - 1) + "' class='page-link'>" + (CurPage - 1).ToString() + "</a>";

                        //Página actual
                        strPaginacion += "<span class='page-link actual-page'>" + (CurPage).ToString() + "</span>";

                        //Página siguiente
                        strPaginacion += "<li class='page-item'>" +
                                            "<a href = 'Adopcion.aspx?IDP=" + Convert.ToString(CurPage + 1) + "' class='page-link'>" + (CurPage + 1).ToString() + "</a>" +
                                         "</li></div>";
                    }

                    if (CurPage == 1)
                    {
                        //Página actual
                        strPaginacion += "<span class='page-link actual-page'>" + (CurPage).ToString() + "</span>";

                        //Página siguiente
                        strPaginacion += "<li class='page-item'>" +
                                            "<a href = 'Adopcion.aspx?IDP=" + Convert.ToString(CurPage + 1) + "' class='page-link'>" + (CurPage + 1).ToString() + "</a>" +
                                         "</li></div>";
                    }

                    if (CurPage == objPds.PageCount)
                    {
                        //Página anterior
                        strPaginacion += "<div><a href='Adopcion.aspx?IDP=" + Convert.ToString(CurPage - 1) + "' class='page-link'>" + (CurPage - 1).ToString() + "</a>";

                        //Página actual
                        strPaginacion += "<span class='page-link actual-page'>" + (CurPage).ToString() + "</span></div>";
                    }
                }
            }
            return objPds;
        }

        protected string GetPaginacion()
        {
            return (strPaginacion);
        }
    }
}