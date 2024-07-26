using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Negocio
{
    public class MascotaDB
    {
        private ConexionDB conexionDB = new ConexionDB();
        private Imagen_MascotaDB imagen_MascotaDB = new Imagen_MascotaDB();
        private List<Imagen_Mascota> lista_imagenes = new List<Imagen_Mascota>();

        private List<Imagen_Mascota> ListarImagenes()
        {
            lista_imagenes = imagen_MascotaDB.ListarActivas();
            return lista_imagenes;
        }

        public List<Mascota> ListarActivas()
        {
            try
            {
                ListarImagenes();
                List<Mascota> lista = new List<Mascota>();
                string consulta = "select * from Pets_List where _State = 1";
                conexionDB.EjecutarConsulta(consulta);
                while (conexionDB.Lector.Read())
                {
                    Mascota mascota = new Mascota();
                    mascota.ID = Convert.ToInt64(conexionDB.Lector["_ID"]);
                    mascota.Nombre = conexionDB.Lector["_Name"].ToString();
                    mascota.Edad = conexionDB.Lector["_Age"].ToString();
                    mascota.Raza = conexionDB.Lector["_Breed"].ToString();
                    mascota.Color = conexionDB.Lector["_Color"].ToString();
                    mascota.Sexo.ID = Convert.ToInt64(conexionDB.Lector["_ID_Sex"]);
                    mascota.Sexo.Descripcion = conexionDB.Lector["_Description_Sex"].ToString();
                    mascota.Tipo.ID = Convert.ToInt64(conexionDB.Lector["_ID_Type"]);
                    mascota.Tipo.Descripcion = conexionDB.Lector["_Description_Type"].ToString();
                    mascota.Ubicacion = conexionDB.Lector["_Location"].ToString();
                    foreach (Imagen_Mascota img in lista_imagenes)
                    {
                        if (img.ID_Mascota == mascota.ID)
                        {
                            mascota.Imagenes.Add(img);
                        }
                    }
                    mascota.Link = conexionDB.Lector["_Link"].ToString();
                    mascota.Estado = true;
                    lista.Add(mascota);
                }
                return lista;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                conexionDB.CerrarConexion();
            }
        }
    }
}
