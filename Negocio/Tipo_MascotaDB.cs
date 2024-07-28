using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class Tipo_MascotaDB
    {
        private ConexionDB conexionDB = new ConexionDB();

        public List<Tipo_Mascota> ListarActivos()
        {
            try
            {
                List<Tipo_Mascota> lista = new List<Tipo_Mascota>();
                string consulta = "select * from Pet_Types where _State = 1";
                conexionDB.EjecutarConsulta(consulta);
                while (conexionDB.Lector.Read())
                {
                    Tipo_Mascota tipo = new Tipo_Mascota();
                    tipo.ID = Convert.ToInt64(conexionDB.Lector["_ID"]);
                    tipo.Descripcion = conexionDB.Lector["_Description"].ToString();
                    tipo.Estado = true;
                    lista.Add(tipo);
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
