using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class Comportamiento_MascotaDB
    {
        private ConexionDB conexionDB = new ConexionDB();

        public List<Comportamiento_Mascota> ListarActivos()
        {
			try
			{
                List<Comportamiento_Mascota> lista = new List<Comportamiento_Mascota>();
                string consulta = "select * from Pet_Behaviors where _State = 1";
                conexionDB.EjecutarConsulta(consulta);
                while (conexionDB.Lector.Read())
                {
                    Comportamiento_Mascota comportamiento = new Comportamiento_Mascota();
                    comportamiento.ID = Convert.ToInt64(conexionDB.Lector["_ID"]);
                    comportamiento.Descripcion = conexionDB.Lector["_Description"].ToString();
                    comportamiento.Estado = true;
                    lista.Add(comportamiento);
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
