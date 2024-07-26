using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Negocio
{
    public class Imagen_MascotaDB
    {
        ConexionDB conexionDB = new ConexionDB();

        public List<Imagen_Mascota> ListarActivas()
        {
            try
            {
                List<Imagen_Mascota> lista = new List<Imagen_Mascota>();
                string consulta = "select * from Pets_Images where _State = 1";
                conexionDB.EjecutarConsulta(consulta);
                while (conexionDB.Lector.Read())
                {
                    Imagen_Mascota img = new Imagen_Mascota();
                    img.ID = Convert.ToInt64(conexionDB.Lector["_ID"]);
                    img.ID_Mascota = Convert.ToInt64(conexionDB.Lector["_Pet_ID"]);
                    img.Link = conexionDB.Lector["_Link"].ToString();
                    img.Alternate_Text = conexionDB.Lector["_Alternate_Text"].ToString();
                    img.Order = Convert.ToInt32(conexionDB.Lector["_Order"]);
                    img.Estado = true;
                    lista.Add(img);
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

        public List<Imagen_Mascota> ListarPorMascota(long ID_Mascota)
        {
            try
            {
                List<Imagen_Mascota> lista = new List<Imagen_Mascota>();
                string consulta = "select * from Pets_Images where _Pet_ID = " + ID_Mascota;
                conexionDB.EjecutarConsulta(consulta);
                while (conexionDB.Lector.Read())
                {
                    Imagen_Mascota img = new Imagen_Mascota();
                    img.ID = Convert.ToInt64(conexionDB.Lector["_ID"]);
                    img.ID_Mascota = Convert.ToInt64(conexionDB.Lector["_Pet_ID"]);
                    img.Link = conexionDB.Lector["_Link"].ToString();
                    img.Alternate_Text = conexionDB.Lector["_Alternate_Text"].ToString();
                    img.Order = Convert.ToInt32(conexionDB.Lector["_Order"]);
                    img.Estado = true;
                    if (Convert.ToInt32(conexionDB.Lector["_State"]) == 0)
                    {
                        img.Estado = false;
                    }
                    if (img.Estado)
                    {
                        lista.Add(img);
                    }
                }
                return lista;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
