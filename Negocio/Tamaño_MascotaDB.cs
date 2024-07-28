using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class Tamaño_MascotaDB
    {
        private ConexionDB conexionDB = new ConexionDB();

        public List<Tamaño_Mascota> ListarActivos()
        {
            try
            {
                List<Tamaño_Mascota> lista = new List<Tamaño_Mascota>();
                string consulta = "select * from Pet_Sizes where _State = 1";
                conexionDB.EjecutarConsulta(consulta);
                while (conexionDB.Lector.Read())
                {
                    Tamaño_Mascota tamaño = new Tamaño_Mascota();
                    tamaño.ID = Convert.ToInt64(conexionDB.Lector["_ID"]);
                    tamaño.Descripcion = conexionDB.Lector["_Description"].ToString();
                    tamaño.Estado = true;
                    lista.Add(tamaño);
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
